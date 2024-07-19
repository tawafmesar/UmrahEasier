import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class UmrahTitle extends StatelessWidget {
  const UmrahTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0,bottom: 5,right: 8,left: 8),
      child: ClipPath(
        clipper: ThreeRoundedEdgesMessageClipper(MessageType.send),
        child: Container(
            height: 70,
            padding: EdgeInsets.all(8),
            color:  AppColor.primaryColor,
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(color:Colors.white,fontSize: 30, fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: AppColor.clockBG,
                    offset: Offset(2, 2), // Set the shadow offset
                    blurRadius: 4, // Set the shadow blur radius
                  ),
                ],),
            )
        ),
      ),
    );
  }
}
