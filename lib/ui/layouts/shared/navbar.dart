import 'package:admin_dashboard/ui/layouts/shared/widgets/navbar_avatar.dart';
import 'package:admin_dashboard/ui/layouts/shared/widgets/notifications_indicator.dart';
import 'package:admin_dashboard/ui/layouts/shared/widgets/search_box.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_outlined),
          ),
          SizedBox(
            width: 5.0,
          ),
          //Search Box
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
