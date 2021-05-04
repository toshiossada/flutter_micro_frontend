import '../../models/auth_model.dart';

abstract class IAuthLocalStorage {
  Future add(AuthModel auth);
  Future<List<AuthModel>> getAll();
  Future<AuthModel> get(int id);
  Future update(AuthModel model);
  Future remove(AuthModel user);
  Future clear();
}
