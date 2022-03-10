import 'package:flutter/material.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/memoRepository/memo.dart';
import 'package:osolna_application/textData/text.dart';
import 'package:osolna_application/viewModel/happy_provider.dart';
import 'package:provider/provider.dart';

// ignore: slash_for_doc_comments
/**
 * [MoodMemoList] This page is that you written moodmemo.
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
  HappyDatabaseProvider? _happyProvider = HappyDatabaseProvider();

  /***/

  // ignore: slash_for_doc_comments
  /**
   * [MoodMemos get Method]
   */

  Future<List<Memo>> loadMemo() async {
    if (widget.selectTitle == '행복') {
      return await _happyProvider!.getHappyMemos();
    } else if (widget.selectTitle == '사랑') {
    } else if (widget.selectTitle == '위로') {
    } else if (widget.selectTitle == '슬픔') {
    } else if (widget.selectTitle == '화남') {}
    // ignore: null_check_always_fails
    return null!;
  }

  // ignore: slash_for_doc_comments
  /**
   * [ListView Widget]
   */

  Widget memoListView() {
    return FutureBuilder<List<Memo>>(
      future: loadMemo(),
      builder: (context, snap) {
        // ignore: unrelated_type_equality_checks
        if (snap.data == null || snap.data!.isEmpty) {
          return const CircularProgressIndicator();
        } else {
          return ListView.builder(
            itemCount: (snap.data as List).length,
            itemBuilder: (context, index) {
              Memo memo = (snap.data as List)[index];
              return Column(
                children: [
                  Text(memo.content!),
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
    _happyProvider = Provider.of<HappyDatabaseProvider>(context, listen: false);
    // 그 외에 provider 접근.
    print('memolist');
    // Future<List<Memo>>
    Size size = MediaQuery.of(context).size;
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
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 38.0),
            child: Icon(
              Icons.menu,
              size: 25.0,
            ),
          ),
        ],
      ),
      /**
       * [MoodConsumer] This can access multiProvider
       * etc. happy, sad, love..
       */
      body: Consumer5(
        builder: (BuildContext context, happyProvider1, loveProvider2,
            consolationProvider3, sadnessProvider4, angryProvider5, child) {
          return memoListView();
        },
      ),
    );
  }
}
