import 'package:flutter/material.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/textData/text.dart';
import 'package:osolna_application/view/main_screen.dart';
import 'package:osolna_application/viewModel/angry_provider.dart';
import 'package:osolna_application/viewModel/consolation_provider.dart';
import 'package:osolna_application/viewModel/happy_provider.dart';
import 'package:osolna_application/viewModel/love_provider.dart';
import 'package:osolna_application/viewModel/sadness_provider.dart';
import 'package:provider/provider.dart';

// ignore: slash_for_doc_comments
/**
 * [MultiProvider] The route can access various mood providers.
 * HappyProvider, LoveProvider, ConsolationProvider, SadnessProvider, AngryProvider
 */
void main() {
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
    ], child: const MyApp()),
  );
}

// ignore: slash_for_doc_comments
/**
 * [MyApp] import [SplashScreen] and [MoodSelectScreen]
 * this page need to do branching
 * I used futurebuilder
 * By using futurebuilder we can use connectionstate 
 */

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('myapp');
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        } else if (snapshot.hasError) {
          return const CircularProgressIndicator();
        } else {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: '오솔나',
            home: MainScreen(),
          );
        }
      },
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
    print('splashScreen');
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
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: RichText(
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
