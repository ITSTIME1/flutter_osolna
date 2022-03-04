import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/slideData/sliding_data.dart';
import 'package:osolna_application/textData/text.dart';
import 'package:osolna_application/viewModel/mood_select_screen.dart';

// ignore: slash_for_doc_comments
/**
 * [MainScreen] this page using the sliding panel because that 
 * we want to choice [MoodSelectScreen], [MoodStorageScreen], [SimpleMemoScreen], [SimpleMemoStorageScreen]
 */

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MoodSelectScreen moodSelectScreen = const MoodSelectScreen();
  MoodStorageScreen moodStorageScreen = const MoodStorageScreen();
  SimpleMemoScreen simpleMemoScreen = const SimpleMemoScreen();
  SimpleMemoStorageScreen simpleMemoStorageScreen =
      const SimpleMemoStorageScreen();

  @override
  void initState() {
    moodSelectScreen;
    moodStorageScreen;
    simpleMemoScreen;
    simpleMemoStorageScreen;
    super.initState();
  }

  @override
  void dispose() {
    moodSelectScreen;
    moodStorageScreen;
    simpleMemoScreen;
    simpleMemoStorageScreen;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('mainscreen');
    return DefaultTabController(
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
          actions: [
            const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.menu,
                size: 25.0,
              ),
            ),
          ],
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
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '메인페이지',
                    style: TextStyle(
                      fontSize: subtextSize,
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
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '감정저장소',
                    style: TextStyle(
                      fontSize: subtextSize,
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
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '간단메모',
                    style: TextStyle(
                      fontSize: subtextSize,
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
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '메모저장소',
                    style: TextStyle(
                      fontSize: subtextSize,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            /**
             * [MoodSelectScreen]
             */
            moodSelectScreen,
            /**
             * [MoodStorageScreen]
             */
            moodStorageScreen,
            /**
             * [SimpleMemoScreen]
             */
            simpleMemoScreen,
            /**
             * [SimpleMemoStorageScreen]
             */
            simpleMemoStorageScreen,
          ],
        ),
      ),
    );
  }
}
