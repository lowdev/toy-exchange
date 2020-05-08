class ToyJsonObject {
  String id;
  String title;
  String thumbnail;
  String numberOfPieces;
  String description;

  ToyJsonObject({this.id, this.title, this.thumbnail, this.numberOfPieces, this.description});

  factory ToyJsonObject.fromJson(Map<String, dynamic> json) {
    return ToyJsonObject(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      numberOfPieces: json['numberOfPieces'],
      description: json['description']
    );
  }
}