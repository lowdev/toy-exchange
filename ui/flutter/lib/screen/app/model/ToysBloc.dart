
import 'package:rxdart/rxdart.dart';
import 'package:toyexchange/screen/app/model/adapter/ToyRepositoryFactory.dart';
import 'package:toyexchange/screen/app/model/port/ToyRepository.dart';

import 'Toy.dart';

class ToysBloc {

  final ToyRepository _repository = ToyRepositoryFactory.getToyRepository();
  final _toysFetcher = PublishSubject<List<Toy>>();

  Stream<List<Toy>> get allToys => _toysFetcher.stream;

  fetchAlltoys() async {
    List<Toy> toys = await _repository.findAll();
    _toysFetcher.sink.add(toys);
  }

  dispose() {
    _toysFetcher.close();
  }

  //static bloc = ToysBloc();
}