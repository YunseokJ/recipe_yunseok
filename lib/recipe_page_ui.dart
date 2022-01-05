import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_search/constants.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    double scrWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('위암')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: scrWidth * 0.04267),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 104,
                    child: buildRoundedWidget(
                      const Text(
                        '최신순',
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SvgPicture.asset('assets/icons/darrow.svg'),
                      scrHeight,
                      scrWidth,
                    ),
                  ),
                  SizedBox(
                    width: 0.0213 * scrWidth,
                  ),
                  Expanded(
                    flex: 231,
                    child: buildRoundedWidget(
                      const Text(
                        '음식을 입력하세요',
                        style: TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SvgPicture.asset('assets/icons/search.svg'),
                      scrHeight,
                      scrWidth,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.0197 * scrHeight,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: recipeTiles.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildSingleRecipeTile(
                    scrWidth,
                    scrHeight,
                    recipeTiles[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 0.0296 * scrHeight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildRoundedWidget(
    Widget frondWidget, Widget backWidget, double scrHeight, double scrWidth) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: scrHeight * 0.01355,
      horizontal: 0.0427 * scrWidth,
    ),
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color(0xFFDDDDDD),
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(50),
      ),
    ),
    child: Row(
      children: [
        frondWidget,
        const Spacer(),
        backWidget,
      ],
    ),
  );
}

Widget buildFoodImg(String imgPath, String ranking, double scrWidth) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Image.asset(
        imgPath,
        width: 0.4373 * scrWidth,
      ),
      Positioned(
        top: -2,
        left: 10,
        child: SvgPicture.asset(ranking),
      ),
    ],
  );
}

Widget buildRecipeName(String recipeName) {
  return Text(
    recipeName,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
  );
}

Widget buildUsrInfo(List<String> usrInfo, double scrWidth) {
  return SizedBox(
    width: double.infinity,
    child: Wrap(
      spacing: 0.0213 * scrWidth,
      children: [
        Text(usrInfo[0], style: hashStyle),
        Text(usrInfo[1], style: hashStyle),
        Text(usrInfo[2], style: hashStyle),
      ],
    ),
  );
}

Widget buildProfileAndNickname(
    String profileImg, String nickname, double scrWidth) {
  return Row(
    children: [
      Image.asset(profileImg),
      SizedBox(
        width: 0.0213 * scrWidth,
      ),
      Text(
        nickname,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

Widget buildStarRatingNMinute(double scrWidth, int minute, int rating) {
  return Row(
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
      SizedBox(
        width: 0.0267 * scrWidth,
      ),
      const VerticalDivider(
        color: Color(0xFFDDDDDD),
        thickness: 1.5,
      ),
      SizedBox(
        width: 0.0267 * scrWidth,
      ),
      SvgPicture.asset('assets/icons/time.svg'),
      SizedBox(
        width: 0.0133 * scrWidth,
      ),
      Text(
        minute.toString() + '분',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Color(0xFF666666),
        ),
      ),
    ],
  );
}

Widget buildSingleRecipeTile(
  double scrWidth,
  double scrHeight,
  RecipeTile recipeTile,
) {
  return SizedBox(
    height: 0.22 * scrHeight,
    child: Row(
      children: [
        buildFoodImg(
          recipeTile.recipeImg,
          recipeTile.rankImg,
          scrWidth,
        ),
        SizedBox(
          width: 0.03 * scrWidth,
        ),
        Expanded(
          child: Column(
            children: [
              buildRecipeName(recipeTile.recipeName),
              const Spacer(),
              Column(
                children: [
                  buildProfileAndNickname(
                    recipeTile.usrProfileImg,
                    recipeTile.usrNickname,
                    scrWidth,
                  ),
                  SizedBox(
                    height: 0.0049 * scrHeight,
                  ),
                  buildUsrInfo(recipeTile.usrInfo, scrWidth),
                  SizedBox(
                    height: 0.0197 * scrHeight,
                  ),
                  SizedBox(
                    height: 0.025 * scrHeight,
                    child: buildStarRatingNMinute(
                        scrWidth, recipeTile.minute, recipeTile.rate),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
