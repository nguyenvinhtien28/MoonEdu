import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/const/constants.dart';
import 'package:flutter_sakura_base/ui/components/atom/seach_view/seach.dart';

void main(){
  runApp(const Introduce());
}


class Introduce extends StatelessWidget {
  const Introduce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 30),
          child: Column(
              children: <Widget>[
                Text(Messages.textIntroduce,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
              ],
          ),
        ),

      ),
    );
  }
}





