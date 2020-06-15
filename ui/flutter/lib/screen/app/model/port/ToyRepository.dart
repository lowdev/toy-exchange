import '../Toy.dart';

abstract class ToyRepository {
  Future<List<Toy>> findAll();
  Future<List<Toy>> findAllMyToys();
  Future<List<Toy>> find(String query);
  Future<Toy> findById(String id);
  void save(Toy toy);
  void delete(String id);
}