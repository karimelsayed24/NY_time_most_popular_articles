import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class ByLineAndDateRow extends StatelessWidget {
  const ByLineAndDateRow({
    super.key,
    required this.byline,
    required this.publishedDate,
  });

  final String byline;
  final String publishedDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            byline,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.s14,
          ),
        ),
        Text(publishedDate, style: AppStyles.s14),
      ],
    );
  }
}
