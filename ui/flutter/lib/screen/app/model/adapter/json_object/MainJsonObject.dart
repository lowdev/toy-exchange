import 'EmbeddedJsonObject.dart';

class MainJsonObject {
  EmbeddedJsonObject embeddedJsonObject;

  MainJsonObject({this.embeddedJsonObject});

  factory MainJsonObject.fromJson(Map<String, dynamic> json) {
    return MainJsonObject(
        embeddedJsonObject: EmbeddedJsonObject.fromJson(json['_embedded'])
    );
  }
}