import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/shared/styles/colors.dart';
Widget defaultFieldForm({
  required TextEditingController controller,
  required TextInputType keyboard,
  required var valid,
  String? label,
  IconData? prefix,
  //IconData? suffix,
  bool show = true,
  var tap,
  var onchange,
  var onSubmit,
  var suffix,
  var suffixPress,
  var labelStyle,
}) =>
    TextFormField(
      validator: valid,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: labelStyle,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: defaultAppColor),
          // borderRadius: BorderRadius.circular(30),
        ),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          icon: Icon(suffix),
          onPressed: suffixPress,
          color: Colors.white,
        )
            : null,
      ),
      keyboardType: keyboard,
      onFieldSubmitted: onSubmit,
      onChanged: onchange,
      obscureText: show,
      onTap: tap,
    );
void navigateToNextScreen(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigateAndFinishThisScreen(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
);
Widget defAppButton({
  double width = double.infinity,
  double heigth = 40.0,
  bool isUpper = true,
  Color background = defaultAppColor,
  Color textColor = Colors.white,
  required var function,
  required String text,
}) =>
    Container(
      height: heigth,
      width: width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: TextStyle(color: textColor, fontFamily: 'Jannah'),
        ),
      ),
    );
Widget textAppButton({
  required String text,
  required var function,
}) =>
    TextButton(
      onPressed: function,
      child: Text(text.toUpperCase()),
    );
void showMessageToast(String message, ToastMessageStates state) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum ToastMessageStates {
  SUCCESS,
  ERROR,
  WARNING,
}

Color chooseToastColor(ToastMessageStates state) {
  Color color;
  switch (state) {
    case ToastMessageStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastMessageStates.ERROR:
      color = Colors.red;
      break;
    case ToastMessageStates.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;
}
