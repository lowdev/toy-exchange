import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:toyexchange/screen/app/model/Toy.dart';
import 'package:toyexchange/screen/app/model/adapter/json_object/RootJsonObject.dart';
import 'package:toyexchange/screen/app/model/adapter/json_object/ToyJsonObject.dart';
import 'package:toyexchange/screen/app/model/port/ToyRepository.dart';

class HttpToyRepository implements ToyRepository {
  @override
  Future<List<Toy>> findAll() async {
    final response = await get("https://toy-exchanging.herokuapp.com/toys", headers: {"Accept":"application/json"});
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
}