import 'ToysJsonObject.dart';

class EmbeddedJsonObject {
  ToysJsonObject toys;

  EmbeddedJsonObject({this.toys});

  factory EmbeddedJsonObject.fromJson(Map<String, dynamic> json) {
    return EmbeddedJsonObject(
        toys: ToysJsonObject.fromJson(json['toys'])
    );
  }
}