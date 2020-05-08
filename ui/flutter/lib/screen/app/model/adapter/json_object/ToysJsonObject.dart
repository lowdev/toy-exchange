import 'package:toyexchange/screen/app/model/adapter/json_object/ToyJsonObject.dart';

class ToysJsonObject {
  List<ToyJsonObject> toys;

  ToysJsonObject({this.toys});

  factory ToysJsonObject.fromJson(Map<String, dynamic> json) {
    print(json);
    return null;
  }
}