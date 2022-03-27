import 'package:elastic_drawer/elastic_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/textData/text.dart';
import 'package:osolna_application/view/application_information_screen.dart';
import 'package:osolna_application/view/image_screen.dart';
import 'package:osolna_application/view/main_screens.dart';
import 'package:osolna_application/view/music_information_screen.dart';
// ignore: slash_for_doc_comments
/**
 * [MainScreen] 
 * This page using the sliding panel because that 
 * we want to choice [MoodSelectScreen], [MoodStorageScreen], [SimpleMemoScreen], [SimpleMemoStorageScreen]
 */

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MoodSelectScreen _moodSelectScreen;
  late MoodStorageScreen _moodStorageScreen;
  late SimpleMemoScreen _simpleMemoScreen;
  late SimpleMemoStorageScreen _simpleMemoStorageScreen;
  bool textChange = false;
  bool gitHub = false;

  @override
  void initState() {
    _moodSelectScreen = const MoodSelectScreen();
    _moodStorageScreen = const MoodStorageScreen();
    _simpleMemoScreen = const SimpleMemoScreen();
    _simpleMemoStorageScreen = const SimpleMemoStorageScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('mainscreen');
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: ElasticDrawer(
        markWidth: 1,
        markPosition: 0.03,
        mainColor: mainbackgroundColor,
        drawerColor: drawerBackgroundColor,
        /**
         * [Drawer Screen]
         */
        drawerChild: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 125.h,
              ),
              Text(
                '오솔나',
                style: TextStyle(
                  color: logoColor,
                  fontSize: 20.0,
                  fontFamily: nanumMyeongjo,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                        top: 10.0,
                      ),
                      child: const Divider(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    if (textChange == false) {
                      textChange = true;
                    } else {
                      textChange = false;
                    }
                  });
                },
                child: Text(
                  textChange == false ? '이메일 정보' : 'itstime0809@gmail.com',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const ImageInformationScreen(),
                    ),
                  );
                },
                child: const Text(
                  '사진정보',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    if (gitHub == false) {
                      gitHub = true;
                    } else {
                      gitHub = false;
                    }
                  });
                },
                child: Text(
                  gitHub == false ? '개발자 정보' : 'https://github.com/ITSTIME1',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const MusicInformationScreen(),
                    ),
                  );
                },
                child: const Text(
                  '음악정보',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const DeveloperScreen()));
                },
                child: const Text(
                  '앱 사용법',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                'Copyright 2022.(ITSTIME) all rights reserved.',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        mainChild: Stack(
          children: [
            DefaultTabController(
              length: 4,
              child: Scaffold(
                backgroundColor: mainbackgroundColor,
                /**
               * [AppBar] This is appBar section
               */
                appBar: AppBar(
                  toolbarHeight: 70.0,
                  backgroundColor: appbarColor,
                  centerTitle: true,
                  title: Text(
                    '오솔나',
                    style: TextStyle(
                      color: logoColor,
                      fontFamily: nanumMyeongjo,
                      fontSize: appbarFontSize,
                    ),
                  ),
                  // ignore: prefer_const_literals_to_create_immutables

                  /**
                 * [TabBar] This is tabBar section
                 */
                  bottom: TabBar(
                    labelPadding: const EdgeInsets.all(8.0),
                    indicatorColor: logoColor,
                    indicatorWeight: 3.0,
                    isScrollable: false,
                    tabs: [
                      Column(
                        children: [
                          Icon(
                            Icons.auto_awesome_motion_rounded,
                            size: iconSize,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            '다이어리',
                            style: TextStyle(
                              fontSize: subTextSize,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.auto_awesome_mosaic_rounded,
                            size: iconSize,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            '감정저장소',
                            style: TextStyle(
                              fontSize: subTextSize,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.border_color,
                            size: iconSize,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            '간단메모',
                            style: TextStyle(
                              fontSize: subTextSize,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.menu_book_rounded,
                            size: iconSize,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            '메모저장소',
                            style: TextStyle(
                              fontSize: subTextSize,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: <Widget>[
                    // ** MoodSelectScreen **
                    _moodSelectScreen,
                    /**
                   * [MoodStorageScreen]
                   */
                    _moodStorageScreen,
                    /**
                   * [SimpleMemoScreen]
                   */
                    _simpleMemoScreen,
                    /**
                   * [SimpleMemoStorageScreen]
                   */
                    _simpleMemoStorageScreen,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
