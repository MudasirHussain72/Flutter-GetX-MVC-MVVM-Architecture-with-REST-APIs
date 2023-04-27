class AppExceptions implements Exception {
  final _messge;
  final _prefix;
  AppExceptions([this._messge, this._prefix]);
  String toString() {
    return '$_prefix$_messge';
  }
}

class InternetExeption extends AppExceptions {
  InternetExeption([String? message]) : super(message, 'No Internet');
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, 'Request Time Out');
}

class ServerExeption extends AppExceptions {
  ServerExeption([String? message])
      : super(message, 'Internet Server Exeption');
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message])
      : super(message, 'Invalid Url Exception');
}

class FetchDataExeption extends AppExceptions {
  FetchDataExeption([String? message])
      : super(message, 'Error while communication');
}
