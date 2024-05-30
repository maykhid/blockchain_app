import 'package:blockchain_app/app/features/auth/data/authentication_repository.dart';
import 'package:blockchain_app/app/features/auth/ui/cubit/authentication_cubit/authentication_cubit.dart';
import 'package:blockchain_app/core/di/di.dart';
import 'package:blockchain_app/core/navigation/app_navigation_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BlockchainApp extends StatelessWidget {
  const BlockchainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationCubit>(
      create: (context) => AuthenticationCubit(
        authenticationRepository: locator<AuthenticationRepository>(),
      ),
      child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
              textTheme: GoogleFonts.poppinsTextTheme(),
              useMaterial3: false,
            ),
            routerConfig:
                AppRouterConfig.goRouter(context.read<AuthenticationCubit>()),
          );
        },
      ),
    );
  }
}
