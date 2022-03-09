import 'package:flutter/material.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/memoRepository/memo.dart';
import 'package:osolna_application/textData/text.dart';
import 'package:osolna_application/viewModel/happy_provider.dart';
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
  HappyDatabaseProvider? _happyProvider;
  dynamic memo;
  final title = TextEditingController();
  final content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _happyProvider = Provider.of<HappyDatabaseProvider>(context, listen: false);
    print('프로바이더');
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
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
                onPressed: () {
                  // memo 를 받아주고
                  // map 시키는 provider 메소드에 접근해서 memo를 넘겨준다.
                  // insertMemo 메서드가 실행되면 메모가 저장된다.
                  memo = Memo(
                    title: title.text,
                    content: content.text,
                    dateTime: DateTime.now(),
                  );
                  _happyProvider!.insertMemo(memo);
                  print('저장완료');
                },
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
                              controller: title,
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
