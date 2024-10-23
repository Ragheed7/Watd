// lib/features/login/presentation/login_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/helpers/spacing.dart';
import 'package:waie/features/login/logic/cubit/login_cubit.dart';
import 'package:waie/features/login/presentation/widgets/bottom_text_widget.dart';
import 'package:waie/features/login/presentation/widgets/logo_image_widget.dart';
import 'package:waie/features/login/presentation/widgets/login_bloc_listener.dart';
import 'package:waie/features/login/presentation/widgets/phone_number_form_widget.dart';
import 'package:waie/features/login/presentation/widgets/signIn_button_widget.dart';
import 'package:waie/features/login/presentation/widgets/signIn_title_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      verticalSpace(80),
                      const LogoImageWidget(),
                      verticalSpace(48),
                      const SignInTitleWidget(),
                      verticalSpace(32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PhoneNumberFormWidget(formKey: formState),
                            verticalSpace(64),
                            SignInButtonWidget(
                              formKey: formState,
                            ),
                            verticalSpace(8),
                          ],
                        ),
                      ),
                      const BottomTextButtonsWidget(),
                    ],
                  ),
                ),
              ),
              // const BottomTextButtonsWidget(),
            ],
          ),
          const LoginBlocListener(),
        ],
      ),
    );
  }
}
