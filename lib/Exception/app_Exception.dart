
class AppException implements Exception {
  final _message ;

  AppException(String? message, [this._message]);

  String toString(){
    return '$_message';

  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]):super(message,'Inavlid request');
}

class BadRequest extends AppException {
  BadRequest ([String? message]): super(message,'Inavlid request due to bad network');

}

class UnauthorizedRequest extends AppException {
  UnauthorizedRequest([String? message]) : super(message,'Inavlid Request');

}