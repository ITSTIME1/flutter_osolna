import 'package:flutter/material.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/textData/text.dart';

// ignore: slash_for_doc_comments
/**
 * [MoodMemoList] This page is that you written moodmemo.
 * It is shown in the form of listView.
 * Shown list : currentTime, moodTitle, subtitle,
 * Functions : Fixing Function, delete Function.
 */

class MoodMemoList extends StatefulWidget {
  const MoodMemoList({Key? key}) : super(key: key);

  @override
  State<MoodMemoList> createState() => _MoodMemoListState();
}

class _MoodMemoListState extends State<MoodMemoList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainbackgroundColor,
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
            padding: EdgeInsets.only(right: 38.0),
            child: Icon(
              Icons.menu,
              size: 25.0,
            ),
          ),
        ],
      ),
      /**
       * Example ListView this section provider db Memo list
       */
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  child: const Text('테스트'),
                  height: 60,
                  color: appbarColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height / 30,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: const Text('테스트'),
                  height: 60,
                  color: appbarColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height / 30,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: const Text('테스트'),
                  height: 60,
                  color: appbarColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height / 30,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: const Text('테스트'),
                  height: 60,
                  color: appbarColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height / 30,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: const Text('테스트'),
                  height: 60,
                  color: appbarColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height / 30,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: const Text('테스트'),
                  height: 60,
                  color: appbarColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height / 30,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: const Text('테스트'),
                  height: 60,
                  color: appbarColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height / 30,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: const Text('테스트'),
                  height: 60,
                  color: appbarColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
