
import 'package:algolia/algolia.dart';
import 'package:toyexchange/screen/service/indexer/AlgoliaIndexerService.dart';
import 'package:toyexchange/screen/service/indexer/IndexerService.dart';

class IndexerServiceFactory {

  static final Algolia algolia = Algolia.init(
    applicationId: 'AY5KHPHF89',
    apiKey: 'e295f69c8ffdb9ec9e554430d524140e',
  );
  static final IndexerService _algoliaIndexerService = new AlgoliaIndexerService(algolia);

  static IndexerService getIndexerService() {
    return _algoliaIndexerService;
  }
}