import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:waie/core/helpers/constants.dart';
import 'package:waie/core/helpers/shared_prefs_helper.dart';
import 'package:waie/core/networking/dio_factory.dart';
import 'package:waie/features/login/data/model/login_request_body.dart';
import 'package:waie/features/login/data/repository/login_repo.dart';
import 'package:waie/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final LoginRepo _loginRepo;

  final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

void emitLoginStates() async {
    emit(const LoginState.loading());

    final response = await _loginRepo.login(
      LoginRequestBody(
        phone: phoneController.text,
      ),
    );
    response.when(
      success: (loginResponse) async {
        await saveUserToken(
          loginResponse.result?.tokens?.accessToken ?? "",
        );
        emit(
          LoginState.success(loginResponse),
        );
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message ?? ""));
      },
    );
  }

    Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

   @override
  Future<void> close() {
    phoneController.dispose();
    return super.close();
  }
}



