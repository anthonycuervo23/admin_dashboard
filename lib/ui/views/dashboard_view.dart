import 'package:admin_dashboard/api/models/http/auth_response.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Usuario? user = Provider.of<AuthProvider>(context).user;

    return Container(
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
