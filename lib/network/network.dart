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
      onLoading(true);
      T response = await call;
      onLoading(false);
      onSuccess(response);
    } catch (e) {
      var error = e;
      if(e is Error){
        error = Exception(e.toString());
      }
      onLoading(false);
      onError(error);
    }
  }
}
