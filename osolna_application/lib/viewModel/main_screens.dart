import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/slideData/sliding_data.dart';
import 'package:osolna_application/textData/text.dart';

// ignore: slash_for_doc_comments
/**
 * [MoodSelectScreen] This class is MoodSelectScreen
 * By using carouselSlider, choice today mood card
 */
// ignore: must_be_immutable
class MoodSelectScreen extends StatefulWidget {
  const MoodSelectScreen({Key? key}) : super(key: key);

  @override
  State<MoodSelectScreen> createState() => _MoodSelectScreenState();
}

class _MoodSelectScreenState extends State<MoodSelectScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('MoodSelectScreen');
    return CarouselSlider.builder(
      itemCount: MoodSelect.card.length,
      itemBuilder: (BuildContext context, int index, int _) {
        return Stack(
          children: [
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '오늘의 나의 감정은',
                      style: TextStyle(
                        color: maintextColor,
                        fontFamily: nanumMyeongjo,
                      ),
                    ),
                    SizedBox(
                      height: size.height / 25,
                    ),
                    Text(
                      MoodSelect.card[index].moodTitle!,
                      style: TextStyle(
                        color: maintextColor,
                        fontSize: subtextSize,
                        fontFamily: nanumMyeongjo,
                      ),
                    ),
                    SizedBox(
                      height: size.height / 25,
                    ),
                    /***
                     * 이미지를 눌렀을때

if(MoodSection.card[index].moodTitle = '행복'){
// 행복저장
	title = MoodSection.card[index].moodTitle;
	Navigation.push(context => MateriaPageRoute(builder(context) => MemoWrite());
}
                     */
                    Image.asset(
                      MoodSelect.card[index].image!,
                      height: size.height / 2,
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
      options: CarouselOptions(
        initialPage: 0,
        aspectRatio: 16 / 9,
        height: size.height / 1,
      ),
    );
  }
}

// ignore: slash_for_doc_comments
/**
 * [MoodStorageScreen]
 */
class MoodStorageScreen extends StatefulWidget {
  const MoodStorageScreen({Key? key}) : super(key: key);

  @override
  State<MoodStorageScreen> createState() => _MoodStorageScreenState();
}

class _MoodStorageScreenState extends State<MoodStorageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// ignore: slash_for_doc_comments
/**
 * [SimpleMemoScreen]
 */
class SimpleMemoScreen extends StatefulWidget {
  const SimpleMemoScreen({Key? key}) : super(key: key);

  @override
  State<SimpleMemoScreen> createState() => _SimpleMemoScreenState();
}

class _SimpleMemoScreenState extends State<SimpleMemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// ignore: slash_for_doc_comments
/**
 * [SimpleMemoStorageScreen]
 */
class SimpleMemoStorageScreen extends StatefulWidget {
  const SimpleMemoStorageScreen({Key? key}) : super(key: key);

  @override
  State<SimpleMemoStorageScreen> createState() =>
      _SimpleMemoStorageScreenState();
}

class _SimpleMemoStorageScreenState extends State<SimpleMemoStorageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
