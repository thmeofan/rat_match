import 'package:flutter/material.dart';
import 'package:rat_match/data/repository/score_repo.dart';
import 'package:rat_match/views/consts/app_text_style/menu_style.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 40,
            child: Image.asset(
              'assets/images/coin_back.png',
            ),
          ),
          Image.asset(
            'assets/images/score_back.png',
            fit: BoxFit.contain,
          ),
          Text(
            score.toString(),
            textAlign: TextAlign.end,
            style: MenuTextStyle.category,
          ),
        ],
      ),
    );
  }
}
