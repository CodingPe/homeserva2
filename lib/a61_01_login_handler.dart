import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:homeserva_2/a00_00_directory.dart';
import 'package:http/http.dart';

class LoginJsonPost {
  final resultNotifier = ValueNotifier<RequestState>(RequestInitial());
  void handleResponse(Response response) {
    if (response.statusCode >= 400) {
      resultNotifier.value = RequestLoadFailure();
    } else {
      resultNotifier.value = RequestLoadSuccess(response.body);
      if (response.body == '{"status":2}') {
        debugPrint('SUCCESSFUL');
      } else {
        debugPrint('LOGIN FAILED');
      }
    }
  }

  Future<void> makePostRequest_01(userLogin, passLogin) async {
    final resultNotifier = ValueNotifier<RequestState>(RequestInitial());
    resultNotifier.value = RequestLoadInProgress();

    const urlPrefix = 'https://vyrox.com/petertest.php';
    final url = Uri.parse('$urlPrefix/posts');
    final headers = {"Content-type": "application/json"};
    final json =
        '{"action": "test_login","username": "$userLogin", "password": "$passLogin", "Id": "118"}';
    final response = await post(url, headers: headers, body: json);
    if (response.body == '{"status":2}') {}

    handleResponse(response);
  }
}

class RequestState {
  const RequestState();
}

class RequestInitial extends RequestState {}

class RequestLoadInProgress extends RequestState {}

class RequestLoadSuccess extends RequestState {
  const RequestLoadSuccess(this.body);
  final String body;
}

class RequestLoadFailure extends RequestState {}
