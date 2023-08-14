import 'package:auth_front_end/core/functions/check_internet.dart';
import 'package:auth_front_end/core/status/status_request.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String link, Map data) async {
    if (await checkInternetConnection()) {
      try {
        var response = await http.post(
          Uri.parse(link),
          body: data,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(jsonDecode(response.body));
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } catch (e) {
        return const Left(StatusRequest.serverExeption);
      }
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
  }

  Future<Either<StatusRequest, Map>> patchData(String link, Map data) async {
    if (await checkInternetConnection()) {
      try {
        var response = await http.patch(
          Uri.parse(link),
          body: data,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(jsonDecode(response.body));
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } catch (e) {
        return const Left(StatusRequest.serverExeption);
      }
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
  }
}
