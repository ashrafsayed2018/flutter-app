import 'package:flutter/material.dart';

class ApportunityLinks extends StatelessWidget {
  final String? categoryName, views, deadline;
  const ApportunityLinks({
    Key? key,
    @required this.categoryName,
    @required this.views,
    @required this.deadline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle _iconTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
    double iconSize = 16;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.school,
                size: iconSize,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "$categoryName",
              style: _iconTextStyle,
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.remove_red_eye,
              size: iconSize,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '$views',
              style: _iconTextStyle,
            )
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                size: iconSize,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "share",
              style: _iconTextStyle,
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.event,
                size: iconSize,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "$deadline",
              style: _iconTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
