import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:user_crud_reqres/styles/font.styles.dart';

class IntroView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IntroViewState();
  }
}

class IntroViewState extends State<IntroView> {
  List<ContentConfig> listContentConfig = [];
  Color activeColor = const Color(0xff0BEEF9);
  Color inactiveColor = const Color(0xff03838b);
  double sizeIndicator = 20;

  @override
  void initState() {
    listContentConfig.add(
      ContentConfig(
        styleTitle: fontStyles(size: 24.0, weight: FontWeight.bold),
        styleDescription: fontStyles(size: 16.0),
        heightImage: 320.0.r,
        widthImage: 320.0.r,
        description:
            "Welcome to Devwithjams. Access all feature with single apps",
        pathImage: "assets/illustration/intro_1.png",
        backgroundColor: Colors.white,
      ),
    );
    listContentConfig.add(
      ContentConfig(
        styleTitle: fontStyles(size: 24.0, weight: FontWeight.bold),
        styleDescription: fontStyles(size: 16.0),
        heightImage: 320.0.r,
        widthImage: 320.0.r,
        description:
            "With users features you can manage easily any time & any where",
        pathImage: "assets/illustration/intro_2.png",
        backgroundColor: Colors.white,
      ),
    );
    listContentConfig.add(
      ContentConfig(
        styleTitle: fontStyles(size: 24.0, weight: FontWeight.bold),
        styleDescription: fontStyles(size: 16.0),
        heightImage: 320.0.r,
        widthImage: 320.0.r,
        description:
            "Lets start your experience to managing users now",
        pathImage: "assets/illustration/intro_3.png",
        backgroundColor: Colors.white,
      ),
    );
    super.initState();
  }

  void onDonePress() => goHomeScreen();
  void onSkipPress()=>goHomeScreen();

  void goHomeScreen()=>context.go('/home');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.r),
        child: IntroSlider(
          listContentConfig: listContentConfig,
          onDonePress: onDonePress,
          onSkipPress: onSkipPress,
          nextButtonStyle: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
              fontStyles(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          skipButtonStyle: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
              fontStyles(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          doneButtonStyle: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
              fontStyles(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
