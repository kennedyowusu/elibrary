import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

showLoaderDialog(BuildContext context, {String? message = "loading..."}) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        CircularProgressIndicator(),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 7),
            child: Text(
              message!,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    ),
  );
  SchedulerBinding.instance.addPostFrameCallback((_) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  });
  // showDialog(
  //   barrierDismissible: false,
  //   context: context,
  //   builder: (BuildContext context) {
  //     return alert;
  //   },
  // );
}
