import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/textData/text.dart';
import 'package:osolna_application/view/main_screen.dart';
import 'package:osolna_application/viewModel/angry_provider.dart';
import 'package:osolna_application/viewModel/consolation_provider.dart';
import 'package:osolna_application/viewModel/happy_provider.dart';
import 'package:osolna_application/viewModel/love_provider.dart';
import 'package:osolna_application/viewModel/music_provider.dart';
import 'package:osolna_application/viewModel/sadness_provider.dart';
import 'package:osolna_application/viewModel/simple_provider.dart';
import 'package:provider/provider.dart';

// ignore: slash_for_doc_comments
/**
 * [MultiProvider] 
 * The route can access various mood providers.
 * HappyProvider, LoveProvider, ConsolationProvider, SadnessProvider, AngryProvider
 */
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (BuildContext context) => HappyDatabaseProvider()),
      ChangeNotifierProvider(
          create: (BuildContext context) => LoveDatabaseProvider()),
      ChangeNotifierProvider(
          create: (BuildContext context) => ConsolationDatabaseProvider()),
      ChangeNotifierProvider(
          create: (BuildContext context) => SadnessDatabaseProvider()),
      ChangeNotifierProvider(
          create: (BuildContext context) => AngryDatabaseProvider()),
      ChangeNotifierProvider(
          create: (BuildContext context) => SimpleMemoDatabaseProvider()),
      ChangeNotifierProvider(
        create: (BuildContext context) => MusicProvider(),
      ),
    ], child: const MyApp()),
  );
}

// ignore: slash_for_doc_comments
/**
 * [MyApp] import [SplashScreen] and [MainScreen]
 * This page need to do branching
 * I used Futurebuilder
 * By using Futurebuilder we can use connectionstate 
 */

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**
     * [Screen Util Size]
     */
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: () => const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '오솔나',
        home: SplashScreen(),
      ),
    );
  }
}

// ignore: slash_for_doc_comments
/**
 * [SplashScreen] 
 * This osolna main screen logo.
 */

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // 1ms = 10(-3)
    /**
     * 그리고 MainScreen에서 onBackPressed를 따로 설정해놓지 않거나 stack에 route가 아직 남아있다면
     * back key를 눌렀을 때 Splash Screen만 계속보이는 상황이 발생하기 때문에 꼭 설정을 해주셔야 됩니다
     */
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const MainScreen(),
          ),
          (route) => false);
    });

    //** [아래 코드는 특정 상황에 따라서 SplashScreen 을 불러오기 전에 무언가 작업이 필요할때 사용하는 코드다] */
    /**
     * 임시용으로 작성해둔 코드
     */
    // Timer(const Duration(milliseconds: 1500), () {
    //   if (unknown) {
    //     exit(0);
    //   } else {
    //     Navigator.push(context,
    //         MaterialPageRoute(builder: (context) => const MainScreen()));
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: mainbackgroundColor,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /**
                 * [FirstSentence] 
                 * 오늘의 나의 감정을 
                 */
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '오 ',
                        style: TextStyle(
                          color: logoColor,
                          fontSize: 40.0,
                          fontFamily: nanumMyeongjo,
                        ),
                      ),
                      TextSpan(
                        text: '오늘만큼은',
                        style: TextStyle(
                          color: maintextColor,
                          fontSize: 17.0,
                          fontFamily: nanumGothic,
                        ),
                      ),
                    ],
                  ),
                ),
                /**
                 * [SecondSentence] 
                 * 솔직하게 표현해봐요
                 */
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '솔 ',
                        style: TextStyle(
                          color: logoColor,
                          fontSize: 40.0,
                          fontFamily: nanumMyeongjo,
                        ),
                      ),
                      TextSpan(
                        text: '솔직해봐요',
                        style: TextStyle(
                          color: maintextColor,
                          fontSize: 17.0,
                          fontFamily: nanumGothic,
                        ),
                      ),
                    ],
                  ),
                ),
                /**
                 * [ThirdSentence] 
                 * 나를 속이지 말아요
                 */
                Padding(
                  padding: const EdgeInsets.only(left: 22.0, top: 3.0),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '나 ',
                          style: TextStyle(
                            color: logoColor,
                            fontSize: 40.0,
                            fontFamily: nanumMyeongjo,
                          ),
                        ),
                        TextSpan(
                          text: '나를 위해서요',
                          style: TextStyle(
                            color: maintextColor,
                            fontSize: 17.0,
                            fontFamily: nanumGothic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
