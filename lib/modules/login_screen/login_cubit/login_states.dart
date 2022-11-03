import 'package:task/models/Login_model/login_model.dart';

abstract class LoginState{}
class LoadingUserLogin extends LoginState{}
class LoginInitState extends LoginState{}
class LoginUserSuccessState extends LoginState{
  final LoginModel model;
  LoginUserSuccessState(this.model);
}
class LoginUserFailedState extends LoginState
{
  final String error;
  LoginUserFailedState(this.error);
}
class ChangeUserPasswordVisState extends LoginState{}


