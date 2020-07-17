import 'package:angular/angular.dart';
import 'package:angular_dart_demos/src/component/hero_list.dart';
import 'package:angular_dart_demos/src/model/hero.dart';
import 'package:angular_dart_demos/src/model/mock_data.dart';
import 'package:angular_dart_demos/src/router.dart';
import 'package:angular_dart_demos/src/service/hero_service.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

const demoX04 = '<h1>{{title}}</h1><h2>{{hero.name}}</h2>'
    '<div><label>id: </label>{{hero.id}}</div>'
    '<div><label>name: </label>{{hero.name}}</div>'
    '''
      <div>
  <label>name: </label>
  <input [(ngModel)]="hero.name" placeholder="name">
</div>
      ''';
const demoX07Router = '''
  <h1>{{title}}</h1>
  <nav>
    <a [routerLink]="RoutePaths.dashboard.toUrl()"
       [routerLinkActive]="'active'">Dashboard</a>
    <a [routerLink]="RoutePaths.heroes.toUrl()"
       [routerLinkActive]="'active'">Heroes</a>
  </nav>
  <router-outlet [routes]="Routes.all"></router-outlet>
''';

@Component(
  selector: 'app',
  template: demoX07Router,
  // template: demoX04, // 直接使用字符串形式
  // templateUrl: 'app_component.html',
  // styleUrls: ['app_component.css'],
  directives: [
    routerDirectives, // x07 router
    coreDirectives,
    formDirectives,
    HeroComponent,
    HeroListComponent,
  ],
  providers: [ClassProvider(HeroService)],
  exports: [RoutePaths, Routes],
)
class AppComponent implements OnInit {
  /// 不要初始化service，根据注入依赖原则，这里的实例，由框架维护，我们对provider添加类型对应
  final HeroService _heroService;
  AppComponent(this._heroService);
  // List<Hero> heroes = mockHeroes;
  /// 使用service的时候，不需要默认值了，根据生命周期初始化更为合理
  List<Hero> heroes;

  /// 使用生命周期，初始化变量
  @override
  void ngOnInit() {
    _getHeroes();
  }

  var name = 'Angular';
  final title = 'Angular NB';
  Hero hero = Hero(1, 'Windstorm');

  Hero selected; // 这里没有使用初始化，所以执行的时候需要if一下null
  void onSelect(Hero hero) => selected = hero;

  void _getHeroes() async {
    // heroes = await _heroService.getAll();
    heroes = _heroService.getAllSync();
    // heroes = await _heroService.getAllSlowly();
  }
}

@Component(
  selector: 'my-hero', // 模版内名称
  template: '''
    <div *ngIf="hero != null">
      <h2>{{hero.name}}</h2>
      <div><label>id: </label>{{hero.id}}</div>
      <div>
        <label>name: </label>
        <input [(ngModel)]="hero.name" placeholder="name">
      </div>
    </div>''',
  directives: [coreDirectives, formDirectives],
)
class HeroComponent {
  @Input()
  Hero hero;
}
