import 'package:blockchain_app/app/features/auth/ui/cubit/authentication_cubit/authentication_cubit.dart';
import 'package:blockchain_app/app/shared/ui/app_colors.dart';
import 'package:blockchain_app/app/shared/ui/app_divider.dart';
import 'package:blockchain_app/app/shared/ui/app_icons.dart';
import 'package:blockchain_app/app/shared/ui/app_images.dart';
import 'package:blockchain_app/app/shared/ui/app_text_styles.dart';
import 'package:blockchain_app/app/shared/utils/sized_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthenticationCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: authCubit.signOut,
          child: SvgPicture.asset(
            AppIcons.scan,
            fit: BoxFit.scaleDown,
          ),
        ),

        // title
        title: const Text('Explore'),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          SvgPicture.asset(
            AppIcons.search,
            fit: BoxFit.scaleDown,
          ),

          const Gap(17),

          //
          SvgPicture.asset(
            AppIcons.bell,
            fit: BoxFit.scaleDown,
          ),

          const Gap(12),
        ],
      ),
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(15),
                  MyBalance(),
                  Gap(10),
                  Amount(),
                  Gap(12),
                ],
              ),
            ),
            const AppDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // my assets
                      Text(
                        'My assets',
                        style: AppTextStyles.semiBoldBlack,
                      ),

                      Text(
                        'See all',
                        style: AppTextStyles.semiBoldGreen,
                      ),
                    ],
                  ),

                  const Gap(10),

                  // asset
                  const Asset(
                    assetName: 'Bitcoin',
                    assetAmount: '₦20,000.00',
                    assetSymbol: 'BTC',
                    assetPercentile: '7.5%',
                    assetLogo: AppIcons.bitcoin,
                  ),

                  const Gap(15),

                  const Asset(
                    assetName: 'Ethereum',
                    assetAmount: '₦12,000.00',
                    assetSymbol: 'ETH',
                    assetPercentile: '2.5%',
                    assetLogo: AppIcons.ethereum,
                    isBullish: false,
                  ),

                  const Gap(15),

                  const Asset(
                    assetName: 'Tezos',
                    assetAmount: '₦5,000.00',
                    assetSymbol: 'XTZ',
                    assetPercentile: '9.60%',
                    assetLogo: AppIcons.tezos,
                  ),
                ],
              ),
            ),

            const Gap(10),

            const AppDivider(),

            // const Gap(15),

            // today's movers
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's Top Movers",
                    style: AppTextStyles.semiBoldBlack,
                  ),
                  Text(
                    'See all',
                    style: AppTextStyles.semiBoldGreen,
                  ),
                ],
              ),
            ),

            // const Gap(15),

            SizedBox(
              height: 127,
              // width: context.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    TopMover(
                      assetIcon: AppIcons.bitcoin,
                      assetName: 'Bitcoin',
                      isBullish: false,
                      percentile: '7.3%',
                      onPressed: () => context.push('/transaction'),
                    ),
                    const Gap(5),
                    TopMover(
                      assetName: 'Tezos',
                      percentile: '7.3%',
                      assetIcon: AppIcons.tezos,
                      onPressed: () => context.push('/tezosTransaction'),
                    ),
                    const Gap(5),
                    const TopMover(
                      assetName: 'Ethereum',
                      percentile: '7.3%',
                      assetIcon: AppIcons.ethereum,
                    ),
                    const Gap(5),
                    const TopMover(
                      assetName: 'Solana',
                      assetIcon: AppIcons.solana,
                      percentile: '7.3%',
                      isBullish: false,
                    ),
                  ],
                ),
              ),
            ),

            const Gap(10),

            const AppDivider(),

            const Gap(10),

            // trending news
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trending news',
                        style: AppTextStyles.semiBoldBlack,
                      ),
                      Text(
                        'View more',
                        style: AppTextStyles.semiBoldGreen,
                      ),
                    ],
                  ),

                  const Gap(20),

                  //
                  Container(
                    width: context.width,
                    height: 166,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                          AppImages.elon,
                        ),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  const Gap(20),

                  Text(
                    '''Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy''',
                    style: AppTextStyles.smallBlack,
                  ),

                  const Gap(10),

                  Text(
                    'CoinDesk • 2h',
                    style: AppTextStyles.smallGrey,
                  ),

                  const Gap(10),

                  const AppDivider(),

                  ListView(
                    shrinkWrap: true,
                    children: const [
                      MoreNewsItem(),
                      AppDivider(),
                      MoreNewsItem(),
                      AppDivider(),
                      MoreNewsItem(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreNewsItem extends StatelessWidget {
  const MoreNewsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          Container(
            height: 73,
            width: 55,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                  AppImages.elon,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const Gap(12),

          //
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.width * 0.74,
                child: Text(
                  '''Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy''',
                  style: AppTextStyles.smallBlack,
                ),
              ),
              const Gap(8),
              Text(
                'CoinDesk • 2h',
                style: AppTextStyles.smallGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TopMover extends StatelessWidget {
  const TopMover({
    required this.assetName,
    required this.percentile,
    required this.assetIcon,
    super.key,
    this.isBullish = true,
    this.onPressed,
  });
  final String assetName;
  final String percentile;
  final String assetIcon;
  final bool? isBullish;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 127,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // asset icon
            CircleAvatar(
              child: SvgPicture.asset(
                assetIcon,
                fit: BoxFit.scaleDown,
              ),
            ),

            // asset name
            Text(assetName),

            // asset percentile
            Row(
              children: [
                SvgPicture.asset(
                  isBullish! ? AppIcons.upwardArrow : AppIcons.downwardArrow,
                  fit: BoxFit.scaleDown,
                ),
                const Gap(5),
                Text(
                  percentile,
                  style: isBullish!
                      ? AppTextStyles.smallGreen
                      : AppTextStyles.smallRed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Asset extends StatelessWidget {
  const Asset({
    required this.assetName,
    required this.assetSymbol,
    required this.assetLogo,
    required this.assetAmount,
    required this.assetPercentile,
    this.isBullish = true,
    super.key,
  });

  final String assetName;
  final String assetSymbol;
  final String assetLogo;
  final String assetAmount;
  final String assetPercentile;
  final bool? isBullish;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // asset logo and name
        Row(
          children: [
            CircleAvatar(
              child: SvgPicture.asset(assetLogo),
            ),
            const Gap(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  assetName,
                  style: AppTextStyles.normal,
                ),
                Text(
                  assetSymbol,
                  style: AppTextStyles.smallGrey,
                ),
              ],
            ),
          ],
        ),

        // price
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              assetAmount,
              style: AppTextStyles.normal,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  isBullish! ? AppIcons.upwardArrow : AppIcons.downwardArrow,
                  fit: BoxFit.scaleDown,
                ),
                const Gap(5),
                Text(
                  assetPercentile,
                  style: isBullish!
                      ? AppTextStyles.smallGreen
                      : AppTextStyles.smallRed,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class Amount extends StatelessWidget {
  const Amount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '₦',
        style: AppTextStyles.smallBoldBlack,
        children: [
          TextSpan(
            text: '5,000',
            style: AppTextStyles.largeBoldBlack,
          ),
          TextSpan(
            text: '.00',
            style: AppTextStyles.smallBoldBlack,
          ),
        ],
      ),
    );
  }
}

class MyBalance extends StatelessWidget {
  const MyBalance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'My balance',
          style: AppTextStyles.smallGrey,
        ),
        const Gap(5),
        Icon(
          Icons.remove_red_eye,
          size: 16,
          color: AppColors.black.withOpacity(0.6),
        ),
      ],
    );
  }
}
