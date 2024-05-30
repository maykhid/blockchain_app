import 'package:blockchain_app/app/features/auth/ui/cubit/authentication_cubit/authentication_cubit.dart';
import 'package:blockchain_app/app/features/auth/ui/views/screens/sign_in_screen.dart';
import 'package:blockchain_app/app/features/home/ui/home_screen.dart';
import 'package:blockchain_app/app/features/transaction/data/model/raw_block_response.dart';
import 'package:blockchain_app/app/features/transaction/data/model/tezos_blocks_response.dart';
import 'package:blockchain_app/app/features/transaction/ui/views/screens/tezos_transaction_details_screen.dart';
import 'package:blockchain_app/app/features/transaction/ui/views/screens/tezos_transaction_screen.dart';
import 'package:blockchain_app/app/features/transaction/ui/views/screens/transaction_details_screen.dart';
import 'package:blockchain_app/app/features/transaction/ui/views/screens/transaction_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static List<GoRoute> routes(AuthenticationCubit cubit) => [
    GoRoute(
      path: '/',
      name: 'auth',
      builder: (context, state) => const SignInScreen(),
      redirect: (context, state) {
            final state = cubit.state;
            if (state is AuthenticatedState) {
              return '/home';
            }
            return null;
          },
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/transaction',
      name: 'transaction',
      builder: (context, state) => const TransactionScreen(),
    ),

    GoRoute(
      path: '/tezosTransaction',
      name: 'tezosTransaction',
      builder: (context, state) => const TezosTransactionScreen(),
    ),

    GoRoute(
      path: '/transactionDetails',
      name: 'transactionDetails',
      builder: (context, state) {
        final tx = state.extra! as Tx;
        return TransactionDetailsScreen(
          transaction: tx,
        );
      },
    ),

    GoRoute(
      path: '/tezosTransactionDetails',
      name: 'tezosTransactionDetails',
      builder: (context, state) {
        final tx = state.extra! as TezosBlocksResponse;
        return TezosTransactionDetailsScreen(
          transaction: tx,
        );
      },
    ),
  ];
}
