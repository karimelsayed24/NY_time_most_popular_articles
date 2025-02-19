import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/model/article_response.dart';

class ArticleDetailsView extends StatelessWidget {
  final Article article;

  const ArticleDetailsView({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    // Get main image
    String mainImageUrl = 'https://via.placeholder.com/400x300';
    if (article.media.isNotEmpty && article.media[0].mediaMetadata.length > 2) {
      // Get largest image
      mainImageUrl = article.media[0].mediaMetadata[2].url;
    }

    // Format the date
    String formattedDate = '';
    try {
      final originalDate = DateTime.parse(article.publishedDate);
      formattedDate = DateFormat('MMMM d, yyyy').format(originalDate);
    } catch (e) {
      formattedDate = article.publishedDate;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightGreen,
        title: const Text(
          'NY Times Most Popular',
          style: TextStyle(color:AppColors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child:  Padding(
              padding:  EdgeInsets.all(16.0.r),
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                      article.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                       const SizedBox(height: 12),
                    Text(
                      formattedDate,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      article.byline,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
              Image.network(
                mainImageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported, size: 50),
                  );
                },
              ),
          
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                 
                    Text(
                      article.abstract,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
          
                  
                  ],
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
