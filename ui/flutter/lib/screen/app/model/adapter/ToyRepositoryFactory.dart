import 'package:toyexchange/common/environment.dart';
import 'package:toyexchange/screen/app/model/adapter/DummyToyRepository.dart';
import 'package:toyexchange/screen/app/model/port/ToyRepository.dart';

import 'HttpToyRepository.dart';

class ToyRepositoryFactory {

  static final ToyRepository _httpToyRepository = new HttpToyRepository();
  static final DummyToyRepository _dummyToyRepository = new DummyToyRepository();

  static ToyRepository getToyRepository() {
    if (Environment.isProd) {
      return _httpToyRepository;
    }

    return _dummyToyRepository;
  }
}