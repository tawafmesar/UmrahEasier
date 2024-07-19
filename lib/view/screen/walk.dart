import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/umrah_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../widget/ihram/ihramsubtitle.dart';
import '../widget/ihram/ihramtext.dart';
import '../widget/ihram/ihramtitle.dart';
import '../widget/umrah/unrahsubtitle.dart';

class WalkSceen extends StatelessWidget {
  const WalkSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            backgroundColor: AppColor.primaryColor,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('الركن الثالث السعي',
                  style: TextStyle(color:Colors.white,fontSize: 20, fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: AppColor.clockBG,
                        offset: Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],)
              ),
              background: Image.asset(
                'assets/images/umrahHover3.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const IhramText(textt:'السعي بين الصفا والمروة : عند انتهائك من الطواف ستجد داخل المسجد الحرام لوحاتٍ إرشادية تدلك إلى المسعى، وتشير إلى الصفا حيث مكان بداية السعي.'
                    ),

                    const IhramTitle(
                        title: 'قبل السعي'  ,
                        size: 30.0),

                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 12),
                      child: Text('شرب ماء زمزم , قبل السعي :',
                          style: TextStyle(color:AppColor.bottombar,
                            fontSize: 20, fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: AppColor.clockBG,
                                offset: Offset(2, 2), // Set the shadow offset
                                blurRadius: 4, // Set the shadow blur radius
                              ),
                            ],)
                      ),
                    ),

                    const IhramText(textt:'قال صلى هللا عليه وسلم عن ماء زمزم : (إنها لمباركة , هي طعام طعمٍ,  وشفاء سٌقمٍ ) وقد شرب صلى الله عليه وسلم من زمزم بعد أن انتهى من طوافه ويسن اتباعه في ذلك ، وهذا متيسر اليوم في طريقك إلى المسعى وفي داخل المسعى حيث تنتشر برادات ماء زمزم في جميع أنحاء الحرم.'
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),

                    const IhramTitle(
                        title:  'خطوات السعي',
                        size: 30.0),

                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 12),
                      child: Text('البداية من جبل الصفا:',
                          style: TextStyle(color:AppColor.bottombar,
                            fontSize: 20, fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: AppColor.clockBG,
                                offset: Offset(2, 2), // Set the shadow offset
                                blurRadius: 4, // Set the shadow blur radius
                              ),
                            ],)
                      ),
                    ),


                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot.png',
                        subtitle:  'لم يعد الجبل موجودًا لكن توجد منه بقايا صخور في الدور الأرضي. وتوجد في الأدوار العلوية لوحات توضح مكان الصفا.')
                    ,
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot.png',
                        subtitle:  'المشي في اتجاه جبل المروة.')
                    ,
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 12),
                      child: Text('قبل المروة، عند بلوغ منطقة العلمين الأخضرين الظاهرين في سقف المسعى،,',
                          style: TextStyle(color:AppColor.bottombar,
                            fontSize: 20, fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: AppColor.clockBG,
                                offset: Offset(2, 2), // Set the shadow offset
                                blurRadius: 4, // Set the shadow blur radius
                              ),
                            ],)
                      ),
                    ),

                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot.png',
                        subtitle:  'يهرول الرجال. ويتوقفون عن الهرولة بعد نهاية العلمين. الهرولة = أقرب إلى الجري.')
                    ,
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot.png',
                        subtitle:  'عند بلوغ المروة، نكون قد أكملنا شوطا، ثم نلتف راجعين إلى الصفا حيث ابتدأنا.')
                    ,

                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot.png',
                        subtitle:  'نواصل حتى نكمل ثالث لفات ونصف تنتهي في جبل المروة')
                    ,
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot.png',
                        subtitle: 'يهرول الذكور في كل مرة يمرون بها على منطقة العلمين الأخضرين. وبذا نكون أكملنا سبعة أشواط.')
                    ,


                    const SizedBox(
                      height: 12.0,
                    ),


                    const IhramTitle(title: 'الدعاء في السعي', size: 28.0),

                    const IhramText(textt: 'ينبغي للساعي أن يملأ كامل وقت سعيه بذكر الله ودعائه أو قراءة القرآن.'),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 12),
                      child: Text('الدعاء عند أول الصفا أو المروة:',
                          style: TextStyle(color:AppColor.bottombar,
                            fontSize: 20, fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: AppColor.clockBG,
                                offset: Offset(2, 2), // Set the shadow offset
                                blurRadius: 4, // Set the shadow blur radius
                              ),
                            ],)
                      ),
                    ),

                    const IhramSubTitle(
                        icon: 'assets/images/doaa.png',
                        subtitle:  'عند الصفا بعد الطواف يقرأ قوله تعالى: "إِنَّ الصَّفَا وَالْمَرْوَةَ مِن شَعَائِرِ اللَّهِ" [البقرة : 158 ] ويقول : أبدأ بما بدأ الله به'),

                    const IhramTitle(title: 'الدعاء في السعي', size: 28.0),


                    const IhramSubTitle(
                        icon: 'assets/images/doaa.png',
                        subtitle: 'نتجه ناحية القبلة ونقول: ”الله أكبر، الله أكبر، الله أكبر، لا إله إلا الله وحده ال شريك له، له الملك وله الحمد، وهو على كل شيءٍ قدير، لا إله إلا الله وحده، أنجز وعده، ونصر عبده، وهزم الأحزاب وحده“ ، ثم ندعو بما نشاء، ثم نعيدها، ثم ندعو بما نشاء، وهكذا ثم ننطلق في سعينا.'),

                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 12),
                      child: Text('تنـويـه :',
                          style: TextStyle(color:AppColor.bottombar,
                            fontSize: 20, fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: AppColor.clockBG,
                                offset: Offset(2, 2), // Set the shadow offset
                                blurRadius: 4, // Set the shadow blur radius
                              ),
                            ],)
                      ),
                    ),
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot.png',
                        subtitle:  'عند الدعاء، نقف في مكان لا يعطل السير ولا يسبب الزحام.'),


                    const IhramTitle(
                        title: 'اختيار المسعى',
                        size: 30.0),


                    const IhramText(textt: 'إضافة إلى مسعى القبو، توجد أدوار علوية من المسعى تساعد في تخفيف الزحام:'),

                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/line.png',
                        subtitle: 'مسعى البدروم (قبو)'),
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/line.png',
                        subtitle: 'مسعى  الدور الأرضي'),
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/line.png',
                        subtitle: 'مسعى دور الميزانين للعربات الكهربائية'),
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/line.png',
                        subtitle: 'مسعى الدور الأول'),
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/line.png',
                        subtitle: 'مسعى الدور الثاني'),


                    const SizedBox(
                      height: 12.0,),

                    Padding(
                      padding: const EdgeInsets.only(top: 12.0,bottom: 5,right: 8,left: 8),
                      child: ClipPath(
                        clipper: ThreeRoundedEdgesMessageClipper(MessageType.send),
                        child: Container(
                            height: 70,
                            padding: EdgeInsets.all(8),
                            color:  AppColor.secoundColor,
                            alignment: Alignment.center,
                            child: Text(
                              'التحلل من العمرة',
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
                    ),
                    
                    const IhramText(textt: 'بعد إتمام الطواف والسعي، يحلق المعتمر شعر رأسه أو يقصه، ويكون بذلك قد أتم  العمرة ويُباح له ما كان محظورًا خلالها.')
                   , Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 12),
                      child: Text('كيف يكون الأخذ من الشعر؟',
                          style: TextStyle(color:AppColor.bottombar,
                            fontSize: 20, fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: AppColor.clockBG,
                                offset: Offset(2, 2), // Set the shadow offset
                                blurRadius: 4, // Set the shadow blur radius
                              ),
                            ],)
                      ),
                    ),
                    const IhramSubTitle(
                        icon: 'assets/images/man.png',
                        subtitle: 'للذكور : حلق كامل شعر الرأس أو تقصيره'
                    ),
                    const IhramSubTitle(
                        icon: 'assets/images/w.png',
                        subtitle: 'للإناث : قص ما مقداره (1 – 2) سم من أطراف الشعر'
                    ),
                    const SizedBox(
                      height: 12.0,),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0,bottom: 5,right: 8,left: 8),
                      child: ClipPath(
                        clipper: ThreeRoundedEdgesMessageClipper(MessageType.send),
                        child: Container(
                            height: 70,
                            padding: EdgeInsets.all(8),
                            color:  AppColor.secoundColor,
                            alignment: Alignment.center,
                            child: Text(
                              'أين نقص الشعر؟',
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
                    ),
                    const IhramText(textt: 'لا يُشترط قص الشعر في المسعى. وهناك أماكن حلاقة مخصصة ومرخصة حول المسجد الحرام.')
                    , Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 12),
                      child: Text('إذ تلزم المحلات المرخصة بما يلي:',
                          style: TextStyle(color:AppColor.bottombar,
                            fontSize: 20, fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: AppColor.clockBG,
                                offset: Offset(2, 2), // Set the shadow offset
                                blurRadius: 4, // Set the shadow blur radius
                              ),
                            ],)
                      ),
                    ),
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot2.png',
                        subtitle: 'استخدام أمواس وقواطع جديدة لكل فرد.'),
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot2.png',
                        subtitle: 'استخدام بودرة وسوائل مرخصة.'),
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot2.png',
                        subtitle: 'تعقيم المقصات.'),
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot2.png',
                        subtitle: 'غسل الأيدي قبل كل حالقة.'),
                    const SizedBox(
                      height: 12.0,
                    ),
                    GetBuilder<UmrahControllerImp>(builder: ((controller) => HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget : controller.isstheumrah == '1' ?
                        controller.iswalkfinish == '' ?
                        Center(
                          child: ElevatedButton(

                            onPressed: () {
                              controller.iswalkfinish = '1';
                              controller.updaterukn('iswalkfinish' ,  '1');
                              controller.finishruknumrah('3');
                              controller.updateumrah();

                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.secoundColor, // Set the background color to red
                            ),

                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'اضغط عند اتمام ركن السعي',
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
                        ) : Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(right: 12),
                          child: Text('ركن السعي  تم الانتهاء منه',
                              style: TextStyle(color:AppColor.hourHandEndColor,
                                fontSize: 20, fontWeight: FontWeight.bold,
                                shadows: const [
                                  Shadow(
                                    color: AppColor.black,
                                    offset: Offset(2, 2), // Set the shadow offset
                                    blurRadius: 4, // Set the shadow blur radius
                                  ),
                                ],)
                          ),
                        ) :
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(right: 12),
                          child: Text('لأتمام ركن السعي يجب بدء عمره',
                              style: TextStyle(color:AppColor.hourHandEndColor,
                                fontSize: 20, fontWeight: FontWeight.bold,
                                shadows:const [
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
                    const SizedBox(
                      height: 45.0,
                    ),

                  ],
                );
              },
              childCount: 1,
            ),
          ) ,
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // Handle button press
          Get.toNamed(AppRoute.counterScreen);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.secoundColor,
          textStyle: TextStyle(
            fontSize: 16.0, // Adjust font size as needed
            color: Colors.white, // Text color
          ),
        ),
        child: Text(
          'عداد\nالأشواط',
          textAlign: TextAlign.center, // Center text within button
        ),
      ),
    );
  }
}
