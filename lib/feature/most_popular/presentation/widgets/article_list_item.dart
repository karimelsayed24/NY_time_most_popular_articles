import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ny_time_most_popular_articles/core/routes/router_names.dart';
import 'package:ny_time_most_popular_articles/core/theme/app_colors.dart';
import 'package:ny_time_most_popular_articles/core/utils/app_styles.dart';

import '../../data/model/article_response.dart';

class ArticleListItem extends StatelessWidget {
  final Article article;

  const ArticleListItem({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    String thumbnailUrl = 'https://via.placeholder.com/75';
    if (article.media.isNotEmpty && article.media[0].mediaMetadata.isNotEmpty) {
      thumbnailUrl = article.media[0].mediaMetadata[0].url;
    }

    String formattedDate = '';
    try {
      final originalDate = DateTime.parse(article.publishedDate);
      formattedDate = DateFormat('yyyy-MM-dd').format(originalDate);
    } catch (e) {
      formattedDate = article.publishedDate;
    }

    return InkWell(
      onTap: () {
        context.push(RouterNames.articleDetailsView,extra: article);
      },
      child: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(37.5.r),
              child: Image.network(
                thumbnailUrl,
                width: 75.r,
                height: 75.r,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 75.w,
                    height: 75.h,
                    color: AppColors.greyForBackground,
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: AppStyles.s16,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      article.byline,
                      style: AppStyles.s12.copyWith(
                        color: AppColors.greyForText,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: AppColors.greyForText,
                        ),
                        Text(
                          
                          formattedDate,
                          style: AppStyles.s12.copyWith(
                            color: AppColors.greyForText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.greyForText,
            ),
          ],
        ),
      ),
    );
  }
}
