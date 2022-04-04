import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/memoRepository/memo.dart';
import 'package:osolna_application/textData/text.dart';
import 'package:osolna_application/view/edit_screen.dart';
import 'package:osolna_application/view/view_screen.dart';
import 'package:osolna_application/viewModel/angry_provider.dart';
import 'package:osolna_application/viewModel/consolation_provider.dart';
import 'package:osolna_application/viewModel/happy_provider.dart';
import 'package:osolna_application/viewModel/love_provider.dart';
import 'package:osolna_application/viewModel/sadness_provider.dart';
import 'package:provider/provider.dart';

// ignore: slash_for_doc_comments
/**
 * [MoodMemoList] 
 * This page is that you written moodmemo.
 * It is shown in the form of listView.
 * Shown list : dateTime, moodTitle, subtitle,
 * Functions : Fixing Function, delete Function.
 */

class MoodMemoList extends StatefulWidget {
  final String selectTitle;

  const MoodMemoList({
    Key? key,
    required this.selectTitle,
  }) : super(key: key);

  @override
  State<MoodMemoList> createState() => _MoodMemoListState();
}

class _MoodMemoListState extends State<MoodMemoList> {
  // ignore: slash_for_doc_comments
  /**
   * [Providers] 
   * can access the provider
   */
  HappyDatabaseProvider? _happyProvider;
  LoveDatabaseProvider? _loveProvider;
  ConsolationDatabaseProvider? _consolationProvider;
  SadnessDatabaseProvider? _sadnessProvider;
  AngryDatabaseProvider? _angryProvider;
  bool isAvailable = false;

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
  /***/

  // ignore: slash_for_doc_comments
  /**
   * [MoodMemos get Method]
   */

  Future<List<Memo>> loadMemo() async {
    if (widget.selectTitle == '행복') {
      return await _happyProvider!.getHappyMemos();
    } else if (widget.selectTitle == '사랑') {
      return await _loveProvider!.getLoveMemos();
    } else if (widget.selectTitle == '위로') {
      return await _consolationProvider!.getConsolationMemos();
    } else if (widget.selectTitle == '슬픔') {
      return await _sadnessProvider!.getSadnessMemos();
    } else if (widget.selectTitle == '화남') {
      return await _angryProvider!.getAngryMemos();
    }
    // ignore: null_check_always_fails
    return null!;
  }

  // ignore: slash_for_doc_comments
  /**
   * [MoodMemos Delete Mood Memos method]
   */

  Future<void> deleteMemo(int id) async {
    if (widget.selectTitle == '행복') {
      await _happyProvider!.deleteMemo(id);
    } else if (widget.selectTitle == '사랑') {
      await _loveProvider!.deleteMemo(id);
    } else if (widget.selectTitle == '위로') {
      await _consolationProvider!.deleteMemo(id);
    } else if (widget.selectTitle == '슬픔') {
      await _sadnessProvider!.deleteMemo(id);
    } else if (widget.selectTitle == '화남') {
      await _angryProvider!.deleteMemo(id);
    }
  }

  // ignore: slash_for_doc_comments
  /**
   * [MoodMemos When pressed '삭제' button show dialog Alert]
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
                deleteMemo(memo.id);
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

  // ignore: slash_for_doc_comments
  /**
   * [MoodMemo ViewMemo Method] 
   * This Method is that when you selected memo list shown your select memo on ViewMemoScreen
   */
  Future<void> viewMemo(memo) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => ViewMemoScreen(
          id: memo.id.toString(),
          dateTime: memo.dateTime,
          moodTitle: widget.selectTitle,
          title: memo.title,
          content: memo.content,
        ),
      ),
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * [ListView Widget] 
   * This Widget is only shown loadMemo() interface
   */
  Widget memoListView() {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<Memo>>(
      future: loadMemo(),
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
              dynamic memo = (snap.data as List)[index];
              return Column(
                children: [
                  Stack(
                    children: [
                      /**
                       * [DoubleTap Method] 
                       * when you dobule tap these memo, so move on ViewMemoScreen
                       */
                      GestureDetector(
                        onLongPress: () async => viewMemo(memo),
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
                                        memo.dateTime.toString().split('.')[0],
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
                                      memo.title!,
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
                                      memo.content!,
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
                                var nowDateTime = DateTime.now();
                                dynamic selectDateTime = memo.dateTime;
                                int? difference = int.tryParse(nowDateTime
                                    .difference(DateTime.parse(selectDateTime))
                                    .inDays
                                    .toString());
                                // 터치 한 메모의 시간을 가져온다.
                                // 터치한 메모 시간을 현재 시간이랑 비교했을때 현재 시간보다 적다면

                                if (difference != null && difference < 1) {
                                  isAvailable = true;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EditMemoScreen(
                                        content: memo.content,
                                        title: memo.title,
                                        moodTitle: widget.selectTitle,
                                        id: memo.id,
                                      ),
                                    ),
                                  );
                                } else {
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
                                isAvailable == true ? '수정하기' : '수정불가',
                                style: TextStyle(
                                  color: isAvailable == true
                                      ? Colors.white
                                      : Colors.red,
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
                              onPressed: () => showDeleteDialog(memo),
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
    // 그 외에 provider 접근.
    print('memolist');
    // Future<List<Memo>>
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
      ),
      body: Container(
        child: memoListView(),
      ),
    );
  }
}
