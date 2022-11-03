import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/layout/Home_Screen.dart';
import 'package:task/modules/login_screen/login_cubit/login_cubit.dart';
import 'package:task/modules/login_screen/login_cubit/login_states.dart';
import 'package:task/shared/components/components.dart';
import 'package:task/shared/components/end.dart';
import 'package:task/shared/network/local/cache_helper.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var userPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
        if (state is LoginUserSuccessState) {
          if (state.model.user!.id == 82) {
            print(state.model.user!.name);
            print(state.model.token);
            CacheHelper.saveData(key: 'token', value: state.model.token)
                .then((value) {
              token = state.model.token;
              showMessageToast(
                  '${state.model.user!.name}', ToastMessageStates.SUCCESS);
              navigateAndFinishThisScreen(context, HomeAppScreen());
            });
          } else {
            // print(state);
          }
        }
      }, builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return Scaffold(
          body: Stack(
            children: [
              const Positioned(
                top: 25,
                left: -400,
                child: CircleAvatar(
                  radius: 300,
                  backgroundImage: AssetImage('images/circle_pink.png'),
                ),
              ),
              const Positioned(
                //top: 40,
                //right: -400,
                bottom: -300,
                left: -100,
                child: CircleAvatar(
                  radius: 400,
                  backgroundImage: AssetImage('images/circle_yellow.png'),
                ),
              ),
              const Positioned(
                top: -100,
                right: -400,
                child: CircleAvatar(
                  radius: 350,
                  backgroundImage: AssetImage('images/circle_pup.png'),
                ),
              ),
              const Positioned(
                top: 50,
                left: 10,
                //left: -400,
                child: Image(
                  // height: 150,
                  width: 200,
                  image: AssetImage('images/line.png'),
                ),
              ),
              const Positioned(
                top: 60,
                left: 10,
                //left: -400,
                child: Image(
                  // height: 150,
                  width: 200,
                  image: AssetImage('images/line.png'),
                ),
              ),
              const Positioned(
                top: 70,
                left: 10,
                //left: -400,
                child: Image(
                  // height: 150,
                  width: 200,
                  image: AssetImage('images/line.png'),
                ),
              ),
              const Positioned(
                top: 80,
                left: 10,
                //left: -400,
                child: Image(
                  // height: 150,
                  width: 200,
                  image: AssetImage('images/line.png'),
                ),
              ),
              const Positioned(
                top: 90,
                left: 10,
                //left: -400,
                child: Image(
                  // height: 150,
                  width: 200,
                  image: AssetImage('images/line.png'),
                ),
              ),
              const Positioned(
                top: 60,
                left: 100,
                //left: -400,
                child: Image(
                  image: AssetImage('images/camera.png'),
                ),
              ),
              const Positioned(
                top: 200,
                left: 160,
                child: Text(
                  'My',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  maxLines: 2,
                ),
              ),
              const Positioned(
                top: 250,
                left: 115,
                child: Text(
                  'Gallary',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  maxLines: 2,
                ),
              ),
              Positioned(
                top: 350,
                left: 50,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30)),
                  height: 350,
                  width: 300,
                  child: Form(
                    key: formKey,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        const Text(
                          'Log in',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 260,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)),
                          height: 55,
                          child: Center(
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: userNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter UserName';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'User Name',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 260,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)),
                          height: 55,
                          child: Center(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter your password';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              controller: userPasswordController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                        ),
                        const Spacer(),
                        defAppButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                cubit.loginUser(
                                    email: userNameController.text,
                                    password: userPasswordController.text);
                              }
                            },
                            text: 'Submit',
                            isUpper: false,
                            width: 260)
                      ],
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 340,
                right: 40,
                //left: -400,
                child: Image(
                  width: 120,
                  image: AssetImage('images/circle.png'),
                ),
              ),
              const Positioned(
                top: 340,
                right: 100,
                //left: -400,
                child: Image(
                  width: 120,
                  image: AssetImage('images/photo.png'),
                ),
              ),
              const Positioned(
                top: 370,
                left: 60,
                //left: -400,
                child: Image(
                  width: 90,
                  image: AssetImage('images/rec.png'),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
