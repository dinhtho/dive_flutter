import 'package:dio/native_imp.dart';

class NetworkProvider extends DioForNative {
  static final NetworkProvider networkProvider = NetworkProvider._internal();

  factory NetworkProvider() {
    return networkProvider;
  }

  NetworkProvider._internal();
}

class Network {
  static request<T>({
      Future<T> call,
      Function(bool) onLoading,
      Function(T) onSuccess,
      Function(Exception) onError}) async {
    try {
      onLoading?.call(true);
      T response = await call;
      onLoading?.call(false);
      onSuccess?.call(response);
    } catch (e) {
      var error = e;
      if(e is Error){
        error = Exception(e.toString());
      }
      onLoading?.call(false);
      onError?.call(error);
    }
  }
}
