import 'dart:convert';
import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:umraheasier/core/class/statusrequest.dart';

import '../functions/checkinternet.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.networkFailure);
      }
    } on SocketException {
      // Handle network issues
      return const Left(StatusRequest.networkFailure);
    } on FormatException catch (e) {
      print("JSON Decoding Error: $e");
      return const Left(StatusRequest.decodingFailure);
    } catch (_) {
      // Handle other unexpected exceptions
      return const Left(StatusRequest.serverException);
    }
  }
}
