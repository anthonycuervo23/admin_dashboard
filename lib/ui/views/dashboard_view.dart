import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//My imports
import 'package:admin_dashboard/api/models/user.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Usuario? user = Provider.of<AuthProvider>(context).user;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Dashboard View',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10.0,
          ),
          WhiteCard(
            title: user!.nombre,
            child: Text(user.correo),
          ),
        ],
      ),
    );
  }
}
