import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class BlankView extends StatelessWidget {
  const BlankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Blank View',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10.0,
          ),
          WhiteCard(
            title: 'Blank Information',
            child: Text('Hello to my dashboard'),
          ),
        ],
      ),
    );
  }
}
