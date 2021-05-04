import 'dart:async';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../models/auth_model.dart';
import 'interfaces/auth_repository_interface.dart';

class AuthLocalStorage implements IAuthLocalStorage {
  var completer = Completer<Box>();

  AuthLocalStorage() {
    _initDb();
  }

  Future _initDb() async {
    var appDocDirectory = await getApplicationDocumentsDirectory();
    Hive
      ..init(appDocDirectory.path)
      ..registerAdapter(AuthModelAdapter());

    final box = await Hive.openBox('current_user');
    if (!completer.isCompleted) completer.complete(box);
  }

  Future add(AuthModel auth) async {
    final box = await completer.future;

    box.add(auth);
    auth.save();
  }

  Future<List<AuthModel>> getAll() async {
    final box = await completer.future;
    var result = box.values.map<AuthModel>((e) => e).toList();
    return result;
  }

  Future<AuthModel> get(int id) async {
    final box = await completer.future;
    return AuthModel.fromJson(box.get(id));
  }

  Future update(AuthModel model) async {
    final box = await completer.future;
    box.put(model.uid, model.toJson());
  }

  Future remove(AuthModel user) async {
    final box = await completer.future;
    await box.delete(user);
  }

  Future clear() async {
    final box = await completer.future;
    await box.clear();
  }
}
