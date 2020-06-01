import '../Toy.dart';

abstract class ToyRepository {
  Future<List<Toy>> findAll();
  void save(Toy toy);
  void delete(String id);
}