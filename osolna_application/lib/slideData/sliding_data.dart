// ignore: slash_for_doc_comments
/**
 * [Slider] this class carousel_slider card information
 */

class MoodSelect {
  final int? position;
  final String? moodTitle;
  final String? slideTitle;
  final String? image;
  final String? cardInformation;

  MoodSelect(
      {this.position,
      this.moodTitle,
      this.image,
      this.cardInformation,
      this.slideTitle});

  static final List<MoodSelect> card = [
    /**
     * [기쁨]
     */
    MoodSelect(
      position: 1,
      moodTitle: '기쁨',
      slideTitle: '"정말 고마워. 나한테 정말 필요한 꿈이었어.\n이게 네가 찾던 꿈이길 바라"',
      image: 'lib/imageData/기쁨.png',
      cardInformation: '달러구트 꿈백화점2\n- 이미예 -',
    ),
    /**
     * [사랑]
     */
    MoodSelect(
      position: 2,
      moodTitle: '사랑',
      slideTitle: '"아직 만난 적 없는 너를 찾고 있어"',
      image: 'lib/imageData/사랑.png',
      cardInformation: '너의 이름은\n- 신카이 마코토 -',
    ),
    /**
     * [위로]
     */
    MoodSelect(
      position: 3,
      moodTitle: '위로',
      slideTitle: '"모든 걸 잊었지만, 단 하나\n널 만나야 한다는 것만은 기억 나"',
      image: 'lib/imageData/위로.png',
      cardInformation: '가끔 너를 생각해\n- 후지마루 -',
    ),
    /**
     * [슬픔]
     */
    MoodSelect(
      position: 4,
      moodTitle: '슬픔',
      slideTitle: '"다시 없을 그날\n이루어질 수 없는 약속을 했다"',
      image: 'lib/imageData/슬픔.png',
      cardInformation: '구름의 저편, 약속의 장소\n- 신카이 마코토 -',
    ),
    /**
     * [화남]
     */
    MoodSelect(
      position: 5,
      moodTitle: '화남',
      slideTitle: '"네가 살아줬으면 좋겠어"',
      image: 'lib/imageData/화남.png',
      cardInformation: '별을 쫒는 아이\n- 신카이 마코토 -',
    ),
  ];
}
