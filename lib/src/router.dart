import 'package:angular_router/angular_router.dart';
import 'component/hero_list.template.dart' as hero_list_template;
import 'component/dashboard.template.dart' as dashboard_template;
import '../app_component.template.dart' as hero_template;

const idParam = 'id';

class RoutePaths {
  static final heroes = RoutePath(path: 'heroes');
  static final dashboard = RoutePath(path: 'dashboard');
  static final hero = RoutePath(path: '${heroes.path}/:$idParam');
}

class Routes {
  static final heroes = RouteDefinition(
    routePath: RoutePaths.heroes,
    component: hero_list_template.HeroListComponentNgFactory,
  );
  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
  );

  static final hero = RouteDefinition(
    routePath: RoutePaths.hero,
    component: hero_template.HeroComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),
    dashboard,
    heroes,
  ];
}
