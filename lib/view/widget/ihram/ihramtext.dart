import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class IhramText extends StatelessWidget {
  const IhramText({super.key, required this.textt});
  final String textt;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:Alignment.centerRight,
      color: AppColor.clockOutline,
      margin: EdgeInsets.all(8.0 ),
      padding: const EdgeInsets.all(5.0 ,),
      child: Text(
        textt,
        style:  TextStyle(
          color: AppColor.bottombar,
          fontSize: 19.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
