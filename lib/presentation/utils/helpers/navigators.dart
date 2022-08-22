import 'package:flutter/cupertino.dart';

//navigators
navigatePush(BuildContext context, Widget widget){
  return Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> widget));
}
navigatePop(BuildContext context){
  return Navigator.pop(context);
}