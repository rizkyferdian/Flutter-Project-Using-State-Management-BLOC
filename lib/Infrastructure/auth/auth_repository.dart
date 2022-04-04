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
      return Left(e.toString());
    }
  }
}
