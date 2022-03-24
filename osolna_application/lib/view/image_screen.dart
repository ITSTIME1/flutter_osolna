import 'package:flutter/material.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/textData/text.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageInformationScreen extends StatelessWidget {
  const ImageInformationScreen({Key? key}) : super(key: key);

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
                          const url = 'https://unsplash.com/@eberhardgross';
                          if (await canLaunch(url)) {
                            launch(url);
                          } else {
                            // ignore: avoid_print
                            print("Can't launch $url");
                          }
                        },
                        child: Text(
                          '행복',
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
                          const url = 'https://unsplash.com/@anniespratt';
                          if (await canLaunch(url)) {
                            launch(url);
                          } else {
                            // ignore: avoid_print
                            print("Can't launch $url");
                          }
                        },
                        child: Text(
                          '사랑',
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
                          const url = 'https://unsplash.com/@von_co';
                          if (await canLaunch(url)) {
                            launch(url);
                          } else {
                            // ignore: avoid_print
                            print("Can't launch $url");
                          }
                        },
                        child: Text(
                          '위로',
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
                          const url = 'https://unsplash.com/@thommilkovic';
                          if (await canLaunch(url)) {
                            launch(url);
                          } else {
                            // ignore: avoid_print
                            print("Can't launch $url");
                          }
                        },
                        child: Text(
                          '슬픔',
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
                          const url = 'https://unsplash.com/@kenrickmills';
                          if (await canLaunch(url)) {
                            launch(url);
                          } else {
                            // ignore: avoid_print
                            print("Can't launch $url");
                          }
                        },
                        child: Text(
                          '화남',
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
