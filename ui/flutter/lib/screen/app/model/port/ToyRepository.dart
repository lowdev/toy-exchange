import '../Toy.dart';

abstract class ToyRepository {
  Future<List<Toy>> findAll();
  Future<List<Toy>> findAllMyToys();
  void save(Toy toy);
  void delete(String id);
}