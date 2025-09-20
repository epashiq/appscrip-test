import 'package:appscrip_test/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class UserServices {
 String baseUrl = 'https://jsonplaceholder.typicode.com';
  final  dio = Dio();

   Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await dio.get('$baseUrl/users',options: Options(headers: 
         {'Content-Type': 'application/json'}
      ));

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> jsonData = response.data;
        return jsonData
            .map((userJson) => UserModel.fromJson(userJson))
            .toList();
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Failed to load users',
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Dio error fetching users: ${e.message}');
      }
      rethrow;
    } catch (e) {
      if (kDebugMode) {
        print('Unexpected error fetching users: $e');
      }
      throw DioException(
        requestOptions: RequestOptions(path: '/users'),
        message: 'An unexpected error occurred: $e',
      );
    }
  }

  //  Future<UserModel> fetchUserById(int id) async {
  //   try {
  //     final response = await dio.get('$baseUrl/users/$id',options: Options(headers: 
  //        {'Content-Type': 'application/json'}
  //     ));

  //     if (response.statusCode == 200 && response.data != null) {
  //       return UserModel.fromJson(response.data);
  //     } else {
  //       throw DioException(
  //         requestOptions: response.requestOptions,
  //         response: response,
  //         message: 'Failed to load user',
  //       );
  //     }
  //   } on DioException catch (e) {
  //     if (kDebugMode) {
  //       print('Dio error fetching user $id: ${e.message}');
  //     }
  //     rethrow;
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Unexpected error fetching user $id: $e');
  //     }
  //     throw DioException(
  //       requestOptions: RequestOptions(path: '/users/$id'),
  //       message: 'An unexpected error occurred: $e',
  //     );
  //   }
  // }
}

