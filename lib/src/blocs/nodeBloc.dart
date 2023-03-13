import 'package:aztira/src/models/nodeModel.dart';
import 'package:aztira/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class NodeBloc {
  final _repository = Repository();
  final _todoFetcher = PublishSubject<List<Node>>();

  Observable<List<Node>> get allNode => _todoFetcher.stream;
  fetchAllTodo() async {
    List<Node> node = await _repository.fetchAllNode();
    _todoFetcher.sink.add(node);
  }

  dispose() {
    _todoFetcher.close();
  }
}

final nodebloc = NodeBloc();
