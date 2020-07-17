import 'package:angular_dart_demos/src/model/hero.dart';
import 'package:angular_dart_demos/src/model/mock_data.dart';

class HeroService {
  List<Hero> getAllSync() => mockHeroes;

  Future<List<Hero>> getAll() async => mockHeroes;

  Future<List<Hero>> getAllSlowly() {
    return Future.delayed(Duration(seconds: 2), getAll);
  }
}
