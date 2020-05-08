import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toyexchange/screen/app/model/Toy.dart';
import 'package:toyexchange/screen/app/model/adapter/json_object/MainJsonObject.dart';
import 'package:toyexchange/screen/app/model/port/ToyRepository.dart';

class HttpToyRepository implements ToyRepository {
  @override
  Future<List<Toy>> findAll() async {
    print("iiiiiiiiii");
    final response = await http.get('http://10.0.2.2:8080/toys');

    print(response.toString());
    if (response.statusCode == 200) {

      MainJsonObject.fromJson(json.decode(response.body));
      return Future.value(new List());
    }

    throw Exception('Failed to load toy');
  }
}