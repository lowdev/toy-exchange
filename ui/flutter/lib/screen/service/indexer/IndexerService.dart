import './model/IndexerToy.dart';

abstract class IndexerService {
  Future<List<IndexerToy>> search(String text);
}