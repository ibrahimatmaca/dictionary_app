enum NetworkRoute { BASE_URL, SEARCH }

extension NetworkRouteExtension on NetworkRoute {
  String rawValue({String? language, String? word}) {
    switch (this) {
      case NetworkRoute.BASE_URL:
        return 'https://api.dictionaryapi.dev';
      case NetworkRoute.SEARCH:
        return '/api/v2/entries/$language/$word';
      default:
        return '';
    }
  }
}
