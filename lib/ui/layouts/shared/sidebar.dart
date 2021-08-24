import 'package:admin_dashboard/ui/layouts/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/layouts/shared/widgets/menu_item.dart';
import 'package:admin_dashboard/ui/layouts/shared/widgets/text_category.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              isActive: false,
              onTap: () {}),
          MenuItem(
              text: 'Orders',
              icon: Icons.shopping_cart_outlined,
              isActive: false,
              onTap: () {}),
          MenuItem(
              text: 'Analytics',
              icon: Icons.show_chart_outlined,
              isActive: false,
              onTap: () {}),
          MenuItem(
              text: 'Categories',
              icon: Icons.layers_outlined,
              isActive: false,
              onTap: () {}),
          MenuItem(
              text: 'Products',
              icon: Icons.dashboard_outlined,
              isActive: false,
              onTap: () {}),
          MenuItem(
              text: 'Discounts',
              icon: Icons.attach_money_outlined,
              isActive: false,
              onTap: () {}),
          MenuItem(
              text: 'Customers',
              icon: Icons.people_alt_outlined,
              isActive: false,
              onTap: () {}),
          SizedBox(
            height: 30.0,
          ),
          TextCategory(text: 'UI Elements'),
          MenuItem(
              text: 'Icons',
              icon: Icons.list_alt_outlined,
              isActive: false,
              onTap: () {}),
          MenuItem(
              text: 'Marketing',
              icon: Icons.mark_email_read_outlined,
              isActive: false,
              onTap: () {}),
          MenuItem(
              text: 'Campaign',
              icon: Icons.note_add_outlined,
              isActive: false,
              onTap: () {}),
          MenuItem(
              text: 'Blank Page',
              icon: Icons.post_add_outlined,
              isActive: false,
              onTap: () {}),
          MenuItem(
              text: 'Logout',
              icon: Icons.logout,
              isActive: false,
              onTap: () {}),
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
