import 'package:angular/angular.dart';
import 'package:angular_dart_demos/src/model/hero.dart';
import 'package:angular_dart_demos/src/service/hero_service.dart';

@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard.html',
  directives: [coreDirectives],
)
class DashboardComponent implements OnInit {
  List<Hero> heroes;

  final HeroService _heroService;

  DashboardComponent(this._heroService);

  @override
  void ngOnInit() async {
    heroes = (await _heroService.getAll()).skip(1).take(4).toList();
  }
}
