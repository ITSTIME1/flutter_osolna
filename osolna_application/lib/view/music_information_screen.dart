import 'package:flutter/material.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/textData/text.dart';
import 'package:url_launcher/url_launcher.dart';

class MusicInformationScreen extends StatelessWidget {
  const MusicInformationScreen({Key? key}) : super(key: key);

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
                      SizedBox(
                        height: size.height / 10,
                      ),
                      TextButton(
                        onPressed: () async {
                          const url =
                              'https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=5718';
                          if (await canLaunch(url)) {
                            launch(url);
                          } else {
                            // ignore: avoid_print
                            print("Can't launch $url");
                          }
                        },
                        child: Text(
                          '행복에 사용된 음악',
                          style: TextStyle(
                            color: listContentTitleColor,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 15,
                      ),
                      TextButton(
                        onPressed: () async {
                          const url =
                              'https://pixabay.com/music/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=6674';
                          if (await canLaunch(url)) {
                            launch(url);
                          } else {
                            // ignore: avoid_print
                            print("Can't launch $url");
                          }
                        },
                        child: Text(
                          '사랑에 사용된 음악',
                          style: TextStyle(
                            color: listContentTitleColor,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 15,
                      ),
                      TextButton(
                        onPressed: () async {
                          const url =
                              'https://pixabay.com/music/search/zakharvalaha/';
                          if (await canLaunch(url)) {
                            launch(url);
                          } else {
                            // ignore: avoid_print
                            print("Can't launch $url");
                          }
                        },
                        child: Text(
                          '위로에 사용된 음악',
                          style: TextStyle(
                            color: listContentTitleColor,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 15,
                      ),
                      TextButton(
                        onPressed: () async {
                          const url =
                              'https://pixabay.com/music/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=5717';
                          if (await canLaunch(url)) {
                            launch(url);
                          } else {
                            // ignore: avoid_print
                            print("Can't launch $url");
                          }
                        },
                        child: Text(
                          '슬픔에 사용된 음악',
                          style: TextStyle(
                            color: listContentTitleColor,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 15,
                      ),
                      TextButton(
                        onPressed: () async {
                          const url =
                              'https://pixabay.com/music/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=21257';
                          if (await canLaunch(url)) {
                            launch(url);
                          } else {
                            // ignore: avoid_print
                            print("Can't launch $url");
                          }
                        },
                        child: Text(
                          '화남에 사용된 음악',
                          style: TextStyle(
                            color: listContentTitleColor,
                            fontSize: 18.0,
                          ),
                        ),
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
