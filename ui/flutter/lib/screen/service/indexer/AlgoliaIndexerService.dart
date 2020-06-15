import 'package:algolia/algolia.dart';
import 'package:toyexchange/screen/service/indexer/IndexerService.dart';
import 'package:toyexchange/screen/service/indexer/model/IndexerToy.dart';

class AlgoliaIndexerService implements IndexerService {

  final Algolia _algolia;

  AlgoliaIndexerService(this._algolia);

  @override
  Future<List<IndexerToy>> search(String text) async {
    AlgoliaQuery query = _algolia.instance.index('dev_toy').search(text);
    AlgoliaQuerySnapshot snap = await query.getObjects();
    
    return snap.hits.map((algoliaObjectSnapshot) => new IndexerToy(
        algoliaObjectSnapshot.objectID,
        algoliaObjectSnapshot.data["title"],
        algoliaObjectSnapshot.data["description"],
        algoliaObjectSnapshot.data["numberOfPieces"]
    )).toList();
  }
}