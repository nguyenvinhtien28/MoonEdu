///
/// Base path config
///
class BasePathConfig {
  /// Instance of BasePathConfig
  static BasePathConfig? _instance;

  static BasePathConfig get instance {
    return _instance!;
  }

  String _subDomain;
  String _url;

  // ignore: avoid_setters_without_getters
  set subDomain(String value) => _subDomain = value;

  // ignore: avoid_setters_without_getters
  set url(String value) => _url = value;

  BasePathConfig._(
    String subDomain,
    String url,
  )   : _subDomain = subDomain,
        _url = url;

  factory BasePathConfig({
    String? subDomain,
    String? url,
  }) {
    return _instance ??= BasePathConfig._(
      subDomain ?? '',
      url ?? '',
    );
  }

  String get basePath {
    if (_subDomain.isEmpty) {
      return _url;
    }

    return _url.replaceAll('{target}', _subDomain);
  }
}
