import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//My imports
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/router/routes.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/ui/layouts/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/layouts/shared/widgets/menu_item.dart';
import 'package:admin_dashboard/ui/layouts/shared/widgets/text_category.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  void navigateTo(routeName) {
    NavigationService.replaceTo(routeName);
    SidebarProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final SidebarProvider sidebarProvider =
        Provider.of<SidebarProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Logo(),
          SizedBox(
            height: 50,
          ),
          TextCategory(text: 'main'),
          MenuItem(
            text: 'Dashboard',
            icon: Icons.compass_calibration_outlined,
            isActive: sidebarProvider.currentPage == Flurorouter.dashboardRoute,
            onTap: () => navigateTo(Flurorouter.dashboardRoute),
          ),
          MenuItem(
            text: 'Orders',
            icon: Icons.shopping_cart_outlined,
            isActive: false,
            onTap: () => navigateTo(Flurorouter.dashboardRoute),
          ),
          MenuItem(
            text: 'Analytics',
            icon: Icons.show_chart_outlined,
            isActive: false,
            onTap: () => navigateTo(Flurorouter.dashboardRoute),
          ),
          MenuItem(
            text: 'Categories',
            icon: Icons.layers_outlined,
            isActive:
                sidebarProvider.currentPage == Flurorouter.categoriesRoute,
            onTap: () => navigateTo(Flurorouter.categoriesRoute),
          ),
          MenuItem(
            text: 'Products',
            icon: Icons.dashboard_outlined,
            isActive: false,
            onTap: () => navigateTo(Flurorouter.dashboardRoute),
          ),
          MenuItem(
            text: 'Discounts',
            icon: Icons.attach_money_outlined,
            isActive: false,
            onTap: () => navigateTo(Flurorouter.dashboardRoute),
          ),
          MenuItem(
            text: 'Customers',
            icon: Icons.people_alt_outlined,
            isActive: sidebarProvider.currentPage == Flurorouter.customersRoute,
            onTap: () => navigateTo(Flurorouter.customersRoute),
          ),
          SizedBox(
            height: 30.0,
          ),
          TextCategory(text: 'UI Elements'),
          MenuItem(
            isActive: sidebarProvider.currentPage == Flurorouter.iconsRoute,
            text: 'Icons',
            icon: Icons.list_alt_outlined,
            onTap: () => navigateTo(Flurorouter.iconsRoute),
          ),
          MenuItem(
            text: 'Marketing',
            icon: Icons.mark_email_read_outlined,
            isActive: false,
            onTap: () => navigateTo(Flurorouter.dashboardRoute),
          ),
          MenuItem(
            text: 'Campaign',
            icon: Icons.note_add_outlined,
            isActive: false,
            onTap: () => navigateTo(Flurorouter.dashboardRoute),
          ),
          MenuItem(
            text: 'Blank Page',
            icon: Icons.post_add_outlined,
            isActive: sidebarProvider.currentPage == Flurorouter.iconsRoute,
            onTap: () => navigateTo(Flurorouter.blankRoute),
          ),
          SizedBox(
            height: 30.0,
          ),
          TextCategory(text: 'Exit'),
          MenuItem(
              text: 'Logout',
              icon: Icons.logout,
              isActive: false,
              onTap: () =>
                  Provider.of<AuthProvider>(context, listen: false).logout()),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF092044),
            Color(0xFF092042),
          ],
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10),
        ],
      );
}
