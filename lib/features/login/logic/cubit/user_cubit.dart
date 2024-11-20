import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/shared_models/user_data/user_data.dart';

class UserCubit extends Cubit<UserData?> {
  UserCubit() : super(null);

  void setUser(UserData? userData) {
    emit(userData);
  }

  void clearUser() {
    emit(null);
  }
}
