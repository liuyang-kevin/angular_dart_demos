import 'package:angular/angular.dart';
import 'package:angular_dart_demos/src/model/hero.dart';
import 'package:angular_dart_demos/src/service/hero_service.dart';

import '../../app_component.dart';

@Component(
  selector: 'hero-list',
  templateUrl: 'hero_list.html',
  styleUrls: ['hero_list.css'],
  directives: [coreDirectives, HeroComponent],
  providers: [ClassProvider(HeroService)],
)
class HeroListComponent implements OnInit {
  final HeroService _heroService;
  HeroListComponent(this._heroService);
  List<Hero> heroes;

  Hero selected; // 这里没有使用初始化，所以执行的时候需要if一下null
  void onSelect(Hero hero) => selected = hero;

  @override
  void ngOnInit() {
    _getHeroes();
  }

  void _getHeroes() async {
    heroes = await _heroService.getAllSlowly();
  }
}
