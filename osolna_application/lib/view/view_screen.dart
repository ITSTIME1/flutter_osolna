import 'package:flutter/material.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/textData/text.dart';

// ignore: slash_for_doc_comments
/**
 * [ViewMemoScreen] This screen is brings up a specific memo you wrote and shows it
 */
class ViewMemoScreen extends StatefulWidget {
  final String id;
  final dynamic dateTime;
  final String moodTitle;
  final String title;
  final String content;
  const ViewMemoScreen({
    Key? key,
    required this.id,
    required this.dateTime,
    required this.title,
    required this.content,
    required this.moodTitle,
  }) : super(key: key);

  @override
  State<ViewMemoScreen> createState() => _ViewMemoScreenState();
}

class _ViewMemoScreenState extends State<ViewMemoScreen> {
  @override
  void initState() {
    widget.dateTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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

        // ** Memo Save Button **
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height / 10,
                    ),
                    /**
                     * [View DateTime]
                     */
                    Text(
                      widget.dateTime.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: nanumMyeongjo,
                      ),
                    ),
                    SizedBox(
                      height: size.height / 20,
                    ),
                    /**
                     * [View MoodTitle]
                     */
                    Text(
                      widget.moodTitle,
                      style: TextStyle(
                        color: listViewHappyMoodTextColor,
                        fontFamily: nanumMyeongjo,
                      ),
                    ),
                    SizedBox(
                      height: size.height / 20,
                    ),
                    /**
                     * [View MemoTitle]
                     */
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: nanumGothic,
                        fontSize: hintTextSize,
                      ),
                    ),
                    SizedBox(
                      height: size.height / 18,
                    ),
                    /**
                     * [View MemoContent]
                     */
                    Text(
                      widget.content,
                      style: TextStyle(
                        letterSpacing: 1.5,
                        color: contentTextColor,
                        fontFamily: nanumGothic,
                        fontSize: subTextSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
