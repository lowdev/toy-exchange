import 'package:toyexchange/screen/homepage/toys/toy/model/Toy.dart';

class Toys {
  static List<Toy> allToys()  {
    var toys = new List<Toy>();

    toys.add(new Toy(name:"Puzzle Vaiana", image: "https://static.fnac-static.com/multimedia/Images/7F/7F/4C/5B/5983359-1505-1540-1/tsp20190830182340/Set-avec-3-puzzles-de-49-pieces-de-vaina-et-pua-puzzle-disney-ravensburger.jpg#395d8d50-4d36-4676-9901-be1a049de8af"));
    toys.add(new Toy(name:"Puzzle Hercule", image: "https://media.paruvendu.fr/image/puzzle-hercule/WB14/7/9/WB147985922_1.jpeg"));
    return toys;
  }
}