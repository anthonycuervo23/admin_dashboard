import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

//My imports
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/router/routes.dart';
import 'package:admin_dashboard/ui/views/blank_view.dart';
import 'package:admin_dashboard/ui/views/categorie_view.dart';
import 'package:admin_dashboard/ui/views/customer_view.dart';
import 'package:admin_dashboard/ui/views/customers_view.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';

class DashboardHandlers {
  //DASHBOARD
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SidebarProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return DashboardView();
    else
      return LoginView();
  });

  //ICONS
  static Handler icons = Handler(handlerFunc: (context, params) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SidebarProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.iconsRoute);
    //check if user is authenticated, if not we show login view
    if (authProvider.authStatus == AuthStatus.authenticated)
      return IconsView();
    else
      return LoginView();
  });

  //BLANK
  static Handler blank = Handler(handlerFunc: (context, params) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SidebarProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.blankRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return BlankView();
    else
      return LoginView();
  });

  //CATEGORIES
  static Handler categories = Handler(handlerFunc: (context, params) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SidebarProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.categoriesRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return CategoriesView();
    else
      return LoginView();
  });

  //CUSTOMERS
  static Handler customers = Handler(handlerFunc: (context, params) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SidebarProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.customersRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return CustomersView();
    else
      return LoginView();
  });

  //CUSTOMER
  static Handler customer = Handler(handlerFunc: (context, params) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SidebarProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.customersRoute);
    if (authProvider.authStatus == AuthStatus.authenticated) {
      if (params['uid']?.first != null) {
        return CustomerView(uid: params['uid']!.first);
      } else {
        return CustomersView();
      }
    } else {
      return LoginView();
    }
  });
}
