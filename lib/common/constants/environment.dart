abstract class Environment {
  String? baseUrl;
  String? apiVer;
  String? schema;
  String? port;
  String? prefixPath;
  String? url;
  String? externalPageUrl;
}

class Dev extends Environment {
  @override
  String get baseUrl => super.baseUrl ?? 'www.flickr.com';

  @override
  String get schema => super.schema ?? 'https';

  @override
  String get apiVer => super.apiVer ?? 'v1';

  @override
  String get port => super.port ?? '';

  @override
  String get prefixPath => super.prefixPath ?? 'services/rest';

  @override
  String get externalPageUrl => super.externalPageUrl ?? '';

  @override
  String get url {
    return '$schema://$baseUrl${port != '' ? ':$port' : ''}/$prefixPath/';
  }
}

class Stage extends Environment {
  @override
  String get baseUrl => super.baseUrl ?? 'www.flickr.com';

  @override
  String get schema => super.schema ?? 'https';

  @override
  String get apiVer => super.apiVer ?? 'v1';

  @override
  String get port => super.port ?? '';

  @override
  String get prefixPath => super.prefixPath ?? 'services/rest';

  @override
  String get url {
    return '$schema://$baseUrl${port != '' ? ':$port' : ''}/$prefixPath/';
  }

  @override
  String get externalPageUrl => super.externalPageUrl ?? '';
}

class Production extends Environment {
  @override
  String get baseUrl => super.baseUrl ?? 'www.flickr.com';

  @override
  String get schema => super.schema ?? 'https';

  @override
  String get apiVer => super.apiVer ?? 'v1';

  @override
  String get port => super.port ?? '';

  @override
  String get prefixPath => super.prefixPath ?? 'services/rest';

  @override
  String get url {
    return '$schema://$baseUrl${port != '' ? ':$port' : ''}/$prefixPath/';
  }

  @override
  String get externalPageUrl => super.externalPageUrl ?? '';
}
