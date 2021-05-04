import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

part 'auth_model.g.dart';

@HiveType(typeId: 0)
class AuthModel extends HiveObject {
  @HiveField(0)
  final String apiToken;
  @HiveField(1)
  final String client;
  @HiveField(2)
  final String uid;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String password;
  @HiveField(5)
  final String? messageError;
  @HiveField(6)
  final bool islogged;

  AuthModel({
    this.apiToken = '',
    this.client = '',
    this.uid = '',
    this.email = '',
    this.password = '',
    this.messageError,
    this.islogged = false,
  });

  AuthModel copyWith({
    String? apiToken,
    String? client,
    String? uid,
    String? email,
    String? password,
    String? messageError,
    bool? islogged,
  }) {
    return AuthModel(
      apiToken: apiToken ?? this.apiToken,
      client: client ?? this.client,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      messageError: messageError ?? this.messageError,
      islogged: islogged ?? this.islogged,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'apiToken': apiToken,
      'client': client,
      'uid': uid,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      apiToken: map['apiToken'],
      client: map['client'],
      uid: map['uid'],
    );
  }

  factory AuthModel.fromHeader(Headers headers) {
    return AuthModel(
      apiToken: headers['access-token']![0],
      client: headers['client']![0],
      uid: headers['uid']![0],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AuthModel(apiToken: $apiToken, client: $client, uid: $uid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthModel &&
        other.apiToken == apiToken &&
        other.client == client &&
        other.uid == uid &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => apiToken.hashCode ^ client.hashCode ^ uid.hashCode;
}
