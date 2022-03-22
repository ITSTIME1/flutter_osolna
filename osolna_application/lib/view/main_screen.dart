import 'package:elastic_drawer/elastic_drawer.dart';
import 'package:flutter/material.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/textData/text.dart';
import 'package:osolna_application/view/main_screens.dart';

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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('mainscreen');
    return ElasticDrawer(
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
            const Text(
              'Developer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'ITSTIME',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.0,
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
              height: size.height / 12,
            ),
            const Text(
              'Music Information',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: size.height / 15,
            ),
            const Text(
              'Email Information',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: size.height / 15,
            ),
            const Text(
              'Picture Information',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: size.height / 15,
            ),
            const Text(
              'Picture TextInformation',
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
                        const SizedBox(
                          height: 5.0,
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
                        const SizedBox(
                          height: 5.0,
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
                        const SizedBox(
                          height: 5.0,
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
                        const SizedBox(
                          height: 5.0,
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
              body: const TabBarView(
                children: <Widget>[
                  // ** MoodSelectScreen **
                  MoodSelectScreen(),
                  /**
                 * [MoodStorageScreen]
                 */
                  MoodStorageScreen(),
                  /**
                 * [SimpleMemoScreen]
                 */
                  SimpleMemoScreen(),
                  /**
                 * [SimpleMemoStorageScreen]
                 */
                  SimpleMemoStorageScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
