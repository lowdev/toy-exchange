import '../Toy.dart';

abstract class ToyRepository {
  Future<List<Toy>> findAll();
}