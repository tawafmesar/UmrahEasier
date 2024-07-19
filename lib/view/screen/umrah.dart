import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umraheasier/core/constant/color.dart';
import 'package:umraheasier/view/widget/umrah/unrahsubtitle.dart';

import '../../controller/umrah_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../widget/umrah/umrahtitle.dart';

class UmrahScreen extends StatefulWidget {
  const UmrahScreen({super.key});

  @override
  State<UmrahScreen> createState() => _UmrahScreenState();
}

class _UmrahScreenState extends State<UmrahScreen> {
  int _current = 0;
  dynamic _selectedIndex = {};

  final CarouselController _carouselController = CarouselController();

  final List<dynamic> _products = [
    {
      'title': 'الركن الأول    الإحرام',
      'image':
      'assets/images/umrahHover1.png',
      'description': 'البدء بنية أداء النسك بالقلب، والتلفظ بها باللسان قائلًا: لبيك اللهم حجًا لحج الإفراد والتمتع (بعد إتمام العمرة) أو اللهم لبيك عمرة وحجًا لحج القران، ولا مانع بإتمامها بأن يقول: فإن حبسني حابس فمحلي حيث حبستني عند الخوف من عدم التمكن من أداء النسك لمرض أو ظرف يوشك أن يُلمّ بك. '
    },
    {
      'title': 'الركن الثاني    الطواف',
      'image':
      'assets/images/umrahHover2.png',
      'description': 'سبعة أشواط يقوم به ضيف الرحمن حول الكعبة، يبدأ كل شوط من أمام الحجر الأسود وينتهي به، يجعل ضيف الرحمن الكعبة عن يساره أثناء الطواف '
    },
    {
      'title': 'الركن الثالث   السعي',
      'image':
      'assets/images/umrahHover3.png',
      'description': 'السعى سبعة أشواط، يبدأ الأول بالصفا وينتهى بالمروة ويبدأ الثانى من المروة وينتهى بالصفا، والشوط السابع ينتهى عند المروة، ويسن الإسراع للرجل دون المرأة بين العمودين الأخضرين، ولا يشترط للسعى طهارة ولا موالاة بين الأشواط فإن كان قد قدّم السعي مع طواف القدوم فلا يعيده. '
    }
  ];

  late UmrahControllerImp _umrahController; // Declare your UmrahController instance

  @override
  void initState() {
    super.initState();
    _umrahController = Get.put(UmrahControllerImp()); // Initialize your UmrahController
  }

  Widget _buildButtonOrText() {
    // Check if isstheumrah is equal to 0
    if (_umrahController.isstheumrah == '0') {
      // Display a button if isstheumrah is equal to 0
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColor.primaryColor2,
        child: const Icon(
          Icons.arrow_forward_ios,
        ),
      );
    } else {
      // Display text if isstheumrah is equal to 1
      return Text(
        'Your Text Here', // Replace 'Your Text Here' with your desired text
        style: TextStyle(
          // Add your text style here
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        floatingActionButton: _selectedIndex.length > 0

            ? FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColor.primaryColor2,
          child: const Icon(
            Icons.arrow_forward_ios,
          ),
        )
            : null,

        body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: [


          Container(
            color: AppColor.clockOutline,
            margin: EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: const [
               Expanded(
                  flex: 8,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'العمرة هي التعبد لله باإلحرام والطواف بالبيت والسعي بين الصفا والمروة ثم حلق الشعر كاماًل أو تقصيره.'
                      ,
                      style: TextStyle(
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
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 500,
                color: AppColor.primaryColor2,
                child: Image.asset(
                  _products[_current]['image'],
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 10),
                margin: const EdgeInsets.only(bottom: 20 ),
                child: CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    height: 450.0,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.70,
                    enlargeCenterPage: true,
                    pageSnapping: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                  items: _products.map((movie) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selectedIndex == movie) {
                                _selectedIndex = {};
                              } else {
                                _selectedIndex = movie;
                              }
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: AppColor.backgroundcolor,
                              borderRadius: BorderRadius.circular(20),
                              border: _selectedIndex == movie
                                  ? Border.all(
                                  color: AppColor.primaryColor2, width: 3)
                                  : null,
                              boxShadow: _selectedIndex == movie
                                  ? [
                                BoxShadow(
                                  color: Colors.blue.shade100,
                                  blurRadius: 30,
                                  offset: Offset(0, 10),
                                )
                              ]
                                  : [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 20,
                                  offset: Offset(0, 5),
                                )
                              ],
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: 320,
                                    margin: const EdgeInsets.all(10),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.asset(
                                      movie['image'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    movie['title'],

                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Text(
                                      movie['description'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),

        GetBuilder<UmrahControllerImp>(builder: ((controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget : controller.isstheumrah == '0' ?
            Center(
              child: ElevatedButton(
                
                onPressed: () {
                    controller.addNewUmrah();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.secoundColor, // Set the background color to red
                ),

                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'ابداء عمره الأن',
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
              ),
            ) :
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(right: 12),
              child: Text('لبدء عمره جديدة يجب اتمام اركان العمره السابقة',
                  style: TextStyle(color:AppColor.hourHandEndColor,
                    fontSize: 20, fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: AppColor.black,
                        offset: Offset(2, 2), // Set the shadow offset
                        blurRadius: 4, // Set the shadow blur radius
                      ),
                    ],)
              ),
            )
        )
        )
        ),
          const  UmrahTitle(title: 'فضائلها',),
          const UmrahSubTitle(
              icon: 'assets/images/umrah/dot.png',
              subtitle:  'تكفير الذنوب'),
          const UmrahSubTitle(
              icon: 'assets/images/umrah/dot.png',
              subtitle:  'نفي الفقر')
          ,
          const  UmrahTitle(title: 'أركانها',),
          const UmrahSubTitle(
              icon: 'assets/images/umrah/line.png',
              subtitle:  ' اإلحرام من أرض الميقات'),
          const UmrahSubTitle(
              icon: 'assets/images/umrah/line.png',
              subtitle:  'الطواف بالكعبة المشرفة سبعة أشواط')
          ,
          const UmrahSubTitle(
              icon: 'assets/images/umrah/line.png',
              subtitle:  'السعي بين جبلي الصفا والمروة')
          ,
          const  UmrahTitle(title: 'سننها',),
          const UmrahSubTitle(
              icon: 'assets/images/umrah/one.png',
              subtitle:  'إظهار الذكور كتفهم الأيمن ( الأضطباع ) في الطواف')
          ,

          const UmrahSubTitle(
              icon: 'assets/images/umrah/two.png',
              subtitle:  'صالة ركعتين خلف مقام إبراهيم عليه السالم بعد الطواف')
          ,
          const UmrahSubTitle(
              icon: 'assets/images/umrah/three.png',
              subtitle:  ' تسريع الذكور الخطى في الأشواط الثالث الأولى من الطواف ( الرَمل )')
          ,
          const UmrahSubTitle(
              icon: 'assets/images/umrah/ff.png',
              subtitle:  'هرولة الذكور عند السعي بين الصفا والمروة')
          ,
          const UmrahSubTitle(
              icon: 'assets/images/umrah/ff.png',
              subtitle:  ' والمروة')
          ,
        ],
      )

    );
  }

}

