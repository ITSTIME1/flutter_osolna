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
 * [EditMemoScreen] 
 * This Screen is shown you want to change memo
 */
// ignore: must_be_immutable
class EditMemoScreen extends StatefulWidget {
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
  EditMemoScreen({
    Key? key,
    required this.moodTitle,
    required this.id,
    required this.title,
    required this.content,
    required this.dateTime,
  }) : super(key: key);

  @override
  State<EditMemoScreen> createState() => _EditMemoScreenState();
}

class _EditMemoScreenState extends State<EditMemoScreen> {
  String title = '';
  String content = '';
  String widgetTitle = '';
  String widgetContent = '';
  dynamic memo;
  var editTitle = TextEditingController();
  var editContent = TextEditingController();
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
    widgetTitle = widget.title;
    widgetContent = widget.content;
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
   * [FindMemo Method] 
   * This Method is load method that's means it is for FutureBuilder
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
   * [MoodMemo Modify Method] 
   * This Method is that when you pressed '수정하기' occur this method
   * widget.title, widget.content 를 그대로 넘겨주는 이유는
   * 수정한 내용은 title,content 내용을 직접 전해줌.
   */
  Future<void> updateMemo(memo) async {
    if (widget.moodTitle == '행복') {
      await _happyProvider!.updateHappyMemo(
        memo = Memo(
          id: widget.id,
          title: title.toString(),
          content: content.toString(),
          dateTime: DateTime.now().toString().split('.')[0],
        ),
      );
      moodMemoModifyDialog();
    } else if (widget.moodTitle == '사랑') {
      await _loveProvider!.updateLoveMemo(
        memo = Memo(
          id: widget.id,
          title: title.toString(),
          content: content.toString(),
          dateTime: DateTime.now().toString().split('.')[0],
        ),
      );
      moodMemoModifyDialog();
    } else if (widget.moodTitle == '위로') {
      await _consolationProvider!.updateConsolationMemo(
        memo = Memo(
          id: widget.id,
          title: title.toString(),
          content: content.toString(),
          dateTime: DateTime.now().toString().split('.')[0],
        ),
      );
      moodMemoModifyDialog();
    } else if (widget.moodTitle == '슬픔') {
      await _sadnessProvider!.updateSadnessMemo(
        memo = Memo(
          id: widget.id,
          title: title.toString(),
          content: content.toString(),
          dateTime: DateTime.now().toString().split('.')[0],
        ),
      );
      moodMemoModifyDialog();
    } else if (widget.moodTitle == '화남') {
      await _angryProvider!.updateAngryMemo(
        memo = Memo(
          id: widget.id,
          title: title.toString(),
          content: content.toString(),
          dateTime: DateTime.now().toString().split('.')[0],
        ),
      );
    }
  }

  // ignore: slash_for_doc_comments
  /**
   * [Widget EditScreen]
   */
  Widget editScreen() {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<Memo>>(
      future: findMemo(widget.id),
      builder: (BuildContext context, snapshot) {
        /**
         * [EditTitle, EditContent Fix]
         * title, content bring Parent Widget.
         */
        editTitle.text = widgetTitle;
        editContent.text = widgetContent;

        if (snapshot.data == null || snapshot.data!.isEmpty) {
          return const Text(
            '해당 메모를 불러올 수 없습니다',
          );
        } else {
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
                                onPressed: () async => updateMemo(memo),
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
                                  onChanged: (String titleText) {
                                    title = titleText;
                                  },
                                  maxLines: 1,
                                  maxLength: 10,
                                  controller: editTitle
                                    ..selection = TextSelection.fromPosition(
                                        TextPosition(
                                            offset: editTitle.text.length)),
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
                                          onChanged: (String contentText) {
                                            content = contentText;
                                          },
                                          controller: editContent
                                            ..selection =
                                                TextSelection.fromPosition(
                                                    TextPosition(
                                                        offset: editContent
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
      body: editScreen(),
    );
  }
}
