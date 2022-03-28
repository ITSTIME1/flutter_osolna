import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/memoRepository/memo.dart';
import 'package:osolna_application/textData/text.dart';
import 'package:osolna_application/viewModel/simple_provider.dart';
import 'package:provider/provider.dart';

// ignore: slash_for_doc_comments
/**
 * [SimpleEditMemoScreen] 
 * This page is that when after user clicked move on mood page shown
 */

class SimpleEditMemoScreen extends StatefulWidget {
  final dynamic id;
  final String title;
  final String content;
  final String moodTitle;
  const SimpleEditMemoScreen(
      {Key? key,
      required this.title,
      required this.content,
      required this.moodTitle,
      required this.id})
      : super(key: key);

  @override
  State<SimpleEditMemoScreen> createState() => _SimpleEditMemoScreenState();
}

class _SimpleEditMemoScreenState extends State<SimpleEditMemoScreen> {
  dynamic memo;
  String? simpleSaveTitle;
  String? simpleSaveContent;
  final simpleEditTitle = TextEditingController();
  final simpleEditContent = TextEditingController();
  static final _simpleEditFormKey = GlobalKey<FormState>();
  SimpleMemoDatabaseProvider? _simpleMemoDatabaseProvider;

  @override
  void initState() {
    _simpleMemoDatabaseProvider =
        Provider.of<SimpleMemoDatabaseProvider>(context, listen: false);
    simpleEditTitle;
    simpleEditContent;
    simpleSaveTitle = widget.title;
    simpleSaveContent = widget.content;
    simpleEditTitle.text = simpleSaveTitle!;
    simpleEditContent.text = simpleSaveContent!;
    super.initState();
  }

  @override
  void dispose() {
    _simpleMemoDatabaseProvider;
    simpleEditTitle;
    simpleEditContent;
    super.dispose();
  }

  // ignore: slash_for_doc_comments
  /**
   * [SimpleDialog Method] 
   * This Method can show AlertDialog when you success the save button
   */
  void moodMemoShowDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: appbarColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Column(
            children: [
              Text(
                '수정',
                style: TextStyle(
                  color: maintextColor,
                  fontSize: subTextSize,
                ),
              ),
            ],
          ),
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
   * [SimpleEdit MemoDialog]
   */
  void simpleMemoModifyDialog() {
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
   * [SimpleEdit MemoFind]
   */
  Future<List<Memo>> findSimpleMemo(id) async {
    return await _simpleMemoDatabaseProvider!.findSimpleMemos(id);
  }
  // ignore: slash_for_doc_comments
  /**
   * [SimpleEditModify Method]
   */

  Future<void> updateSimpleMemo(simpleMemo) async {
    await _simpleMemoDatabaseProvider!.updateSimpleMemo(
      simpleMemo = Memo(
        id: widget.id,
        title: simpleEditTitle.text,
        content: simpleEditContent.text,
        dateTime: DateTime.now().toString().split('.')[0],
      ),
    );
    simpleMemoModifyDialog();
  }

  // ignore: slash_for_doc_comments
  /**
   * [MainMemoScreen Widget]
   * This Screen is main memo Screen
  */

  Widget simpleEditMemoScreen() {
    return GestureDetector(
      onTap: () => unfocus(),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Form(
              key: _simpleEditFormKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 120.h,
                    ),
                    Container(
                      height: 300.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        color: appbarColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(10.0),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () => updateSimpleMemo(memo),
                                  child: const Text(
                                    '수정하기',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            TextFormField(
                              onSaved: (titleText) {
                                simpleEditTitle.text = titleText!;
                              },
                              textInputAction: TextInputAction.next,
                              maxLines: 1,
                              maxLength: 10,
                              controller: simpleEditTitle,
                              style: TextStyle(
                                color: contentTextColor,
                                fontFamily: nanumGothic,
                                fontSize: titleTextColor,
                              ),

                              // ** Focusing State Text **

                              decoration: InputDecoration(
                                counterStyle: TextStyle(color: logoColor),
                                hintText: "제목을 적어주세요",
                                hintStyle: TextStyle(
                                    fontSize: hintTextSize,
                                    fontFamily: nanumMyeongjo,
                                    color: Colors.grey),

                                // ** Static State Text **

                                labelText: "오늘은 어땠어?",
                                labelStyle: TextStyle(
                                    fontSize: hintTextSize,
                                    color: Colors.white,
                                    fontFamily: nanumMyeongjo),

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
                                  maxHeight: 300.h - 113 - 48,
                                ),
                                child: Scrollbar(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    reverse: false,
                                    child: TextFormField(
                                      onSaved: (contentText) {
                                        simpleEditContent.text = contentText!;
                                      },
                                      textInputAction: TextInputAction.done,
                                      controller: simpleEditContent,
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
                                            color: Colors.grey),
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

  @override
  Widget build(BuildContext context) {
    print('SimpleEditScreen');
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
      body: simpleEditMemoScreen(),
    );
  }
}
