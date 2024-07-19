import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,

        title: Text('عداد الأشواط',
            style: TextStyle(color:Colors.white,fontSize: 20, fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: AppColor.clockBG,
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],)
        ),
      ),
      body: Scrollbar(
        child: ListView(
          children: [
            AnimatedFlipCounter(
              value: _value,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
              ),
              elevation: 5, // Adjust the shadow depth as needed
              child: Container(
                height: 245,
                width: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0), // Same radius as Card's shape
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0), // Clip the image with the same radius
                  child: Image.asset(
                    AppImageAsset.walk,
                    fit: BoxFit.contain, // You can choose the appropriate fit based on your needs
                  ),
                ),
              ),
            ),
            AnimatedFlipCounter(
              value: _value,
              // Use "infix" to show a value between negative sign and number
              suffix: 'الشوط  ',
              padding: const EdgeInsets.all(8),
              textStyle: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                letterSpacing: -8.0,
                color: AppColor.secoundColor,
                shadows:  [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [1].map(_buildButtons).toList(),
            ),
            // Add a conditional widget to display the message and back button
            if (_value == 7)
              Column(
                children: [
                 const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'تم الأنتهاء من الأشواط السبعة يمكنك العودة.'
                      ,
                      style: TextStyle(
                        color: AppColor.bottombar, // Text color
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),

                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: AppColor.secoundColor,
                      textStyle:const TextStyle(
                        fontSize: 16.0, // Adjust font size as needed
                        color: Colors.white, // Text color
                      ),
                    ),

                    child:Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'الرجوع',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: AppColor.clockBG, // Assuming AppColor.clockBG is defined elsewhere
                              offset: Offset(2, 2), // Set the shadow offset
                              blurRadius: 4, // Set the shadow blur radius
                            ),
                          ],
                        ),
                      ),
                    ),
                  )

                ],
              ),
          ],
        ),
      ),
    );
  }
  Widget _buildButtons(num value) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 10,
            backgroundColor: AppColor.secoundColor,
            textStyle:const TextStyle(
              fontSize: 16.0, // Adjust font size as needed
              color: Colors.white, // Text color
            ),
          ),
          child:
          Text('+$value',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: AppColor.clockBG, // Assuming AppColor.clockBG is defined elsewhere
                    offset: Offset(2, 2), // Set the shadow offset
                    blurRadius: 4, // Set the shadow blur radius
                  ),
                ],
              )
          )

          ,
          onPressed: () {
            // Check for the condition before updating the value
            if (_value < 7) {
              setState(() => _value += value);
            }
          },
        ),
      ],
    );
  }
}