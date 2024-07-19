import 'package:flutter/material.dart';

import '../../../core/constant/imageasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
      ),
      elevation: 5, // Adjust the shadow depth as needed
      child: Container(
        height: 270,
        width: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), // Same radius as Card's shape
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0), // Clip the image with the same radius
          child: Image.asset(
            AppImageAsset.logo,
            fit: BoxFit.contain, // You can choose the appropriate fit based on your needs
          ),
        ),
      ),
    )
    ;
  }
}