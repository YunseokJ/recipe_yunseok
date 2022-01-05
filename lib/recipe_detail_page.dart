import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    double scrWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        buildBackgroundImage(scrHeight),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Center(
              child: Text(
                '레시피 정보',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/question.svg'),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 0.3096 * scrHeight,
                ),
                buildFoodTypeContainer(scrWidth, scrHeight, '양식'),
                SizedBox(
                  height: 0.0099 * scrHeight,
                ),
                Container(
                  width: scrWidth,
                  padding: EdgeInsets.symmetric(
                    vertical: scrHeight * 0.0367,
                    horizontal: 0.04267 * scrWidth,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '올리브유로 만든 뽀빠이 감바스',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                      buildFoodInfoRow(
                        scrWidth,
                        scrHeight,
                        ['위암', '대장암', '새우', '마늘'],
                        [false, false, true, true],
                      ),
                      buildRecipeInfoRow(scrHeight, scrWidth, [1, 25, 2]),
                      buildRecipeTextBox(
                        scrHeight,
                        '바다의 채소라 불리는 미역은 칼슘이 풍부해서 뼈를 튼튼하게 해준다. 식이섬유가 풍부해 포만감을 주며, 장운동을 도와 변비를 예방한다.',
                        '생새우는 위험하기 때문에 충분히 익혀주세요.',
                      ),
                      buildUsrInfoBox(
                        scrWidth,
                        scrHeight,
                        '102동 옆집',
                        '갑상선암',
                        '수술후',
                      ),
                      buildRecipeIconsRow(
                        scrHeight,
                        scrWidth,
                        [123, 22, 94, 2],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: scrWidth,
                  padding: EdgeInsets.all(0.04267 * scrWidth),
                  color: const Color(0xFFF4F4F4),
                  child: Container(
                    padding: EdgeInsets.all(0.0853 * scrWidth),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Column(
                      children: [
                        buildIngreDesignRow(scrHeight, scrWidth),
                        SizedBox(height: 0.0275 * scrHeight),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildIngreSubtitleDeision(scrWidth, '기본재료'),
                            SizedBox(
                              width: 0.0427 * scrWidth,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Divider(
                                    thickness: 1.5,
                                    color: Color(0xFFDDDDDD),
                                  ),
                                  buildIngredientDetail(scrWidth, '마늘 3개'),
                                  buildIngredientDetail(scrWidth, '새우 12마리'),
                                  buildIngredientDetail(scrWidth, '시금치 200g'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 0.0275 * scrHeight),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildIngreSubtitleDeision(scrWidth, '양념장 소스 재료'),
                            SizedBox(
                              width: 0.0427 * scrWidth,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Divider(
                                    thickness: 1.5,
                                    color: Color(0xFFDDDDDD),
                                  ),
                                  buildIngredientDetail(scrWidth, '소금 1/2컵'),
                                  buildIngredientDetail(scrWidth, '올리브유 1컵'),
                                ],
                              ),
                            ),
                          ],
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
    );
  }
}

Widget buildBackgroundImage(double scrHeight) {
  return Container(
    height: scrHeight * 0.64,
    decoration: BoxDecoration(
      image: DecorationImage(
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.75), BlendMode.dstATop),
        image: const AssetImage('assets/food_img/food_background.png'),
        fit: BoxFit.fitWidth,
      ),
    ),
  );
}

Widget buildFoodTypeContainer(
    double scrWidth, double scrHeight, String foodType) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 0.048 * scrWidth),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: scrHeight * 0.0092,
            horizontal: 0.032 * scrWidth,
          ),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Text(
            foodType,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
        ),
        const Spacer(),
      ],
    ),
  );
}

Widget buildRoundFoodInfo(
    double scrHeight, double scrWidth, String infoText, bool isIngrediant) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: scrHeight * 0.0092,
      horizontal: 0.04267 * scrWidth,
    ),
    decoration: BoxDecoration(
      color: isIngrediant ? const Color(0xFFFFF6D6) : const Color(0xFFE4F7FB),
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
    ),
    child: Text(
      infoText,
      style: TextStyle(
        color: isIngrediant ? const Color(0xFFFF7D05) : const Color(0xFF1260A8),
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
    ),
  );
}

Widget buildStarRating(double scrWidth, int rating) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      rating < 1
          ? SvgPicture.asset('assets/icons/off.svg')
          : SvgPicture.asset('assets/icons/on.svg'),
      SizedBox(
        width: 0.0107 * scrWidth,
      ),
      rating < 2
          ? SvgPicture.asset('assets/icons/off.svg')
          : SvgPicture.asset('assets/icons/on.svg'),
      SizedBox(
        width: 0.0107 * scrWidth,
      ),
      rating < 3
          ? SvgPicture.asset('assets/icons/off.svg')
          : SvgPicture.asset('assets/icons/on.svg'),
    ],
  );
}

Widget buildRichText(String firstText, String secondText) {
  return RichText(
    text: TextSpan(
      text: firstText,
      style: const TextStyle(
        color: Color(0xFF111111),
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
      ),
      children: [
        TextSpan(
          text: secondText,
          style: const TextStyle(
            color: Color(0xFF666666),
            fontSize: 14.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    ),
  );
  ;
}

Widget buildFoodInfoBox(double scrWidth, String belowText, Widget topWidget) {
  return SizedBox(
    width: 0.26 * scrWidth,
    child: Column(
      children: [
        topWidget,
        const Spacer(),
        Text(
          belowText,
          style: const TextStyle(
            color: Color(0xFF666666),
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    ),
  );
}

Widget buildRecipeTextBox(
    double scrHeight, String recipeExplain, String cautionText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        '레시피 설명',
        style: TextStyle(
          color: Color(0xFF111111),
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(
        height: 0.0092 * scrHeight,
      ),
      Text(
        recipeExplain,
        style: const TextStyle(
          color: Color(0xFF666666),
          fontSize: 16.0,
          fontWeight: FontWeight.w300,
        ),
      ),
      SizedBox(
        height: 0.0183 * scrHeight,
      ),
      const Text(
        '주의점',
        style: TextStyle(
          color: Color(0xFFF76300),
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(
        height: 0.0092 * scrHeight,
      ),
      Text(
        cautionText,
        style: const TextStyle(
          color: Color(0xFF666666),
          fontSize: 16.0,
          fontWeight: FontWeight.w300,
        ),
      ),
      SizedBox(
        height: 0.0367 * scrHeight,
      ),
    ],
  );
}

Widget buildUsrInfoBox(double scrWidth, double scrHeight, String nickname,
    String info1, String info2) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color(0xFFF4F4F4),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Row(
          children: [
            Image.asset('assets/profile_img/person_round.png'),
            SizedBox(
              width: 0.0213 * scrWidth,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nickname,
                  style: const TextStyle(
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 0.0046 * scrHeight,
                ),
                Text(
                  '#$info1 #$info2',
                  style: const TextStyle(
                    color: Color(0xFF3BD7E2),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      SizedBox(
        height: 0.0275 * scrHeight,
      ),
    ],
  );
}

Widget buildIconAndNumber(double scrWidth, String number, String icon) {
  return SizedBox(
    width: scrWidth * 0.1967,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(icon),
        SizedBox(
          width: 0.0133 * scrWidth,
        ),
        Text(
          number,
          style: const TextStyle(
            color: Color(0xFF666666),
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}

Widget buildFoodInfoRow(double scrWidth, double scrHeight, List<String> infos,
    List<bool> infoTypes) {
  return Column(
    children: [
      SizedBox(
        height: 0.0126 * scrHeight,
      ),
      Row(
        children: [
          buildRoundFoodInfo(scrHeight, scrWidth, infos[0], infoTypes[0]),
          SizedBox(width: 0.0173 * scrWidth),
          buildRoundFoodInfo(scrHeight, scrWidth, infos[1], infoTypes[1]),
          SizedBox(width: 0.0173 * scrWidth),
          buildRoundFoodInfo(scrHeight, scrWidth, infos[2], infoTypes[2]),
          SizedBox(width: 0.0173 * scrWidth),
          buildRoundFoodInfo(scrHeight, scrWidth, infos[3], infoTypes[3]),
        ],
      ),
      SizedBox(
        height: 0.0367 * scrHeight,
      ),
    ],
  );
}

Widget buildRecipeInfoRow(
    double scrHeight, double scrWidth, List<int> recipeInfoList) {
  return Column(children: [
    SizedBox(
      height: 0.0734 * scrHeight,
      child: Row(
        children: [
          const Spacer(),
          buildFoodInfoBox(
            scrWidth,
            '난이도',
            buildStarRating(scrWidth, recipeInfoList[0]),
          ),
          const VerticalDivider(
            color: Color(0xFFDDDDDD),
            thickness: 1.5,
          ),
          buildFoodInfoBox(
            scrWidth,
            '소요시간',
            buildRichText(recipeInfoList[1].toString(), '분'),
          ),
          const VerticalDivider(
            color: Color(0xFFDDDDDD),
            thickness: 1.5,
          ),
          buildFoodInfoBox(
            scrWidth,
            '분량',
            buildRichText(recipeInfoList[2].toString(), '인분'),
          ),
          const Spacer(),
        ],
      ),
    ),
    SizedBox(
      height: 0.0367 * scrHeight,
    ),
  ]);
}

Widget buildRecipeIconsRow(
    double scrHeight, double scrWidth, List<int> referedNumbers) {
  return SizedBox(
    height: 0.022 * scrHeight,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildIconAndNumber(
          scrWidth,
          referedNumbers[0].toString(),
          'assets/icons/like.svg',
        ),
        const VerticalDivider(
          color: Color(0xFFDDDDDD),
          thickness: 1.5,
        ),
        buildIconAndNumber(
          scrWidth,
          referedNumbers[1].toString(),
          'assets/icons/bookmark.svg',
        ),
        const VerticalDivider(
          color: Color(0xFFDDDDDD),
          thickness: 1.5,
        ),
        buildIconAndNumber(
          scrWidth,
          referedNumbers[2].toString(),
          'assets/icons/share.svg',
        ),
        const VerticalDivider(
          color: Color(0xFFDDDDDD),
          thickness: 1.5,
        ),
        buildIconAndNumber(
          scrWidth,
          referedNumbers[3].toString(),
          'assets/icons/comment.svg',
        ),
      ],
    ),
  );
}

Widget buildIngreDesignRow(double scrHeight, double scrWidth) {
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      Row(
        children: [
          const Spacer(),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const Text(
                '재료',
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
              Container(
                height: 0.0138 * scrHeight,
                width: 0.1147 * scrWidth,
                color: const Color(0xFF3BD7E2).withOpacity(0.3),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: 0.032 * scrWidth,
          vertical: 0.0069 * scrHeight,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF3BD7E2),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: const Text(
          '계량가이드',
          style: TextStyle(
            color: Color(0xFF3BD7E2),
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
    ],
  );
}

Widget buildIngreSubtitleDeision(double scrWidth, String subtitle) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      SizedBox(
        width: 0.2133 * scrWidth,
        child: Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFF111111),
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      Positioned(
        left: -8,
        child: Container(
          width: scrWidth * 0.04266,
          height: scrWidth * 0.04266,
          decoration: BoxDecoration(
            color: const Color(0xFF3BD7E2).withOpacity(0.3),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildIngredientDetail(double scrWidth, String ingreDetail) {
  return Row(
    children: [
      SvgPicture.asset('assets/icons/dot.svg'),
      SizedBox(width: 0.023 * scrWidth),
      Text(
        ingreDetail,
        style: const TextStyle(
          color: Color(0xFF666666),
          fontWeight: FontWeight.w300,
          fontSize: 16,
        ),
      ),
    ],
  );
}
