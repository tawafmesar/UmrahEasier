import 'package:flutter/material.dart';

import '../../controller/umrah_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../widget/ihram/ihramsubtitle.dart';
import '../widget/ihram/ihramtext.dart';
import '../widget/ihram/ihramtitle.dart';
import '../widget/umrah/unrahsubtitle.dart';
import 'package:get/get.dart';

class TawafScreen extends StatelessWidget {
  const TawafScreen({super.key});

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
              title: Text('الركن الثاني الطواف',
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
                'assets/images/umrahHover2.png',
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
                    const IhramText(textt:'الطواف هو عبادة لله يقوم فيها المسلم بالطواف حول بيته الكريم (الكعبة)، عبادة لرب البيت وتقربا إليه بما شرع.'
                    ),

                    const IhramTitle(
                        title: 'كيف نؤدي الطواف ؟',
                        size: 30.0),

                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot.png',
                        subtitle:  'ندخل إلى المطاف ونقف بمحاذاة الحـــجر الأســود، ونجــعله يســارنا')
                    ,
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot.png',
                        subtitle:  'نرفع اليد ونكبر عنــد المحــاذاة')
                    ,
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot.png',
                        subtitle:  'نبدأ الطواف عكس عقــــارب الســاعـة')
                    ,

                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot.png',
                        subtitle:  'ندعو أثناء الطواف')
                    ,

                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot.png',
                        subtitle:  'عندمــا نصــل نفــس النقطــة التــي بدأنـا منها، محـاذاة الحجر األسـود،  نكــون قــد أكملنــا شــوطاً، فنكــرر المحــاذاة ورفــع اليــد والتكبيــر لبــدء شــوط جديــد.')
                    ,

                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot.png',
                        subtitle:  'نستمر حتى نكمل سبعة أشواط بذات الهيئة')
                    ,

                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 12),
                      child: Text('كيف تعرف محاذاة الحجر األسود في حال لم تستطع الاقتراب منه؟',
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

                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: Container(
                        color: AppColor.clockOutline,
                        margin: EdgeInsets.only(bottom: 5),
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            // Fixed size for the image
                            Container(
                              width: 60, // Set your desired width
                              height: 120, // Set your desired height
                              child: Image.asset(
                                  'assets/images/umrah/line2.png' ,
                              ),
                            ),
                            // Second column with text
                            const Expanded(
                              flex: 8,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'انظر إلى الأعلى في المباني من حولك، ستجد عالمة خضراء مضيئة. إنها تحاذي  الحجر األسود تمامًا'
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
                    ),

                    const SizedBox(
                      height: 12.0,
                    ),


                    const IhramTitle(title: 'سنن الطواف (للذكور):', size: 28.0),

                    const IhramSubTitle(
                        icon: 'assets/images/umrah/one.png',
                        subtitle:  'الأضطباع : لبس الرداء العلوي دون تغطية الكتف الأيمن، اقتداء بالنبي صل الله عليه وسلم'),

                    const IhramSubTitle(
                        icon: 'assets/images/umrah/ff.png',
                        subtitle:  'الرََّمَل : إسراع المشي مع تقارب الخطى في الأشواط الثالثة الأولى.'),

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
                        icon: 'assets/images/umrah/line.png',
                        subtitle:  'يختلف الرََّمَل في الطواف عن الهـرولة التـي في السـعي')
                    ,
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/line.png',
                        subtitle:  'إذا تيسر الرََّمَل نحرص على سالمـة الطائفـين الآخــرين')
                    ,

                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 12),
                      child: Text('الدعاء في الطواف :',
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
                        subtitle:  'الدعاء من سنن الطواف, به يتقرب  المعتمر إلى ربه ويرفع إليه حاجته.'),

                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 12),
                      child: Text('الدعاء في سائر الطواف:',
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
                        subtitle:  'يُشرع للطائف بالبيت الحرام الدعاء  والابتهال إلى الله بما أهمه وشغل قلبه'),

                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 12),
                      child: Text('الدعاء بين الرّكن اليماني والحجر الأسود:',
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
                        subtitle: '(ربنا آتنا في الدنيا حسنة وفي الآخرة حسنة وقنا عذاب النار ) تأسيًا بالنبي صل الله عليه وسلم'  ),

                    const SizedBox(
                      height: 12.0,
                    ),
                    const IhramTitle(title: 'التصوير والكلام أثناء الطواف:', size: 28.0),
                    const IhramSubTitle(
                        icon: 'assets/images/tawaf22.png',
                        subtitle: 'الطواف عبادة، ويُستحسن االنشغال فيه بالدعاء.الإقلال من الكلام، والدعاء بصوت معتدل، يحافظ على طمأنينة وسكينة الآخرين. '  ),

                    const IhramSubTitle(
                        icon: 'assets/images/tawaf44.png',
                        subtitle: 'التصوير يتسبب في  الزحام وتوقف السير، وينبغي اختيار أماكن قاصية عند الاضطرار إليه.'  ),

                    const SizedBox(
                      height: 12.0,
                    ),
                    const IhramTitle(title: 'صلاة ركعتي الطواف', size: 28.0),

                    const IhramSubTitle(
                        icon: 'assets/images/tawaf55.png',
                        subtitle: 'بعد تأدية أشواط الطواف السبعة، يغطي المعتمر كتفه المكشوف بأن يفك الاضطباع (إن كان ذكرا)، فيتوجه ناحية أو محاذاة مقام إبراهيم عليه السلام ليصلي ركعتين خفيفتين خلفه'  ),

                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 12),
                      child: Text('على النحو التالي:',
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
                        subtitle:  'الصفة:  ركعتين خفيفتين.')
                    ,
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot.png',
                        subtitle:  'الصفة:  ركعتين خفيفتين.')
                    ,
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot.png',
                        subtitle:  'التكرار:  مرة واحدة.')
                    ,
                    const UmrahSubTitle(
                    icon: 'assets/images/umrah/dot.png',
                    subtitle:  'القراءة:  سورة الكافرون في الركعة الأولى، سورة الإخالص في الركعة الثانية.')
                    ,
                    const SizedBox(
                      height: 12.0,
                    ),
                    GetBuilder<UmrahControllerImp>(builder: ((controller) => HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget : controller.isstheumrah == '1' ?
                        controller.istawaffinish == '' ?
                        Center(
                          child: ElevatedButton(

                            onPressed: () {
                              controller.istawaffinish = '1';
                              controller.updaterukn('istawaffinish' ,  '1');
                              controller.finishruknumrah('2');

                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.secoundColor, // Set the background color to red
                            ),

                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'اضغط عند اتمام ركن الطواف',
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
                          child: Text('ركن الطواف  تم الانتهاء منه',
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
                          child: Text('لأتمام ركن الإحرام يجب بدء عمره',
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

    );
  }
}
