import 'dart:async';

import 'package:flutter/material.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/memoRepository/memo.dart';
import 'package:osolna_application/textData/text.dart';
import 'package:osolna_application/viewModel/angry_provider.dart';
import 'package:osolna_application/viewModel/consolation_provider.dart';
import 'package:osolna_application/viewModel/happy_provider.dart';
import 'package:osolna_application/viewModel/love_provider.dart';
import 'package:osolna_application/viewModel/sadness_provider.dart';
import 'package:provider/provider.dart';

// ignore: slash_for_doc_comments
/**
 * [MainMemoScreen] This page is that when after user clicked move on mood page shown
 */
class MainMemoScreen extends StatefulWidget {
  final String? moodText;
  const MainMemoScreen({Key? key, required this.moodText}) : super(key: key);

  @override
  State<MainMemoScreen> createState() => _MainMemoScreenState();
}

class _MainMemoScreenState extends State<MainMemoScreen> {
  dynamic memo;
  var currentFocus;
  final title = TextEditingController();
  final content = TextEditingController();

  // ignore: slash_for_doc_comments
  /**
   * [Providers] can access the provider
   */
  HappyDatabaseProvider? _happyProvider;
  LoveDatabaseProvider? _loveProvider;
  ConsolationDatabaseProvider? _consolationProvider;
  SadnessDatabaseProvider? _sadnessProvider;
  AngryDatabaseProvider? _angryProvider;

  @override
  void initState() {
    _happyProvider = Provider.of<HappyDatabaseProvider>(context, listen: false);
    _loveProvider = Provider.of<LoveDatabaseProvider>(context, listen: false);
    _consolationProvider =
        Provider.of<ConsolationDatabaseProvider>(context, listen: false);
    _sadnessProvider =
        Provider.of<SadnessDatabaseProvider>(context, listen: false);
    _angryProvider = Provider.of<AngryDatabaseProvider>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    _happyProvider;
    _loveProvider;
    _consolationProvider;
    _sadnessProvider;
    _angryProvider;
    super.dispose();
  }

  // ignore: slash_for_doc_comments
  /**
   * [MoodShowDialog Method] This Method can show AlertDialog when you success the save button
   */
  void moodMemoCompelete() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: appbarColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

          // ** Dialog Main Title **

          title: Column(
            children: [
              Text(
                widget.moodText! + '저장소',
                style: TextStyle(
                  color: logoColor,
                  fontFamily: nanumMyeongjo,
                  fontSize: hintTextSize,
                ),
              ),
            ],
          ),

          // ** Dialog Sub Title **

          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '성공적으로 저장했습니다.',
                style: TextStyle(
                  color: maintextColor,
                  fontSize: subTextSize,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * [MoodSaveButton Method] This Method can save wrote memo
   */
  void saveMemoButton() async {
    if (widget.moodText == '행복') {
      await _happyProvider!.insertMemo(
        memo = Memo(
          title: title.text,
          content: content.text,
          dateTime: DateTime.now().toString(),
        ),
      );

      moodMemoCompelete();
    } else if (widget.moodText == '사랑') {
      await _loveProvider!.insertMemo(
        memo = Memo(
          title: title.text,
          content: content.text,
          dateTime: DateTime.now().toString(),
        ),
      );
      moodMemoCompelete();
    } else if (widget.moodText == '위로') {
      await _consolationProvider!.insertMemo(
        memo = Memo(
          title: title.text,
          content: content.text,
          dateTime: DateTime.now().toString(),
        ),
      );
      moodMemoCompelete();
    } else if (widget.moodText == '슬픔') {
      await _sadnessProvider!.insertMemo(
        memo = Memo(
          title: title.text,
          content: content.text,
          dateTime: DateTime.now().toString(),
        ),
      );
      moodMemoCompelete();
    } else if (widget.moodText == '화남') {
      await _angryProvider!.insertMemo(
        memo = Memo(
          title: title.text,
          content: content.text,
          dateTime: DateTime.now().toString(),
        ),
      );
      moodMemoCompelete();
    }
  }

  unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    print('MainMemoScreen');
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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

          // ** Memo Save Button **

          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: IconButton(
                icon: const Icon(
                  Icons.article_outlined,
                  size: 25.0,
                ),
                onPressed: () async => saveMemoButton(),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height / 6,
                    ),

                    // ** SelectMoodText **

                    Padding(
                      padding: const EdgeInsets.only(bottom: 14.0),
                      child: Text(
                        widget.moodText!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: nanumMyeongjo,
                        ),
                      ),
                    ),
                    Container(
                      height: size.height / 1.7,
                      width: size.width / 1.2,
                      decoration: BoxDecoration(
                        color: appbarColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      // 제약조건
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 200.0,
                        ),
                        child: Column(
                          children: [
                            /**
                             * [Title TextField]
                             */

                            // ** InputTextColor **

                            TextField(
                              maxLines: 1,
                              maxLength: 10,
                              controller: title,
                              style: TextStyle(
                                color: contentTextColor,
                                fontFamily: nanumGothic,
                                fontSize: titleTextColor,
                              ),

                              // ** Focusing State Text **

                              decoration: InputDecoration(
                                counterStyle: TextStyle(
                                  color: logoColor,
                                ),
                                hintText: "제목을 적어주세요",
                                hintStyle: TextStyle(
                                  fontSize: hintTextSize,
                                  fontFamily: nanumMyeongjo,
                                  color: Colors.grey,
                                ),

                                // ** Static State Text **

                                labelText: "오늘은 어땠어?",
                                labelStyle: TextStyle(
                                  fontSize: hintTextSize,
                                  color: Colors.white,
                                  fontFamily: nanumMyeongjo,
                                ),

                                // ** Not Focusing State **

                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),

                                // ** Focusing State **

                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.cyan),
                                ),
                              ),
                            ),
                            /**
                             * [Content TextField]
                             */
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: size.height / 1.7 - 113,
                                ),
                                child: Scrollbar(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    reverse: false,
                                    child: TextField(
                                      controller: content,
                                      style: TextStyle(
                                        color: contentTextColor,
                                        fontFamily: nanumGothic,
                                        fontSize: titleTextColor,
                                      ),
                                      maxLines: 100,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '천천히 생각해봐요',
                                        hintStyle: TextStyle(
                                          fontSize: hintTextSize,
                                          fontFamily: nanumMyeongjo,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
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
        ),
      ),
    );
  }
}
