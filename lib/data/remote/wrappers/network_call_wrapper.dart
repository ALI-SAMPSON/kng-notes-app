import 'package:note_taking_app/data/remote/exceptions/exceptions.dart';
import 'package:note_taking_app/data/remote/wrappers/network_info.dart';

abstract class AsyncNetworkWrapper {
  Future handleAsyncNetworkCall(Function() asyncMethod);
}

class AsyncNetworkWrapperImpl extends AsyncNetworkWrapper {
  final NetworkInfo networkInfo;

  AsyncNetworkWrapperImpl(this.networkInfo);

  @override
  Future handleAsyncNetworkCall(Function() asyncMethod) async {
    if (await networkInfo.isConnected) {
      return await asyncMethod();
    } else {
      throw NoInternetException();
    }
  }
}
