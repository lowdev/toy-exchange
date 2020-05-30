import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:toyexchange/screen/app/model/Toy.dart';
import 'package:toyexchange/screen/app/model/adapter/json_object/RootJsonObject.dart';
import 'package:toyexchange/screen/app/model/adapter/json_object/ToyJsonObject.dart';
import 'package:toyexchange/screen/app/model/port/ToyRepository.dart';

class HttpToyRepository implements ToyRepository {

  static const String LOCAL_SERVER = "http://localhost:8080/toys";
  static const String PROD_SERVER = "https://toy-exchanging.herokuapp.com/toys";
  static const String SERVER = LOCAL_SERVER;

  @override
  Future<List<Toy>> findAll() async {
    final response = await get(SERVER, headers: {"Accept":"application/json"});
    if (response.statusCode != 200) {
      throw Exception('Failed to load toys');
    }
    RootJsonObject rootJsonObject = toToysJsonObject(response.body);

    return new Future.value(toToys(rootJsonObject));
  }

  RootJsonObject toToysJsonObject(String body) {
    return RootJsonObject.fromJson(json.decode(body));
  }

  List<Toy> toToys(RootJsonObject rootJsonObject) {
    return rootJsonObject.embeddedJsonObject.toys.toysAsList
        .map((toyAsJsonObject) => toToy(toyAsJsonObject)).toList();
  }

  Toy toToy(ToyJsonObject toyAsJsonObject) {
    var toy = new Toy(
        name: toyAsJsonObject.title,
        numberOfPieces: int.parse(toyAsJsonObject.numberOfPieces),
        images: [toyAsJsonObject.thumbnail],
        description: toyAsJsonObject.description
    );

    return toy;
  }

  @override
  void save(Toy toy) async {
    final response = await post(SERVER,
        body: jsonEncode(toy.toJson()),
        headers: {"content-type": "application/json"});
    if (response.statusCode != 201) {
      throw Exception('Failed to load toys');
    }
  }
}