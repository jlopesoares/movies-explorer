import 'dart:async';

import 'package:assignment/api/gen/client_index.dart';
import 'package:chopper/chopper.dart';

WatchmodeApi createWatchmodeApi({
  required Uri baseUrl,
  required String apiKey,
}) {
  return WatchmodeApi.create(
    baseUrl: baseUrl,
    interceptors: [_ApiKeyInterceptor(apiKey), CurlInterceptor()],
  );
}

class _ApiKeyInterceptor implements Interceptor {
  _ApiKeyInterceptor(this.apiKey);

  final String apiKey;

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) {
    final request = chain.request;
    return chain.proceed(
      request.copyWith(parameters: {...request.parameters, 'apiKey': apiKey}),
    );
  }
}
