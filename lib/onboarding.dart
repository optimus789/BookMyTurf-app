import 'package:bookmyturf/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Book My Turf',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Roboto"),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  /*Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.png', width: 400.0),
      alignment: Alignment.bottomCenter,
    );
  }*/

  Widget _titleWidget(
      String assetName, String title, double upperheight, double middleheight) {
    return Column(
      children: [
        SizedBox(
          height: upperheight,
        ),
        SvgPicture.asset(
          'assets/svg/onboarding$assetName.svg',
          semanticsLabel: title,
          width: 400,
          height: 200,
        ),
        /*Image.asset(
          'assets/$assetName.png',
          
        ),*/
        SizedBox(
          height: middleheight,
        ),
        Text("$title",
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 25.0,
                fontWeight: FontWeight.w700))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontFamily: "Roboto", fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontFamily: 'Roboto', fontSize: 25.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          titleWidget: _titleWidget("1", "Track & Locate", 200, 73),
          body: "Nearby available Football Turfs suitable for you.",
          //image: _buildImage('1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: _titleWidget("2", "Store & Share", 200, 73),
          body: "Bookmark , Rate & Share your frequent sporting locations.",
          //image: _buildImage('2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: _titleWidget("3", "Plan your Match", 200, 73),
          body: "Explore places with over 1000+ locations across the country.",
          //image: _buildImage('3'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done',
          style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w600)),
    );
  }
}
