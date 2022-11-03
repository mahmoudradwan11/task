import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/layout/Home_Screen.dart';
import 'package:task/modules/login_screen/login_screen.dart';
import 'package:task/shared/components/end.dart';
import 'package:task/shared/network/local/cache_helper.dart';
import 'package:task/shared/network/remote/dio_helper.dart';
import 'package:task/shared/styles/themes.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  token = CacheHelper.getData(key: 'token');
  Widget firstScreen;
  print('Token = $token');
  if (token != null) {
    firstScreen= HomeAppScreen();
  } else {
    firstScreen = Login();
  }
  runApp(MyApp(
    startAppScreen: firstScreen,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startAppScreen;
  const MyApp({Key? key,this.startAppScreen}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home:startAppScreen,
    );
  }
}