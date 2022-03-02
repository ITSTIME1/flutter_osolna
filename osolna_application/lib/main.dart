import 'package:flutter/material.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/textData/text.dart';

void main() {
  runApp(const MyApp());
}

// ignore: slash_for_doc_comments
/**
 * [MyApp] import [SplashScreen]
 */

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '오솔나',
      home: SplashScreen(),
    );
  }
}

// ignore: slash_for_doc_comments
/**
 * [SplashScreen] this osolna main screen logo.
 */

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
                 * [FirstSentence] 오늘의 나의 감정을 
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
                        text: '오늘의 나의 감정을',
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
                 * [SecondSentence] 솔직하게 표현해봐요
                 */
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: ' 솔 ',
                        style: TextStyle(
                          color: logoColor,
                          fontSize: 40.0,
                          fontFamily: nanumMyeongjo,
                        ),
                      ),
                      TextSpan(
                        text: '솔직하게 표현해봐요',
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
                 * [ThirdSentence] 나를 속이지 말아요
                 */
                RichText(
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
                        text: '나를 속이지 말아요',
                        style: TextStyle(
                          color: maintextColor,
                          fontSize: 17.0,
                          fontFamily: nanumGothic,
                        ),
                      ),
                    ],
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
