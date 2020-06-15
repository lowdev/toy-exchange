
import 'package:rxdart/rxdart.dart';
import 'package:toyexchange/screen/app/model/adapter/ToyRepositoryFactory.dart';
import 'package:toyexchange/screen/app/model/port/ToyRepository.dart';

import 'Toy.dart';

class ToysBloc {

  final ToyRepository _repository = ToyRepositoryFactory.getToyRepository();
  final _toysFetcher = PublishSubject<List<Toy>>();

  Stream<List<Toy>> get allToys => _toysFetcher.stream;

  search(String query) async {
    List<Toy> toys = await _repository.find(query);
    _toysFetcher.sink.add(toys);
  }

  dispose() {
    _toysFetcher.close();
  }
}