import 'package:aztira/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final _repository = Repository();
  final _todoFetcher = PublishSubject<bool>();

  Future<bool> dologin(email, password) async {
    return await _repository.fetchAllLogin(email, password);
  }

  dispose() {
    _todoFetcher.close();
  }
}

final loginbloc = LoginBloc();
