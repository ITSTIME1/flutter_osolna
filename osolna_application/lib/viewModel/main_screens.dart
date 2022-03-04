import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index, int pageViewIndex) {
        return const Text('테스트');
      },
      options: CarouselOptions(),
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
