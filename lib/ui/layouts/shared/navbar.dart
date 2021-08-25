import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/ui/layouts/shared/widgets/navbar_avatar.dart';
import 'package:admin_dashboard/ui/layouts/shared/widgets/notifications_indicator.dart';
import 'package:admin_dashboard/ui/layouts/shared/widgets/search_box.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          if (size.width <= 700)
            IconButton(
              onPressed: () => SidebarProvider.openMenu(),
              icon: Icon(Icons.menu_outlined),
            ),
          SizedBox(
            width: 5.0,
          ),
          //Search Box
          if (size.width > 380)
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 250,
              ),
              child: SearchBox(),
            ),
          Spacer(),
          NotificationsIndicator(),
          SizedBox(
            width: 10.0,
          ),
          NavbarAvatar(),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
          ),
        ],
      );
}
