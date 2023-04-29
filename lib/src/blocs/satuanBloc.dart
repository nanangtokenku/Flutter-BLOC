import 'package:aztira/src/models/satuanModel.dart';
import 'package:aztira/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class SatuanBloc {
  final _repository = Repository();
  final _todoFetcher = PublishSubject<List<Satuan>>();

  Observable<List<Satuan>> get allSatuan => _todoFetcher.stream;
  fetchAllSatuann() async {
    List<Satuan> satuan = await _repository.fetchAllSatuan();
    _todoFetcher.sink.add(satuan);
  }

  dispose() {
    _todoFetcher.close();
  }
}

final satuanbloc = SatuanBloc();
