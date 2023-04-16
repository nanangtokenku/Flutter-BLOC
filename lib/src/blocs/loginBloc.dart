import 'package:aztira/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final _repository = Repository();
  final _todoFetcher = PublishSubject<bool>();

  Observable<bool> get allUser => _todoFetcher.stream;
  fetchAllUser(email, password) async {
    bool userlogin = await _repository.fetchAllLogin(email, password);
    _todoFetcher.sink.add(userlogin);
  }

  Future<bool> dologin(email, password) async {
    return await _repository.fetchAllLogin(email, password);
  }

  dispose() {
    _todoFetcher.close();
  }
}

final loginbloc = LoginBloc();
