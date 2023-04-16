import 'package:aztira/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

import '../models/userModel.dart';

class LoginBloc {
  final _repository = Repository();
  final _todoFetcher = PublishSubject<User>();

  Observable<User> get allUser => _todoFetcher.stream;
  fetchAllUser(email, password) async {
    User user = await _repository.fetchAllUser(email, password);
    _todoFetcher.sink.add(user);
  }

  dispose() {
    _todoFetcher.close();
  }
}

final loginbloc = LoginBloc();
