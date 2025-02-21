
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class EndpointsStrings {
  static const String baseUrl = 'https://api.nytimes.com/svc/mostpopular/v2/viewed/';
  static final String apiKey = dotenv.env['API_KEY'] ?? '';
  static const String apiKeyParam ='api-key';
  static const String jsonFormat = '.json'; 

  static String getMostPopularArticlesUrl(int period) {
    return '$period$jsonFormat?$apiKeyParam=$apiKey';
  }

}