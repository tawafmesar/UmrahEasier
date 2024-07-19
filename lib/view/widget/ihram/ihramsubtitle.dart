import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class IhramSubTitle extends StatelessWidget {
  const IhramSubTitle({super.key, required this.icon, required this.subtitle});

  final String icon;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: Container(
        color: AppColor.clockOutline,
        margin: EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            // Fixed size for the image
            Container(
              width: 65, // Set your desired width
              height: 65, // Set your desired height
              child: Image.asset(
                icon,
              ),
            ),
            // Second column with text
            Expanded(
              flex: 8,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColor.bottombar, // Text color
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
