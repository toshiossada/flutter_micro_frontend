import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import '../../auth/local_storage/interfaces/auth_repository_interface.dart';
import '../../auth/stores/auth_store.dart';
import 'interceptors/custom_interceptor.dart';

class CustomDio extends DioForNative {
  final AuthStore _store;
  final IAuthLocalStorage _authLocalStorage;

  CustomDio(this._store, this._authLocalStorage, [BaseOptions? options])
      : super(options) {
    interceptors.add(CustomInterceptors(
      store: _store,
      authLocalStorage: _authLocalStorage,
    ));
    // interceptors.add(CacheInterceptor());
  }
}
