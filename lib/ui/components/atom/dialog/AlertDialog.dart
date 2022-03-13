import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/const/constants.dart';





showAlertDialog(BuildContext context) {

  // Create button
  final Widget CloseButton = RaisedButton(
    child: const Text("Thoát",style: TextStyle(color: Colors.black),),
    hoverColor: AppColors.blue.shade400,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  final Widget ExitButton = RaisedButton(
    child: const Text("Hủy",style: TextStyle(color: Colors.black),),
    hoverColor: AppColors.blue.shade400,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  final AlertDialog alert = AlertDialog(
    backgroundColor: AppColors.blue,
    title: const Text("Bạn muốn thoát chứ",style: TextStyle(color: Colors.white),),
    content: const Image(image: AssetImage('assets/images/pp.png'),height: 100,),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    actions: [
      CloseButton,
      ExitButton
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}