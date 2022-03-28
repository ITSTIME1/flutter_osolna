import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
 * [EditMemoScreen] 
 * This page is that when after user clicked move on mood page shown
 */

class EditMemoScreen extends StatefulWidget {
  final dynamic id;
  final String title;
  final String content;
  final String moodTitle;
  const EditMemoScreen(
      {Key? key,
      required this.title,
      required this.content,
      required this.moodTitle,
      required this.id})
      : super(key: key);

  @override
  State<EditMemoScreen> createState() => _EditMemoScreenState();
}

class _EditMemoScreenState extends State<EditMemoScreen> {
  dynamic memo;
  String? saveTitle;
  String? saveContent;
  final editTitle = TextEditingController();
  final editContent = TextEditingController();
  static final _editFormKey = GlobalKey<FormState>();

  // ignore: slash_for_doc_comments
  /**
   * [Providers] 
   * This variable is that it is access global section.
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
    editTitle;
    editContent;
    saveTitle = widget.title;
    saveContent = widget.content;
    editTitle.text = saveTitle!;
    editContent.text = saveContent!;
    super.initState();
  }

  @override
  void dispose() {
    _happyProvider;
    _loveProvider;
    _consolationProvider;
    _sadnessProvider;
    _angryProvider;
    editTitle;
    editContent;
    super.dispose();
  }

  // ignore: slash_for_doc_comments
  /**
   * [MoodShowDialog Method] 
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
   * [MoodMemoDialog]
   */
  void moodMemoModifyDialog() {
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
   * [MoodMemoFind]
   */
  Future<List<Memo>> findMemo(id) async {
    if (widget.moodTitle == '행복') {
      return await _happyProvider!.findMemos(id);
    } else if (widget.moodTitle == '사랑') {
      return await _loveProvider!.findMemos(id);
    } else if (widget.moodTitle == '위로') {
      return await _consolationProvider!.findMemos(id);
    } else if (widget.moodTitle == '슬픔') {
      return await _sadnessProvider!.findMemos(id);
    } else if (widget.moodTitle == '화남') {
      return await _angryProvider!.findMemos(id);
    }
    // ignore: null_check_always_fails
    return null!;
  }
  // ignore: slash_for_doc_comments
  /**
   * [Modify Method]
   */

  Future<void> updateMemo(memo) async {
    if (widget.moodTitle == '행복') {
      await _happyProvider!.updateHappyMemo(
        memo = Memo(
          id: widget.id,
          title: editTitle.text,
          content: editContent.text,
          dateTime: DateTime.now().toString().split('.')[0],
        ),
      );
      moodMemoModifyDialog();
    } else if (widget.moodTitle == '사랑') {
      await _loveProvider!.updateLoveMemo(
        memo = Memo(
          id: widget.id,
          title: editTitle.text,
          content: editContent.text,
          dateTime: DateTime.now().toString().split('.')[0],
        ),
      );
      moodMemoModifyDialog();
    } else if (widget.moodTitle == '위로') {
      await _consolationProvider!.updateConsolationMemo(
        memo = Memo(
          id: widget.id,
          title: editTitle.text,
          content: editContent.text,
          dateTime: DateTime.now().toString().split('.')[0],
        ),
      );
      moodMemoModifyDialog();
    } else if (widget.moodTitle == '슬픔') {
      await _sadnessProvider!.updateSadnessMemo(
        memo = Memo(
          id: widget.id,
          title: editTitle.text,
          content: editContent.text,
          dateTime: DateTime.now().toString().split('.')[0],
        ),
      );
      moodMemoModifyDialog();
    } else if (widget.moodTitle == '화남') {
      await _angryProvider!.updateAngryMemo(
        memo = Memo(
          id: widget.id,
          title: editTitle.text,
          content: editContent.text,
          dateTime: DateTime.now().toString().split('.')[0],
        ),
      );
    }
  }

  // ignore: slash_for_doc_comments
  /**
   * [MainMemoScreen Widget]
   * This Screen is main memo Screen
  */

  Widget editMemoScreen() {
    return GestureDetector(
      onTap: () => unfocus(),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Form(
              key: _editFormKey,
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
                                  onPressed: () => updateMemo(memo),
                                  child: const Text(
                                    '수정하기',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TextFormField(
                              onSaved: (titleText) {
                                editTitle.text = titleText!;
                              },
                              textInputAction: TextInputAction.next,
                              autofocus: false,
                              maxLines: 1,
                              maxLength: 10,
                              controller: editTitle,
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
                                  maxHeight: 300.h - 113 - 48,
                                ),
                                child: Scrollbar(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    reverse: false,
                                    child: TextFormField(
                                      onSaved: (contentText) {
                                        editContent.text = contentText!;
                                      },
                                      textInputAction: TextInputAction.done,
                                      controller: editContent,
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('EditScreen');
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
      body: editMemoScreen(),
    );
  }
}
