import 'package:flutter/cupertino.dart';

navigatePush(BuildContext context, Widget widget){
  return Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> widget));
}