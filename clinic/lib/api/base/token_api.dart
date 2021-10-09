import 'base_api.dart';

class TokenApi extends BaseApi {
  final String token;

  TokenApi({
    required this.token,
  });

  @override
  Map<String, String> headers() {
    var result = super.headers();
    result['token'] = token;
    return result;
  }
}
