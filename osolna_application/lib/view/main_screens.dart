import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/slideData/sliding_data.dart';
import 'package:osolna_application/textData/text.dart';
import 'package:osolna_application/view/main_memo_screen.dart';
import 'package:osolna_application/view/mood_memo_list_screen.dart';
// ignore: slash_for_doc_comments
/**
 * [MoodSelectScreen] This class is MoodSelectScreen
 * By using carouselSlider, choice today mood card
 */
// ignore: must_be_immutable
class MoodSelectScreen extends StatefulWidget {
  const MoodSelectScreen({Key? key}) : super(key: key);

  @override
  State<MoodSelectScreen> createState() => _MoodSelectScreenState();
}

class _MoodSelectScreenState extends State<MoodSelectScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('MoodSelectScreen');
    return CarouselSlider.builder(
      itemCount: MoodSelect.card.length,
      itemBuilder: (BuildContext context, int index, int _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '오늘의 나의 감정은',
              style: TextStyle(
                color: maintextColor,
                fontFamily: nanumMyeongjo,
              ),
            ),
            SizedBox(
              height: size.height / 25,
            ),
            Text(
              MoodSelect.card[index].moodTitle!,
              style: TextStyle(
                color: maintextColor,
                fontSize: subTextSize,
                fontFamily: nanumMyeongjo,
              ),
            ),
            SizedBox(
              height: size.height / 25,
            ),
            /**
             * deliver moodTitle data to [MainMemoScreen]
             */
            GestureDetector(
              onTap: () async {
                if (MoodSelect.card[index].moodTitle == '행복') {
                  final selectMoodText = MoodSelect.card[index].moodTitle;
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return MainMemoScreen(moodText: selectMoodText);
                  }));
                } else if (MoodSelect.card[index].moodTitle == '사랑') {
                  final selectMoodText = MoodSelect.card[index].moodTitle;
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return MainMemoScreen(moodText: selectMoodText);
                  }));
                } else if (MoodSelect.card[index].moodTitle == '위로') {
                  final selectMoodText = MoodSelect.card[index].moodTitle;
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return MainMemoScreen(moodText: selectMoodText);
                  }));
                } else if (MoodSelect.card[index].moodTitle == '슬픔') {
                  final selectMoodText = MoodSelect.card[index].moodTitle;
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return MainMemoScreen(moodText: selectMoodText);
                  }));
                } else if (MoodSelect.card[index].moodTitle == '화남') {
                  final selectMoodText = MoodSelect.card[index].moodTitle;
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return MainMemoScreen(moodText: selectMoodText);
                  }));
                }
              },
              child: Image.asset(
                MoodSelect.card[index].image!,
                height: size.height / 2,
              ),
            ),
          ],
        );
      },
      options: CarouselOptions(
        initialPage: 0,
        aspectRatio: 16 / 9,
        height: size.height / 1,
      ),
    );
  }
}

// ignore: slash_for_doc_comments
/**
 * [MoodStorageScreen] This class is MoodMemo Storage
 * if you finished your written memo Through save button enable to show  
 */
class MoodStorageScreen extends StatefulWidget {
  const MoodStorageScreen({Key? key}) : super(key: key);

  @override
  State<MoodStorageScreen> createState() => _MoodStorageScreenState();
}

class _MoodStorageScreenState extends State<MoodStorageScreen> {
  String? _selectTitle;

  // ignore: slash_for_doc_comments
  /**
   * [MoodShowSnakBar]
   */
  void selectMoodStorageAlert(String? _selectTitle) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _selectTitle! + '저장소를 선택하셨습니다',
          style: TextStyle(
            color: logoColor,
            fontFamily: nanumMyeongjo,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('MoodStorageScreen');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                if (MoodSelect.card[0].moodTitle == '행복') {
                  _selectTitle = MoodSelect.card[0].moodTitle;
                  selectMoodStorageAlert(_selectTitle);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoodMemoList(
                        selectTitle: _selectTitle!,
                      ),
                    ),
                  );
                }
              },
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        MoodSelect.card[0].moodTitle!,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: nanumMyeongjo,
                          fontSize: iconSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height / 12,
            ),
            GestureDetector(
              onTap: () {
                if (MoodSelect.card[1].moodTitle == '사랑') {
                  final _selectTitle = MoodSelect.card[1].moodTitle;
                  selectMoodStorageAlert(_selectTitle);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoodMemoList(
                        selectTitle: _selectTitle!,
                      ),
                    ),
                  );
                }
              },
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        MoodSelect.card[1].moodTitle!,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: nanumMyeongjo,
                          fontSize: iconSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height / 12,
            ),
            GestureDetector(
              onTap: () {
                if (MoodSelect.card[2].moodTitle == '위로') {
                  final _selectTitle = MoodSelect.card[2].moodTitle!;
                  selectMoodStorageAlert(_selectTitle);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoodMemoList(
                        selectTitle: _selectTitle,
                      ),
                    ),
                  );
                }
              },
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        MoodSelect.card[2].moodTitle!,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: nanumMyeongjo,
                          fontSize: iconSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height / 12,
            ),
            GestureDetector(
              onTap: () {
                if (MoodSelect.card[3].moodTitle == '슬픔') {
                  final _selectTitle = MoodSelect.card[3].moodTitle!;
                  selectMoodStorageAlert(_selectTitle);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoodMemoList(
                        selectTitle: _selectTitle,
                      ),
                    ),
                  );
                }
              },
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        MoodSelect.card[3].moodTitle!,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: nanumMyeongjo,
                          fontSize: iconSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height / 12,
            ),
            GestureDetector(
              onTap: () {
                if (MoodSelect.card[4].moodTitle == '화남') {
                  final _selectTitle = MoodSelect.card[4].moodTitle!;
                  selectMoodStorageAlert(_selectTitle);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoodMemoList(
                        selectTitle: _selectTitle,
                      ),
                    ),
                  );
                }
              },
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        MoodSelect.card[4].moodTitle!,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: nanumMyeongjo,
                          fontSize: iconSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ignore: slash_for_doc_comments
/**
 * [SimpleMemoScreen] This class is SimpleMemo Screen
 * The reason this page exists is because each person have different environment and time.
 * so if person want to write memo fast, it page is fit
 * mood select is not, but just only write to your thinking.
 */
class SimpleMemoScreen extends StatefulWidget {
  const SimpleMemoScreen({Key? key}) : super(key: key);

  @override
  State<SimpleMemoScreen> createState() => _SimpleMemoScreenState();
}

class _SimpleMemoScreenState extends State<SimpleMemoScreen> {
  @override
  Widget build(BuildContext context) {
    print('SimpleMemoScreen');
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height / 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 25.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text(
                            '저장',
                            style: TextStyle(
                              color: maintextColor,
                              fontFamily: nanumMyeongjo,
                            ),
                          ),
                          onPressed: () {
                            /**
                             * SimpleMemo Database insert
                             */
                          },
                        ),
                      ],
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
                            style: TextStyle(
                              color: contentTextColor,
                              fontFamily: nanumGothic,
                              fontSize: titleTextColor,
                            ),

                            // ** Focusing State Text **

                            decoration: InputDecoration(
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
                              constraints: const BoxConstraints(
                                maxHeight: 200.0,
                              ),
                              child: Scrollbar(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  reverse: false,
                                  child: TextField(
                                    style: TextStyle(
                                      color: contentTextColor,
                                      fontFamily: nanumGothic,
                                      fontSize: titleTextColor,
                                    ),
                                    maxLines: 100,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '마음을 내려놓고 편하게 써봐요',
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
    );
  }
}

// ignore: slash_for_doc_comments
/**
 * [SimpleMemoStorageScreen] This class is that When you saved SimpleMemo
 * you receive the saved data on this page.
 */
class SimpleMemoStorageScreen extends StatefulWidget {
  const SimpleMemoStorageScreen({Key? key}) : super(key: key);

  @override
  State<SimpleMemoStorageScreen> createState() =>
      _SimpleMemoStorageScreenState();
}

class _SimpleMemoStorageScreenState extends State<SimpleMemoStorageScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text('테스트'),
      ],
    );
  }
}
