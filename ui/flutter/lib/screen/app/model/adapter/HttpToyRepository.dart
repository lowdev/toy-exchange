import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as Http;
import 'package:toyexchange/screen/app/model/Toy.dart';
import 'package:toyexchange/screen/app/model/adapter/json_object/RootJsonObject.dart';
import 'package:toyexchange/screen/app/model/adapter/json_object/ToyJsonObject.dart';
import 'package:toyexchange/screen/app/model/port/ToyRepository.dart';
import 'package:toyexchange/screen/service/AuthService.dart';
import 'package:toyexchange/screen/service/AuthServiceFactory.dart';
import 'package:toyexchange/screen/service/indexer/IndexerService.dart';
import 'package:toyexchange/screen/service/indexer/IndexerServiceFactory.dart';
import 'package:toyexchange/screen/service/indexer/model/IndexerToy.dart';

class HttpToyRepository implements ToyRepository {

  static const String LOCAL_SERVER = "http://localhost:8080";
  static const String PROD_SERVER = "https://toy-exchanging.herokuapp.com";
  static const String SERVER = LOCAL_SERVER;

  final AuthService _authService = AuthServiceFactory.getAuthService();
  final IndexerService _indexerService = IndexerServiceFactory.getIndexerService();

  @override
  Future<List<Toy>> findAll() async {
    return _baseFindAll(SERVER + "/toys?excludeMyToys=true");
  }

  @override
  Future<List<Toy>> findAllMyToys() async {
    return _baseFindAll(SERVER + "/me/toys");
  }

  @override
  Future<Toy> findById(String id) async {
    final response = await Http.get(SERVER + "/toys/" + id, headers: _generateHeader());
    if (response.statusCode != 200) {
      throw Exception('Failed to load toy ' + id);
    }
    ToyJsonObject toyJsonObject = _toToyJsonObject(response.body);

    return _toToy(toyJsonObject);
  }

  @override
  Future<List<Toy>> find(String query) async {
    List<IndexerToy> indexerToys = await _indexerService.search(query);
    return indexerToys.map((indexerToy) =>
      new Toy(id: indexerToy.getId(),
          name: indexerToy.getTitle(),
          numberOfPieces: int.parse(indexerToy.getNumberOfPieces())))
        .toList();
  }

  Future<List<Toy>> _baseFindAll(String url) async {
    final response = await Http.get(url, headers: _generateHeader());
    if (response.statusCode != 200) {
      throw Exception('Failed to load toys');
    }
    RootJsonObject rootJsonObject = _toToysJsonObject(response.body);

    return new Future.value(_toToys(rootJsonObject));
  }

  RootJsonObject _toToysJsonObject(String body) {
    return RootJsonObject.fromJson(json.decode(body));
  }

  ToyJsonObject _toToyJsonObject(String body) {
    return ToyJsonObject.fromJson(json.decode(body));
  }

  List<Toy> _toToys(RootJsonObject rootJsonObject) {
    return rootJsonObject.embeddedJsonObject.toys.toysAsList
        .map((toyAsJsonObject) => _toToy(toyAsJsonObject)).toList();
  }

  Toy _toToy(ToyJsonObject toyAsJsonObject) {
    var toy = new Toy(
        id: toyAsJsonObject.id,
        name: toyAsJsonObject.title,
        numberOfPieces: int.parse(toyAsJsonObject.numberOfPieces),
        images: [toyAsJsonObject.thumbnail],
        description: toyAsJsonObject.description
    );

    return toy;
  }

  @override
  void save(Toy toy) async {
    final response = await Http.post(SERVER + "/me/toys",
        body: jsonEncode(toy.toJson()),
        headers: _generateHeader());
    if (response.statusCode != 201) {
      throw Exception('Failed to save toy');
    }
  }

  @override
  void delete(String id) async {
    final response = await Http.delete(SERVER + "/me/toys" + "/$id", headers: _generateHeader());
    if (response.statusCode != 200) {
      throw Exception('Failed to delete toy');
    }
  }

  Map<String, String> _generateHeader() {
    return {
      "Accept": "application/json",
      "content-type": "application/json",
      "Firebase-token": _authService.getToken()
    };
  }
}