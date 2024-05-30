import 'package:blockchain_app/app/features/auth/ui/cubit/authentication_cubit/authentication_cubit.dart';
import 'package:blockchain_app/app/features/auth/ui/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:blockchain_app/app/shared/ui/app_button.dart';
import 'package:blockchain_app/app/shared/ui/app_colors.dart';
import 'package:blockchain_app/app/shared/ui/app_icons.dart';
import 'package:blockchain_app/app/shared/ui/app_text_field.dart';
import 'package:blockchain_app/app/shared/utils/sized_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: SvgPicture.asset(
          AppIcons.back,
          fit: BoxFit.scaleDown,
        ),
      ),
      body: BlocProvider<SignInCubit>(
        create: (context) => SignInCubit(
          authenticationCubit: context.read<AuthenticationCubit>(),
        ),
        child: const SignInView(),
      ),
    );
  }
}

class SignInView extends StatefulWidget {
  const SignInView({
    super.key,
  });

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // log in invite
          const Text(
            'Log in to your account',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),

          const Gap(8),

          //
          const Text(
            'Welcome back! Please enter your registered\nemail address to continue',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),

          const Gap(20),
          const Text('Email address'),

          const Gap(10),

          const _EmailTextField(),

          const Gap(20),
          const Text('Password'),
          const Gap(10),

          // password text field
          BlocBuilder<SignInCubit, SignInState>(
            buildWhen: (previous, current) =>
                previous.password != current.password,
            builder: (context, state) {
              final cubit = context.read<SignInCubit>();
              return AppTextField(
                obscureText: isHidden,
                onChanged: (password) => cubit.passwordChanged(password!),
                errorText: state.password.displayError != null
                    ? ' invalid password'
                    : null,
                suffixIcon: IconButton(
                  color: AppColors.black.withOpacity(0.6),
                  icon: FaIcon(
                    size: 15,
                    isHidden ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                  ),
                  onPressed: () => setState(() {
                    isHidden = !isHidden;
                  }),
                ),
              );
            },
          ),

          const Spacer(),

          BlocBuilder<SignInCubit, SignInState>(
            builder: (context, state) {
              return AppButton(
                text: 'Continue',
                height: 48,
                width: context.width,
                backgroundColor: AppColors.green,
                onPressed: state.isValid
                    ? () {
                        context.read<SignInCubit>().signIn();
                      }
                    : null,
                isLoading: state.status == FormzSubmissionStatus.inProgress,
              );
            },
          ),

          const Gap(20),
        ],
      ),
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return AppTextField(
          onChanged: (email) =>
              context.read<SignInCubit>().emailChanged(email!),
          errorText: state.email.displayError != null ? ' invalid email' : null,
        );
      },
    );
  }
}
