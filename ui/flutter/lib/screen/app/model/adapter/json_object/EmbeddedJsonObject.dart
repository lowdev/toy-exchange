import 'ToysJsonObject.dart';

class EmbeddedJsonObject {
  ToysJsonObject toys;

  EmbeddedJsonObject({this.toys});

  factory EmbeddedJsonObject.fromJson(Map<String, dynamic> json) {
    print(json);
    return EmbeddedJsonObject();
  }
}