import 'package:cubit/Domain/auth/model/login_request.dart';
import 'package:cubit/Domain/auth/model/login_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final Dio _dio = Dio();

  Future<Either<String, LoginResponse>> signInUserWithEmailandPassword(
      {required LoginRequest loginRequest}) async {
    Response _response;
    try {
      _response = await _dio.post("https://reqres.in/api/login",
          data: loginRequest.toJson());
      LoginResponse _loginResp = LoginResponse.fromJson(_response.data);
      return Right(_loginResp);
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e.response!.statusCode);
      String errorMessage = e.response!.data.toString();
      switch (e.type) {
        case DioErrorType.connectTimeout:
          // TODO: Handle this case.
          break;
        case DioErrorType.sendTimeout:
          // TODO: Handle this case.
          break;
        case DioErrorType.receiveTimeout:
          // TODO: Handle this case.
          break;
        case DioErrorType.response:
          // TODO: Handle this case.
          errorMessage = e.response!.data['error'];
          break;
        case DioErrorType.cancel:
          // TODO: Handle this case.
          break;
        case DioErrorType.other:
          // TODO: Handle this case.
          break;
      }
      return left(errorMessage);
    }
  }
}
