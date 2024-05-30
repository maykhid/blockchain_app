import 'package:http_interceptor/http_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@singleton
class APIRequestInterceptor implements InterceptorContract {
  final logger = Logger();

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    request.headers
        .addAll({ 'Accept': '*/*'});
    logger.i(request.toString());
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    // logger.i(response.toString());
    // return response;\
    // var response;
    // try {} on SocketException {
    //   throw Exception('Please check internet connection');
    // } on FormatException {
    //   return Future.error('Bad response format 👎');
    // } on Exception {
    //   return Future.error('Unexpected error 😢');
    // }

    return response;
  }

  @override
  Future<bool> shouldInterceptRequest() => Future.value(true);

  @override
  Future<bool> shouldInterceptResponse() => Future.value(true);
}
