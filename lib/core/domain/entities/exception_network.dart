abstract class ExceptionNetwork {
  String get errorMessage;
}

class ExceptionRequestCancelled implements ExceptionNetwork {
  @override
  String get errorMessage => 'Request Canceled';
}

class ExceptionUnauthorisedRequest implements ExceptionNetwork {
  final dynamic response;
  @override
  String get errorMessage => 'Unauthorised Request';

  const ExceptionUnauthorisedRequest({required this.response});
}

class ExceptionNotFound implements ExceptionNetwork {
  final String? error;

  @override
  String get errorMessage => error ?? 'Not Found';

  const ExceptionNotFound({this.error});
}

class ExceptionMethodNotAllowed implements ExceptionNetwork {
  @override
  String get errorMessage => 'Method Not Allowed';
}

class ExceptionNotAcceptable implements ExceptionNetwork {
  @override
  String get errorMessage => 'Not Acceptable';
}

class ExceptionRequestTimeout implements ExceptionNetwork {
  @override
  String get errorMessage => 'Request Timeout';
}

class ExceptionSendTimeout implements ExceptionNetwork {
  @override
  String get errorMessage => 'Send Timeout';
}

class ExceptionConflict implements ExceptionNetwork {
  @override
  String get errorMessage => 'Conflict';
}

class ExceptionInternalServerError implements ExceptionNetwork {
  @override
  String get errorMessage => 'Internal Server Error';
}

class ExceptionNotImplemented implements ExceptionNetwork {
  @override
  String get errorMessage => 'Not Implemented';
}

class ExceptionServiceUnavailable implements ExceptionNetwork {
  @override
  String get errorMessage => 'Service Unavailable';
}

class ExceptionNoInternetConnection implements ExceptionNetwork {
  @override
  String get errorMessage => 'No Internet Connection';
}

class ExceptionFormatException implements ExceptionNetwork {
  @override
  String get errorMessage => 'Format Exception';
}

class ExceptionUnableToProcess implements ExceptionNetwork {
  @override
  String get errorMessage => 'Unable To Process';
}

class ExceptionDefaultError implements ExceptionNetwork {
  final String error;

  @override
  String get errorMessage => error;

  const ExceptionDefaultError({required this.error});
}

class ExceptionUnexpectedError implements ExceptionNetwork {
  final String error;

  @override
  String get errorMessage => error;

  const ExceptionUnexpectedError({required this.error});
}

class ExceptionBadGatewayError implements ExceptionNetwork {
  @override
  String get errorMessage => 'Bad Gateway Error';
}

class ExceptionForbidden implements ExceptionNetwork {
  final String? error;

  @override
  String get errorMessage => error ?? 'Forbidden';

  const ExceptionForbidden({this.error});
}
