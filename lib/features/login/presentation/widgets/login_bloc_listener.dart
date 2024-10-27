import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/routing/routes.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/login/logic/cubit/login_cubit.dart';
import 'package:waie/features/login/logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            // Show loading indicator
            showDialog(
              context: context,
              barrierDismissible: false, // Prevent closing while loading
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainGreen,
                ),
              ),
            );
          },
          success: (loginResponse) {
            Navigator.of(context).pop(); // Close the loading dialog
             // Get the phone number from the LoginCubit
            final loginCubit = context.read<LoginCubit>();
            String phoneNumber = loginCubit.phoneController.text;

            // Navigate to OTPScreen with the phone number
            Navigator.of(context).pushNamed(
              Routes.otpScreen,
              arguments: {'phoneNumber': phoneNumber},
            );
          },
          error: (error) {
            Navigator.of(context).pop(); // Close the loading dialog
            setUpErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setUpErrorState(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'cabin',
            fontWeight: FontWeight.w500,
            color: ColorsManager.mainBlack,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the error dialog
            },
            child: const Text(
              "Got it",
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'cabin',
                fontWeight: FontWeight.w400,
                color: ColorsManager.mainBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
