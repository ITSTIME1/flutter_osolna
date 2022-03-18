import 'package:flutter/material.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/memoRepository/memo.dart';
import 'package:osolna_application/textData/text.dart';
import 'package:osolna_application/viewModel/simple_provider.dart';
import 'package:provider/provider.dart';

// ignore: slash_for_doc_comments
/**
 * [SimpleEditMemoScreen] 
 * This Screen is shown you want to change memo
 */
// ignore: must_be_immutable
class SimpleEditMemoScreen extends StatefulWidget {
  // ignore: slash_for_doc_comments
  /**
   * [Get Memo Data] 
   * This variable receive at MoodMemoStorageScreen
   */
  String title;
  String content;
  final dynamic id;
  final String moodTitle;
  dynamic dateTime;
  SimpleEditMemoScreen({
    Key? key,
    required this.moodTitle,
    required this.id,
    required this.title,
    required this.content,
    required this.dateTime,
  }) : super(key: key);

  @override
  State<SimpleEditMemoScreen> createState() => _SimpleEditMemoScreen();
}

class _SimpleEditMemoScreen extends State<SimpleEditMemoScreen> {
  dynamic simpleMemo;
  final widgetEditText = '';
  final widgetEditContent = '';
  TextEditingController simpleEditTitle = TextEditingController();
  TextEditingController simpleEditContent = TextEditingController();

  SimpleMemoDatabaseProvider? _simpleProvider;
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
   * [Unfocus Method]
   */

  void unfocus() {
    var currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  // ignore: slash_for_doc_comments
  /**
   * [MoodMemoModify Dialog Method]
   */
  void moodSimpleMemoModifyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: appbarColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

          // ** Modify Method Main Text Dialog **

          title: Column(
            children: [
              Text(
                '수정이 완료되었습니다',
                style: TextStyle(
                  color: logoColor,
                  fontFamily: nanumMyeongjo,
                  fontSize: hintTextSize,
                ),
              ),
            ],
          ),

          // ** Modify Method Sub Text Title **

          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '성공적으로 수정했습니다.',
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
   * [FindMemo Method] 
   * This Method is load method that's means it is for FutureBuilder
   */
  Future<List<Memo>> simplefindMemo(id) async {
    if (widget.moodTitle == '간단메모') {
      return await _simpleProvider!.findSimpleMemos(id);
    }
    // ignore: null_check_always_fails
    return null!;
  }

  // ignore: slash_for_doc_comments
  /**
   * [SimpleMemo Modify Method] 
   * This Method is that when you pressed '수정하기' occur this method
   * widget.title, widget.content 를 그대로 넘겨주는 이유는
   * 1. 처음 수정하기 버튼을 클릭후 가져온 값을 보여줄때 텍스트 필드에 표시해주기 위해서
   * 2. 수정한 내용을 그대로 다시 반영해주기 위해서.
   */
  Future<void> updateSimpleMemo(simpleMemo) async {
    if (widget.moodTitle == '간단메모') {
      await _simpleProvider!.updateSimpleMemo(
        simpleMemo = Memo(
          id: widget.id,
          title: widget.title.toString(),
          content: widget.content.toString(),
          dateTime: DateTime.now().toString(),
        ),
      );
      moodSimpleMemoModifyDialog();
    }
  }

  // ignore: slash_for_doc_comments
  /**
   * [Widget EditScreen]
   */
  Widget simpleEditScreen() {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<Memo>>(
      future: simplefindMemo(widget.id),
      builder: (BuildContext context, snapshot) {
        if (snapshot.data == null || snapshot.data!.isEmpty) {
          return const Text(
            '해당 메모를 불러올 수 없습니다',
          );
        } else {
          /**
           * [Get data into title,content]
           */
          final widgetEditText = widget.title;
          final widgetEditContent = widget.content;
          simpleEditTitle.text = widgetEditText;
          simpleEditContent.text = widgetEditContent;

          return GestureDetector(
            onTap: () => unfocus(),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height / 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 30.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () async =>
                                    updateSimpleMemo(simpleMemo),
                                child: Text(
                                  '수정하기 ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: nanumMyeongjo,
                                  ),
                                ),
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
                                  onChanged: (value) {
                                    widget.title = value;
                                  },
                                  maxLines: 1,
                                  maxLength: 10,
                                  controller: simpleEditTitle
                                    ..selection = TextSelection.fromPosition(
                                      TextPosition(
                                          offset: simpleEditTitle.text.length),
                                    ),
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
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),

                                    // ** Focusing State **

                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.cyan),
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
                                          onChanged: (value) {
                                            widget.content = value;
                                          },
                                          controller: simpleEditContent
                                            ..selection =
                                                TextSelection.fromPosition(
                                                    TextPosition(
                                                        offset:
                                                            simpleEditContent
                                                                .text.length)),
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
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: simpleEditScreen(),
    );
  }
}
