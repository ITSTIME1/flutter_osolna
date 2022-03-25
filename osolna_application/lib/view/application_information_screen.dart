import 'package:flutter/material.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/textData/text.dart';

// ignore: slash_for_doc_comments
/**
 * [DeveloperScreen]
 * This Screen introducation Developer Screen
 */
class DeveloperScreen extends StatelessWidget {
  const DeveloperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
      backgroundColor: mainbackgroundColor,
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10.0),
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Android Developer',
                        style: TextStyle(
                          color: logoColor,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(
                        height: size.height / 15,
                      ),
                      Text(
                        '"앱을 개발한 동기"',
                        style: TextStyle(
                          color: listContentTitleColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: size.height / 25,
                      ),
                      Text(
                        '퇴근후에 대중교통에서\n모두가 똑같이 핸드폰을 바라보는 모습에서\n아이디어를 떠올리게 되었습니다.',
                        style: TextStyle(
                          color: subtextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: size.height / 10,
                      ),
                      Text(
                        '"음악은 슬라이드로 조절하는게 왜 없나요?"',
                        style: TextStyle(
                          color: listContentTitleColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: size.height / 25,
                      ),
                      Text(
                        '음악을 들을려고 작성하는것이 아닌\n음악과 함께 나의 감정에 집중하면서\n작성하는걸 지향했기 때문입니다.',
                        style: TextStyle(
                          color: subtextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: size.height / 10,
                      ),
                      Text(
                        '"음악이 정해져 있는 이유가 있나요?"',
                        style: TextStyle(
                          color: listContentTitleColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: size.height / 25,
                      ),
                      Text(
                        '음악을 선택하게 되면\n그 음악에 맞춰서 나의 감정은 변하게 됩니다\n그렇기 때문에 음악은 정해져 있으면서\n솔직한 나의 감정을 녹여내는데 집중시키고 싶었습니다.',
                        style: TextStyle(
                          color: subtextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: size.height / 10,
                      ),
                      Text(
                        '"데이터는 어디에 저장되나요?"',
                        style: TextStyle(
                          color: listContentTitleColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: size.height / 25,
                      ),
                      Text(
                        '작성한 메모(일기)는 로컬(local database)에 저장됩니다.\n따로 서버를 두지 않고\n자신만 관리할 수 있도록 개발되었습니다.\n그렇기 때문에\n한번 "삭제된 데이터는 복구되지 않습니다."',
                        style: TextStyle(
                          color: subtextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
