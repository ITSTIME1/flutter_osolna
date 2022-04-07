import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/memoRepository/memo.dart';
import 'package:osolna_application/slideData/sliding_data.dart';
import 'package:osolna_application/textData/text.dart';
import 'package:osolna_application/view/main_memo_screen.dart';
import 'package:osolna_application/view/mood_memo_list_screen.dart';
import 'package:osolna_application/view/simple_edit_screen.dart';
import 'package:osolna_application/view/view_screen.dart';
import 'package:osolna_application/viewModel/music_provider.dart';
import 'package:osolna_application/viewModel/simple_provider.dart';
import 'package:provider/provider.dart';

/// [MusicFile Path]
const String happyMusicName = '행복.mp3';
const String loveMusicName = '사랑.mp3';
const String consolationMusicName = '위로.mp3';
const String sadnessMusicName = '슬픔.mp3';
const String angryMusicName = '화남.mp3';

// ignore: slash_for_doc_comments
/**
 * [MoodSelectScreen] 
 * This class is MoodSelectScreen
 * By using carouselSlider, You can choice today your mood card
 */
// ignore: must_be_immutable
class MoodSelectScreen extends StatefulWidget {
  const MoodSelectScreen({Key? key}) : super(key: key);

  @override
  State<MoodSelectScreen> createState() => _MoodSelectScreenState();
}

class _MoodSelectScreenState extends State<MoodSelectScreen> {
  MusicProvider? _musicProvider;
  @override
  void initState() {
    _musicProvider = Provider.of<MusicProvider>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    _musicProvider;
    super.dispose();
  }

  // ignore: slash_for_doc_comments
  /**
   * [moodSelect Method] 
   * This method receive current Index value then move that page
   * when you want to return the previous page MaterialPageRoute is reference the itemBuilder ctx
   * because this method don't need to MoodSelectBuild Method
   */
  Future<void> moodSelect(index) async {
    if (MoodSelect.card[index].moodTitle == '행복') {
      final String? selectMoodText = MoodSelect.card[index].moodTitle;
      const String deliverMusic = happyMusicName;
      await Navigator.push(context, MaterialPageRoute(builder: (ctx) {
        return MainMemoScreen(
          moodText: selectMoodText!,
          selectMusic: deliverMusic,
        );
      }));
    } else if (MoodSelect.card[index].moodTitle == '사랑') {
      final String? selectMoodText = MoodSelect.card[index].moodTitle;
      const String deliverMusic = loveMusicName;
      await Navigator.push(context, MaterialPageRoute(builder: (ctx) {
        return MainMemoScreen(
          moodText: selectMoodText!,
          selectMusic: deliverMusic,
        );
      }));
    } else if (MoodSelect.card[index].moodTitle == '위로') {
      final String? selectMoodText = MoodSelect.card[index].moodTitle;
      const String deliverMusic = consolationMusicName;
      await Navigator.push(context, MaterialPageRoute(builder: (ctx) {
        return MainMemoScreen(
          moodText: selectMoodText!,
          selectMusic: deliverMusic,
        );
      }));
    } else if (MoodSelect.card[index].moodTitle == '슬픔') {
      final String? selectMoodText = MoodSelect.card[index].moodTitle;
      const String deliverMusic = sadnessMusicName;
      await Navigator.push(context, MaterialPageRoute(builder: (ctx) {
        return MainMemoScreen(
          moodText: selectMoodText!,
          selectMusic: deliverMusic,
        );
      }));
    } else if (MoodSelect.card[index].moodTitle == '화남') {
      final String? selectMoodText = MoodSelect.card[index].moodTitle;
      const String deliverMusic = angryMusicName;
      await Navigator.push(context, MaterialPageRoute(builder: (ctx) {
        return MainMemoScreen(
          moodText: selectMoodText!,
          selectMusic: deliverMusic,
        );
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
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
              height: 25.h,
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
              height: 25.h,
            ),
            GestureDetector(
              onTap: () async => moodSelect(index),
              child: Image.asset(
                MoodSelect.card[index].image!,
                height: 300.h,
              ),
            ),
          ],
        );
      },
      options: CarouselOptions(
        initialPage: 0,
        aspectRatio: 16 / 9,
        height: 392.h,
      ),
    );
  }
}

// ignore: slash_for_doc_comments
/**
 * [MoodStorageScreen] 
 * This class is MoodMemo Storage
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
   * Click to see this text below
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
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(builder: (storageContext) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (MoodSelect.card[0].moodTitle == '행복') {
                        _selectTitle = MoodSelect.card[0].moodTitle;
                        selectMoodStorageAlert(_selectTitle);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (storageContext) => MoodMemoList(
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
                    height: 50.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (MoodSelect.card[1].moodTitle == '사랑') {
                        final _selectTitle = MoodSelect.card[1].moodTitle;
                        selectMoodStorageAlert(_selectTitle);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (storageContext) => MoodMemoList(
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
                    height: 50.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (MoodSelect.card[2].moodTitle == '위로') {
                        final _selectTitle = MoodSelect.card[2].moodTitle!;
                        selectMoodStorageAlert(_selectTitle);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (storageContext) => MoodMemoList(
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
                    height: 50.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (MoodSelect.card[3].moodTitle == '슬픔') {
                        final _selectTitle = MoodSelect.card[3].moodTitle!;
                        selectMoodStorageAlert(_selectTitle);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (storageContext) => MoodMemoList(
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
                    height: 50.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (MoodSelect.card[4].moodTitle == '화남') {
                        final _selectTitle = MoodSelect.card[4].moodTitle!;
                        selectMoodStorageAlert(_selectTitle);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (storageContext) => MoodMemoList(
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
              );
            }),
          ],
        ),
      ],
    );
  }
}

// ignore: slash_for_doc_comments
/**
 * [SimpleMemoScreen] 
 * This class is SimpleMemo Screen
 * The reason this page exists is because each person have different environment and time.
 * so if person want to write memo fast and shorter than mood memo, it page is fit
 */
class SimpleMemoScreen extends StatefulWidget {
  const SimpleMemoScreen({Key? key}) : super(key: key);

  @override
  State<SimpleMemoScreen> createState() => _SimpleMemoScreenState();
}

class _SimpleMemoScreenState extends State<SimpleMemoScreen> {
  dynamic memo;
  SimpleMemoDatabaseProvider? _simpleProvider;
  final simpleTitle = TextEditingController();
  final simpleContent = TextEditingController();
  static final _simpleFormKey = GlobalKey<FormState>();

  // ignore: slash_for_doc_comments
  /**
   * [Initialize Provider]
   */
  @override
  void initState() {
    _simpleProvider =
        Provider.of<SimpleMemoDatabaseProvider>(context, listen: false);
    simpleTitle;
    simpleContent;
    super.initState();
  }

  @override
  void dispose() {
    _simpleProvider;
    simpleTitle;
    simpleContent;
    super.dispose();
  }

  // ignore: slash_for_doc_comments
  /**
   * [MoodMemoComplete]
   */
  void moodMemoComplete() {
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
                '간단저장소',
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
   * [SimpleSaveMemoButton Method]
   * This is SimpleMemo Save button
   */
  Future<void> simpleSaveMemoButton() async {
    await _simpleProvider!.insertMemo(
      memo = Memo(
        title: simpleTitle.text,
        content: simpleContent.text,
        dateTime: DateTime.now().toString(),
      ),
    );
    moodMemoComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () => {
          FocusScope.of(context).unfocus(),
        },
        child: Stack(
          children: [
            Form(
              key: _simpleFormKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 40.0,
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
                            onPressed: () async => simpleSaveMemoButton(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 300.h,
                      width: 300.h,
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

                            TextFormField(
                              textInputAction: TextInputAction.next,
                              maxLines: 1,
                              maxLength: 10,
                              controller: simpleTitle,
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
                                  maxHeight: 300.h - 113,
                                ),
                                child: Scrollbar(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    reverse: false,
                                    child: TextFormField(
                                      textInputAction: TextInputAction.done,
                                      controller: simpleContent,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 100,
                                      style: TextStyle(
                                        color: contentTextColor,
                                        fontFamily: nanumGothic,
                                        fontSize: titleTextColor,
                                      ),
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
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: slash_for_doc_comments
/**
 * [SimpleMemoStorageScreen] 
 * This class is that When you saved SimpleMemo
 * you receive the saved data on this page.
 */
class SimpleMemoStorageScreen extends StatefulWidget {
  const SimpleMemoStorageScreen({Key? key}) : super(key: key);

  @override
  State<SimpleMemoStorageScreen> createState() =>
      _SimpleMemoStorageScreenState();
}

class _SimpleMemoStorageScreenState extends State<SimpleMemoStorageScreen> {
  SimpleMemoDatabaseProvider? _simpleProvider;
  bool isAvailable = false;
  @override
  void initState() {
    _simpleProvider =
        Provider.of<SimpleMemoDatabaseProvider>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    _simpleProvider;
    super.dispose();
  }

  // ignore: slash_for_doc_comments
  /**
   * [SimpleMemo ViewMemo Navigator Method]
   * This method move on ViewMemoScreen
   */
  Future<void> viewMemo(simplememo) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => ViewMemoScreen(
          moodTitle: '간단메모',
          id: simplememo.id.toString(),
          dateTime: simplememo.dateTime,
          title: simplememo.title,
          content: simplememo.content,
        ),
      ),
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * [SimpleMemoLoad]
   * This method gets the contents from simple.db
   */
  Future<List<Memo>> simpleLoadMemo() async {
    return await _simpleProvider!.getSimpleMemos();
  }

  // ignore: slash_for_doc_comments
  /**
   * [SimpleMemoDelete Method]
   * This method remove a content when you pressed
   */
  Future<void> deleteSimpleMemo(int id) async {
    return await _simpleProvider!.deleteMemo(id);
  }

  // ignore: slash_for_doc_comments
  /**
   * [SimpleMemo Show Dialog]
   */
  Future<void> showDeleteDialog(memo) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext showContext) {
        return AlertDialog(
          backgroundColor: appbarColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text(
            '정말로 삭제하시겠습니까?',
            style: TextStyle(
              color: logoColor,
              fontFamily: nanumMyeongjo,
              fontSize: iconSize,
            ),
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  '한번 삭제하면 영원히 삭제 됩니다.',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: nanumGothic,
                    fontSize: titleTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(showContext).pop();
              },
              child: const Text(
                '취소',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                deleteSimpleMemo(memo.id);
                Navigator.of(showContext).pop();
              },
              child: Text(
                '삭제',
                style: TextStyle(
                  color: logoColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget simpleMemoListView() {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<Memo>>(
      future: simpleLoadMemo(),
      builder: (context, snap) {
        // ignore: unrelated_type_equality_checks
        if (snap.data == null || snap.data!.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: logoColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    '작성된 내용이 없어요!',
                    style: TextStyle(
                      color: listContentTitleColor,
                      fontFamily: nanumMyeongjo,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: (snap.data as List).length,
            itemBuilder: (context, index) {
              /**
               * [Memo List Value]
               */
              var simplememo = (snap.data as List)[index];
              return Column(
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onLongPress: () async => viewMemo(simplememo),
                        child: Container(
                          height: size.height / 8,
                          decoration: BoxDecoration(
                            color: appbarColor,
                            border: Border.all(
                              color: logoColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              /**
                             * [MemoDatabase DateTime]
                             */
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        simplememo.dateTime.toString(),
                                        style: TextStyle(
                                          color: maintextColor,
                                          fontFamily: nanumMyeongjo,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              /**
                             * [MemoDatabase title]
                             */
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      simplememo.title!,
                                      style: TextStyle(
                                        color: listViewTitleColor,
                                        fontFamily: nanumMyeongjo,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              /**
                             * [MemoDatabase content]
                             */
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      simplememo.content!,
                                      style: TextStyle(
                                        color: listContentTitleColor,
                                        fontFamily: nanumMyeongjo,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // ** 수정버튼 구현 **
                            TextButton(
                              onPressed: () {
                                // 현재 시간을 담고
                                var nowSimpleDateTime = DateTime.now();
                                dynamic simpleSelectDateTime =
                                    simplememo.dateTime;
                                int? simpleDifference = int.tryParse(
                                    nowSimpleDateTime
                                        .difference(DateTime.parse(
                                            simpleSelectDateTime))
                                        .inDays
                                        .toString());
                                // 터치 한 메모의 시간을 가져온다.
                                // 터치한 메모 시간을 현재 시간이랑 비교했을때 현재 시간보다 적다면
                                if (simpleDifference != null &&
                                    simpleDifference < 1) {
                                  isAvailable = true;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SimpleEditMemoScreen(
                                        content: simplememo.content,
                                        title: simplememo.title,
                                        moodTitle: '',
                                        id: simplememo.id,
                                      ),
                                    ),
                                  );
                                } else {
                                  isAvailable = false;
                                  Fluttertoast.showToast(
                                      msg: "하루가 지나\n수정이 불가능 합니다.",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: drawerBackgroundColor,
                                      textColor: logoColor,
                                      fontSize: 16.0);
                                }
                              },
                              child: Text(
                                '수정',
                                style: TextStyle(
                                  color: logoColor,
                                ),
                              ),
                            ),
                            TextButton(
                              child: Text(
                                '삭제',
                                style: TextStyle(
                                  color: maintextColor,
                                ),
                              ),
                              onPressed: () => showDeleteDialog(simplememo),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SimpleMemoDatabaseProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Container(
          child: simpleMemoListView(),
        );
      },
    );
  }
}
