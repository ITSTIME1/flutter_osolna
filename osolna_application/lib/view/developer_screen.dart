import 'package:flutter/material.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/textData/text.dart';

// ignore: slash_for_doc_comments
/**
 * [DeveloperScree]
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
      body: Stack(
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
                    ),
                  ),
                  SizedBox(
                    height: size.height / 15,
                  ),
                  Text(
                    '안녕하세요\n\n"오솔나" 어플리케이션 개발자 ITSTIME 입니다.\n앱을 사용하는데 불편한점은 없으신가요? 만약 있으시다면 PlayStore 혹은 Email로 귀견을 전해주시면 감사하겠습니다.\n',
                    style: TextStyle(
                      color: subtextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height / 25,
                  ),
                  Text(
                    '오솔나 어플리케이션은\n\n"직장에서 퇴근하던 중 아이디어가 떠올라 개발하게 되었습니다."\n저는 개발과 관련된 직장을 가지고 있는 사람이 아닙니다.\n그저 개발을 좋아하고 공부하는 개발자입니다.\n사용하기 쉽고, 복잡한 기능 없이\n내가 만들고 싶은 기능을 구현하는게 저의 모토입니다.\n',
                    style: TextStyle(
                      color: subtextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height / 25,
                  ),
                  Text(
                    '여러분들은\n\n직장에서 퇴근하면서 대중교통을 이용할때\n우리들은 무엇을 보고 있을까요..\n대부분의 사람들은 스마트폰으로 소셜미디어\n플랫폼 등을 이용하고 있을겁니다.\n그럼..오늘 하루를 어떻게 보냈는지\n생각하는 시간은 따로 마련해두셨나요?',
                    style: TextStyle(
                      color: subtextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height / 25,
                  ),
                  Text(
                    '만약 그런 소중한 시간이 없으시다면\n지금부터 만들어 보는게 어떤가요?\n오솔나가 함께하겠습니다.',
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
    );
  }
}
