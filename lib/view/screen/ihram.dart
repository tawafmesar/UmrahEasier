import 'package:flutter/material.dart';
import 'package:umraheasier/view/widget/ihram/ihramsubtitle.dart';
import 'package:umraheasier/view/widget/ihram/ihramtitle.dart';
import 'package:video_player/video_player.dart';
import '../../controller/umrah_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../widget/ihram/ihramtext.dart';
import '../widget/umrah/unrahsubtitle.dart';
import 'package:get/get.dart';

class IhramScreen extends StatefulWidget {
  const IhramScreen({super.key});

  @override
  State<IhramScreen> createState() => _IhramScreenState();
}

class _IhramScreenState extends State<IhramScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/ihram.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    // _controller.play();
    _controller.setVolume(50.0);

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


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
              title: Text('الركن الأول الإحرام',
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
                'assets/images/umrahHover1.png',
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
                    const IhramText(textt:
                    ' الإحرام هو النقطة الزمانية والمكانية التي يأخذ فيها القاصد حكم المعتمر ويدخل في المحظورات وذلك بعد عزم النية وإعالنها والأغتسال والمرور بالميقات ولبس اإلحرام (إن كان ذكرا).',
                    ),

                    const IhramTitle(title: 'من أين يحرم المعتمر؟', size: 30.0),
                    const IhramText(textt: 'يُحرم المعتمر من أقرب ميقات مكاني من الجهة التي هو قادم منها.',),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 12),
                      child: Text('والمواقيت التي حددها النبي صل الله عليه وسلم هي :',
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
                    const SizedBox(
                      height: 10.0,
                    ),
                    Image.asset(
                      'assets/images/ihramm.png',
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const IhramTitle(title: 'ما هي طريقة لبس الإحرام المثلى ؟', size: 22.0),
                    Card(
                        child: Column(children: <Widget>[
                          Column(
                            children: <Widget>[
                              Stack(
                                  alignment: FractionalOffset.bottomRight +
                                      const FractionalOffset(-0.1, -0.1),
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.all(20),
                                      child: AspectRatio(
                                        aspectRatio: _controller.value.aspectRatio ?? 16 / 9,
                                        child: Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: <Widget>[
                                            VideoPlayer(_controller),
                                            _ControlsOverlay(controller: _controller),
                                            VideoProgressIndicator(_controller, allowScrubbing: true),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                            ],
                          ),
                        ])
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const IhramTitle(title: 'إعلان نيّة العمرة', size: 28.0),
                    const IhramText(textt:'اللهم لبيك عمرة أو لبيك عمرة'),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const IhramTitle(title: 'بدء التلبية', size: 28.0),
                    const IhramText(textt:'لبيك اللهم لبيك، لبيك ال شريك لك لبيك، إن الحمد والنعمة لك والملك، لا شريك لك.'),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const IhramTitle(title: 'خدمات الميقات', size: 28.0),
                    const IhramSubTitle(
                        icon: 'assets/images/ihram/one.png',
                        subtitle: 'متاجر مستلزمات الإحرام'),
                    const IhramSubTitle(
                        icon: 'assets/images/ihram/ihram2.png',
                        subtitle: 'مواضئ ومساجد'),
                    const IhramSubTitle(
                        icon: 'assets/images/ihram/ihram3.png',
                        subtitle: 'مطاعم ومقاهي وتموينات'),
                    const IhramSubTitle(
                        icon: 'assets/images/ihram/ihtam4.png',
                        subtitle: 'محطات وقود سيارات'),
                    const IhramSubTitle(
                        icon: 'assets/images/ihram/ihram5.png',
                        subtitle: 'ماكينات صرف النقود ATM'),
                    const IhramSubTitle(
                        icon: 'assets/images/ihram/ihram6.png',
                        subtitle: 'مراكز طوارئ صحية'),

                    const SizedBox(
                      height: 12.0,
                    ),
                    const IhramTitle(title: 'المحظورات بعد الإحرام', size: 28.0),

                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/line.png',
                        subtitle:  'الجماع ومقدماته')
                    ,
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/line.png',
                        subtitle:  'ألأخذ من الشعر')
                    ,
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/line.png',
                        subtitle:  'الصيد')
                    ,
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 42),
                      child: Text('( للذكور فقط )',
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
                        subtitle:  'تغطية الرأس')
                    ,
                    const UmrahSubTitle(
                        icon: 'assets/images/umrah/dot.png',
                        subtitle:  'ارتداء ما هو مفصل على الجسم من الملابس والأحذية')
                    ,
                    const SizedBox(
                      height: 12.0,
                    ),
                    const IhramTitle(title: 'التوجه إلى المسجد الحرام', size: 27.0),

                    const IhramText(textt: 'يقع المسجد الحرام في قلب مدينة مكة المكرمة، وفيه تؤدى كافة مناسك العمرة عدا الإحرام. وقبل التوجه إليه بغرض العمرة يلزم اإلحرام من الميقات.',),
                    const SizedBox(
                      height: 12.0,
                    ),
                    GetBuilder<UmrahControllerImp>(builder: ((controller) => HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget : controller.isstheumrah == '1' ?
                       controller.isihramfinish == '' ?
                        Center(
                          child: ElevatedButton(

                            onPressed: () {
                              controller.isihramfinish = '1';
                              controller.updaterukn('isihramfinish' ,  '1');
                              controller.finishruknumrah('1');

                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.secoundColor, // Set the background color to red
                            ),

                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'اضغط عند اتمام ركن الأحرام',
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
                         child: Text('ركن الإحرام تم الانتهاء منه',
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
                       ) :
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(right: 12),
                          child: Text('لأتمام ركن الإحرام يجب بدء عمره',
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
                    const SizedBox(
                      height: 45.0,
                    ),

                  ],

                )

                ;
              },
              childCount: 1,
            ),
          )  ,


        ],
      ),


    );
  }
}



class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({required this.controller});

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
            color: Colors.black26,
            child: const Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 100.0,
                semanticLabel: 'Play',
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}

