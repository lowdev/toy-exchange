
class Toy {
  String id;
  String name;
  List<String> images = ["https://fr.zenit.org/wp-content/uploads/2018/05/no-image-icon-1536x1536.png"];
  int numberOfPieces;
  String description;

  Toy({this.id, this.name, this.images, this.numberOfPieces, this.description});

  Map<String, dynamic> toJson() =>
      {
        'title': name,
        'images': images,
        'numberOfPieces': numberOfPieces.toString(),
        'description': description
      };
}