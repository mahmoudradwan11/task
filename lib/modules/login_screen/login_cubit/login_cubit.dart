import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/models/Login_model/login_model.dart';
import 'package:task/modules/login_screen/login_cubit/login_states.dart';
import 'package:task/shared/components/end.dart';
import 'package:task/shared/network/remote/dio_helper.dart';
class LoginCubit extends Cubit<LoginState>{

  LoginCubit() : super(LoginInitState());
  static LoginCubit get(context)=>BlocProvider.of(context);
  LoginModel? userLogin;
  IconData suffixIcon = Icons.visibility;
  bool passwordShow = true;
  void loginUser({required String email, required String password})
  {
    emit(LoadingUserLogin());
    DioHelper.postData(url:LOGIN, data:{
      'email':email,
      'password':password,
    }
    ).then((value){
      userLogin = LoginModel.fromJson(value.data);
      emit(LoginUserSuccessState(userLogin!));
    }).catchError((error){
      print(error.toString());
      emit(LoginUserFailedState(error.toString()));
    });
  }
  void changePasswordIcon()
  {
    passwordShow = !passwordShow;
    suffixIcon = passwordShow?Icons.visibility:Icons.visibility_off_outlined;
    emit(ChangeUserPasswordVisState());
  }



}