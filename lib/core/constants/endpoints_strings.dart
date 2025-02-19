//https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=

abstract class EndpointsStrings {
  static const String baseUrl = 'https://api.nytimes.com/svc/mostpopular/v2/viewed/';
  static const String apiKey = '';
  static const String apiKeyParam ='api-key';
  static const String jsonFormat = '.json'; 

  static String getMostPopularArticlesUrl(int period) {
    return '$period$jsonFormat?$apiKeyParam=$apiKey';
  }

}