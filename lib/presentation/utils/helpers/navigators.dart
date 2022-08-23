import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//navigators
navigatePush(BuildContext context, Widget widget) {
  return Navigator.of(context)
      .push(CupertinoPageRoute(builder: (context) => widget));
}

navigatePop(BuildContext context) {
  return Navigator.pop(context);
}

showErrorDialog(BuildContext context, String text) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('An Error Occurred'),
          content: Text(text),
        );
      });
}
