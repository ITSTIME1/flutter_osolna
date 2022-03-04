import 'package:flutter/material.dart';

class MoodSelectScreen extends StatefulWidget {
  const MoodSelectScreen({Key? key}) : super(key: key);

  @override
  State<MoodSelectScreen> createState() => _MoodSelectScreenState();
}

class _MoodSelectScreenState extends State<MoodSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MoodStorageScreen extends StatefulWidget {
  const MoodStorageScreen({Key? key}) : super(key: key);

  @override
  State<MoodStorageScreen> createState() => _MoodStorageScreenState();
}

class _MoodStorageScreenState extends State<MoodStorageScreen> {
  @override
  Widget build(BuildContext context) {
    print('modelStorageScreen');
    return Container();
  }
}

class SimpleMemoScreen extends StatefulWidget {
  const SimpleMemoScreen({Key? key}) : super(key: key);

  @override
  State<SimpleMemoScreen> createState() => _SimpleMemoScreenState();
}

class _SimpleMemoScreenState extends State<SimpleMemoScreen> {
  @override
  Widget build(BuildContext context) {
    print('simpleMemoScreen');
    return Container();
  }
}

class SimpleMemoStorageScreen extends StatefulWidget {
  const SimpleMemoStorageScreen({Key? key}) : super(key: key);

  @override
  State<SimpleMemoStorageScreen> createState() =>
      _SimpleMemoStorageScreenState();
}

class _SimpleMemoStorageScreenState extends State<SimpleMemoStorageScreen> {
  @override
  Widget build(BuildContext context) {
    print('simpleMemoStorageScreen');
    return Container();
  }
}
