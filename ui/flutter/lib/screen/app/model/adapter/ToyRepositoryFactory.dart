import 'package:toyexchange/screen/app/model/adapter/DummyToyRepository.dart';
import 'package:toyexchange/screen/app/model/port/ToyRepository.dart';

import 'HttpToyRepository.dart';

class ToyRepositoryFactory {

  static final ToyRepository _singleton = new HttpToyRepository();

  static ToyRepository getToyRepository() {
    return _singleton;
  }
}