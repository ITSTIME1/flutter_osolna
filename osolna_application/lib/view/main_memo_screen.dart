import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/memoRepository/memo.dart';
import 'package:osolna_application/textData/text.dart';
import 'package:osolna_application/viewModel/angry_provider.dart';
import 'package:osolna_application/viewModel/consolation_provider.dart';
import 'package:osolna_application/viewModel/happy_provider.dart';
import 'package:osolna_application/viewModel/love_provider.dart';
import 'package:osolna_application/viewModel/sadness_provider.dart';
import 'package:provider/provider.dart';

// ignore: slash_for_doc_comments
/**
 * [MainMemoScreen] 
 * This page is that when after user clicked move on mood page shown
 */

class MainMemoScreen extends StatefulWidget {
  final String moodText;
  // 전달받는 뮤직이름.
  final String selectMusic;

  const MainMemoScreen(
      {Key? key, required this.moodText, required this.selectMusic})
      : super(key: key);

  @override
  State<MainMemoScreen> createState() => _MainMemoScreenState();
}

class _MainMemoScreenState extends State<MainMemoScreen> {
  dynamic memo;
  final title = TextEditingController();
  final content = TextEditingController();
  static final _formKey = GlobalKey<FormState>();

  // ignore: slash_for_doc_comments
  /**
   * [Providers] 
   * This variable is that it is access global section.
   */
  HappyDatabaseProvider? _happyProvider;
  LoveDatabaseProvider? _loveProvider;
  ConsolationDatabaseProvider? _consolationProvider;
  SadnessDatabaseProvider? _sadnessProvider;
  AngryDatabaseProvider? _angryProvider;
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioCache? audioCache;

  @override
  void initState() {
    _happyProvider = Provider.of<HappyDatabaseProvider>(context, listen: false);
    _loveProvider = Provider.of<LoveDatabaseProvider>(context, listen: false);
    _consolationProvider =
        Provider.of<ConsolationDatabaseProvider>(context, listen: false);
    _sadnessProvider =
        Provider.of<SadnessDatabaseProvider>(context, listen: false);
    _angryProvider = Provider.of<AngryDatabaseProvider>(context, listen: false);
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    initStateChangeMethod();
    title;
    content;
    super.initState();
  }

  @override
  void dispose() {
    _happyProvider;
    _loveProvider;
    _consolationProvider;
    _sadnessProvider;
    _angryProvider;
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache!.clearAll();
    initStateChangeMethod();
    title;
    content;
    super.dispose();
  }

  // ignore: slash_for_doc_comments
  /**
   * [MusicStateChange Method] 
   * This method is that when you pressed 'audioPlayer' button perform a state change
   * The status is constantly changed by 'setState()'
   */

  Future<StreamSubscription<PlayerState>?> initStateChangeMethod() async {
    try {
      StreamSubscription<PlayerState> state =
          audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
        if (mounted) {
          setState(() {
            audioPlayerState = state;
          });
        }
      });
      return state;
    } catch (e) {
      print(e);
    }
  }
  // ignore: slash_for_doc_comments
  /**
   * [MusicPlay Method]
   * This method is used when in the 'PlayerState.PAUSED' state.
   * If you press the play button in the 'Pause' state
   * Perform a musicPlay
   */

  Future<AudioPlayer?> playMusic() async {
    try {
      if (audioPlayerState == PlayerState.PAUSED) {
        var play = await audioCache!.play(widget.selectMusic);
        return play;
      }
    } catch (e) {
      print(e);
    }
  }

  // ignore: slash_for_doc_comments
  /**
   * [MusicPause Method]
   * This method is used when in the 'PlayerState.PLAYING' state.
   * If you press the pause button in the 'PLAYING' state
   * Perform a musicPause
   */

  Future<int?> pauseMusic() async {
    try {
      if (audioPlayerState == PlayerState.PLAYING) {
        var pause = await audioPlayer.pause();
        return pause;
      } else if (audioPlayerState == PlayerState.STOPPED) {
        print('음악 재생을 눌러주세요');
      }
    } catch (e) {
      print(e);
    }
  }

  // ignore: slash_for_doc_comments
  /**
   * [MoodShowDialog Method] 
   * This Method can show AlertDialog when you success the save button
   */
  void moodMemoShowDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: appbarColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

          // ** Dialog Main Title **

          title: Column(
            children: [
              Text(
                widget.moodText + '저장소',
                style: TextStyle(
                  color: logoColor,
                  fontFamily: nanumMyeongjo,
                  fontSize: hintTextSize,
                ),
              ),
            ],
          ),

          // ** Dialog Sub Title **

          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '성공적으로 저장했습니다.',
                style: TextStyle(
                  color: maintextColor,
                  fontSize: subTextSize,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * [MoodSaveButton Method] 
   * This Method can save wrote memo
   */
  Future<void> saveMemoButton() async {
    if (widget.moodText == '행복') {
      await _happyProvider!.insertMemo(
        memo = Memo(
          title: title.text,
          content: content.text,
          dateTime: DateTime.now().toString(),
        ),
      );

      moodMemoShowDialog();
    } else if (widget.moodText == '사랑') {
      await _loveProvider!.insertMemo(
        memo = Memo(
          title: title.text,
          content: content.text,
          dateTime: DateTime.now().toString(),
        ),
      );
      moodMemoShowDialog();
    } else if (widget.moodText == '위로') {
      await _consolationProvider!.insertMemo(
        memo = Memo(
          title: title.text,
          content: content.text,
          dateTime: DateTime.now().toString(),
        ),
      );
      moodMemoShowDialog();
    } else if (widget.moodText == '슬픔') {
      await _sadnessProvider!.insertMemo(
        memo = Memo(
          title: title.text,
          content: content.text,
          dateTime: DateTime.now().toString(),
        ),
      );
    } else if (widget.moodText == '화남') {
      await _angryProvider!.insertMemo(
        memo = Memo(
          title: title.text,
          content: content.text,
          dateTime: DateTime.now().toString(),
        ),
      );
      moodMemoShowDialog();
    }
  }

  // ignore: slash_for_doc_comments
  /**
   * [Unfocus Method]
   */
  void unfocus() {
    var currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  // ignore: slash_for_doc_comments
  /**
   * [MainMemoScreen Widget]
   * This Screen is main memo Screen
   */

  Widget mainMemoScreen() {
    return GestureDetector(
      onTap: () => unfocus(),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 120.h,
                    ),

                    // ** SelectMoodText **
                    Text(
                      widget.moodText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontFamily: nanumMyeongjo,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 14.0,
                        right: 30.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 12.h,
                          ),
                          TextButton(
                            onPressed: () {
                              audioPlayerState == PlayerState.PLAYING
                                  ? pauseMusic()
                                  : playMusic();
                            },
                            child: Text(
                              audioPlayerState == PlayerState.PLAYING
                                  ? '음악중지'
                                  : '음악재생',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: nanumMyeongjo,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 300.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        color: appbarColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(10.0),
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

                            TextFormField(
                              textInputAction: TextInputAction.next,
                              autofocus: false,
                              maxLines: 1,
                              maxLength: 10,
                              controller: title,
                              style: TextStyle(
                                color: contentTextColor,
                                fontFamily: nanumGothic,
                                fontSize: titleTextColor,
                              ),

                              // ** Focusing State Text **

                              decoration: InputDecoration(
                                counterStyle: TextStyle(
                                  color: logoColor,
                                ),
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
                                constraints: BoxConstraints(
                                  maxHeight: 300.h - 113,
                                ),
                                child: Scrollbar(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    reverse: false,
                                    child: TextFormField(
                                      textInputAction: TextInputAction.done,
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: IconButton(
              icon: const Icon(
                Icons.save_alt_rounded,
                size: 25.0,
              ),
              onPressed: () async => saveMemoButton(),
            ),
          ),
        ],
      ),
      body: mainMemoScreen(),
    );
  }
}
