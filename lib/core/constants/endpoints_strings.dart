//https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=lWgYbAm8gJ4Rj2FdIKiJ2TzXckEDHFSJ

abstract class EndpointsStrings {
  static const String baseUrl = 'https://api.nytimes.com/svc/mostpopular/v2/viewed/';
  static const String apiKey = 'lWgYbAm8gJ4Rj2FdIKiJ2TzXckEDHFSJ';
  static const String apiKeyParam ='api-key';
  static const String jsonFormat = '.json'; 

  static String getMostPopularArticlesUrl(int period) {
    return '$period$jsonFormat?$apiKeyParam=$apiKey';
  }

}