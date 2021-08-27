import 'package:fluro/fluro.dart';

//My imports
import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';


class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  //root
  static String rootRoute = '/';

  //Auth Routes
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  //Dashboard Routes
  static String dashboardRoute = '/dashboard';
  static String iconsRoute = '/dashboard/icons';
  static String blankRoute = '/dashboard/blank';
  static String categoriesRoute = '/dashboard/categories';
  static String customersRoute = '/dashboard/customers';
  static String customerRoute = '/dashboard/customers/:uid';

  static void configureRoutes() {
    //Auth routes
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);

    //Dashboard route
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);
    router.define(iconsRoute,
        handler: DashboardHandlers.icons,
        transitionType: TransitionType.fadeIn);
    router.define(blankRoute,
        handler: DashboardHandlers.blank,
        transitionType: TransitionType.fadeIn);
    router.define(categoriesRoute,
        handler: DashboardHandlers.categories,
        transitionType: TransitionType.fadeIn);
    router.define(customersRoute,
        handler: DashboardHandlers.customers,
        transitionType: TransitionType.fadeIn);
    router.define(customerRoute,
        handler: DashboardHandlers.customer,
        transitionType: TransitionType.fadeIn);
    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
