import 'package:toyexchange/screen/app/model/adapter/json_object/ToyJsonObject.dart';

class ToysJsonObject {
  List<ToyJsonObject> toysAsList;

  ToysJsonObject({this.toysAsList});

  factory ToysJsonObject.fromJson(List<dynamic> json) {
    return ToysJsonObject(
        toysAsList: json.map((toyAsJson) => ToyJsonObject.fromJson(toyAsJson)).toList()
    );
  }
}