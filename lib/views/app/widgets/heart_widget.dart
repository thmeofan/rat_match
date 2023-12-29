import 'package:flutter/material.dart';

import '../../../data/repository/score_repo.dart';

class HeartWidget extends StatelessWidget {
  const HeartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> hearts = List.generate(3, (index) {
      if (index < (life + 1) ~/ 2) {
        return Image.asset('assets/images/full_heart.png');
      } else {
        return Image.asset('assets/images/empty_heart.png');
      }
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: hearts,
    );
  }
}
