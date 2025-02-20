import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/model/article_response.dart';

class ImageAndSourceColumn extends StatelessWidget {
  const ImageAndSourceColumn({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    String mainImageUrl =
        'https://th.bing.com/th/id/OIP.WNnJIo0sDXD2MnRSE9SREwAAAA?rs=1&pid=ImgDetMain';
    if (article.media.isNotEmpty && article.media[0].mediaMetadata.length > 2) {
      mainImageUrl = article.media[0].mediaMetadata[2].url;
    }
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.network(
            mainImageUrl,
            width: double.infinity,
            height: 220,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: double.infinity,
                height: 220,
                color: AppColors.greyForBackground,
                child: Icon(Icons.image_not_supported, size: 50.r),
              );
            },
          ),
        ),
        Text(
          article.source,
          style: AppStyles.s10.copyWith(
            color: AppColors.greyForText,
          ),
        ),
      ],
    );
  }
}
