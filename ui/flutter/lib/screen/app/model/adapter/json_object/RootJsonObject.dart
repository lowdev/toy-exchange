import 'EmbeddedJsonObject.dart';

class RootJsonObject {
  EmbeddedJsonObject embeddedJsonObject;

  RootJsonObject({this.embeddedJsonObject});

  factory RootJsonObject.fromJson(Map<String, dynamic> json) {
    return RootJsonObject(
        embeddedJsonObject: EmbeddedJsonObject.fromJson(json['_embedded'])
    );
  }
}