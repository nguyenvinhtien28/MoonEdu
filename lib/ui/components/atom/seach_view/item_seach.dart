import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/utils/extension/num.dart';

import '../../../../const/constants.dart';

class ItemSearch extends StatelessWidget {
  const ItemSearch({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4.h,
      child: TextField(
        style: const TextStyle(
          color: AppColors.black,
          fontSize: FontSize.xLarge,
        ),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          icon:Image.asset("assets/images/timkiem.png",width: 30,height: 30,),
          contentPadding: const EdgeInsets.only(
              left: 14.0, top: 9.0),
        ),
      ),
    );
  }
}

