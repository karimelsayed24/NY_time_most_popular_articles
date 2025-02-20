import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/model/article_response.dart';
import '../widgets/by_line_and_date_row.dart';
import '../widgets/image_and_source_column.dart';

class ArticleDetailsComponents extends StatelessWidget {
  const ArticleDetailsComponents({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
   
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article.title, style: AppStyles.s24),
            SizedBox(height: 12.h),
            Text(
              article.adxKeywords,
              style: AppStyles.s16.copyWith(
                color: AppColors.greyForText,
              ),
            ),
            SizedBox(height: 20.h),
            ByLineAndDateRow(
              byline: article.byline,
              publishedDate: article.publishedDate,
            ),
            SizedBox(height: 8.h),
            ImageAndSourceColumn(          
              article: article,
            ),
            SizedBox(height: 12.h),
            Text(
              article.abstract,
              style: AppStyles.s16,
            ),
          ],
        ),
      ),
    );
  }
}
