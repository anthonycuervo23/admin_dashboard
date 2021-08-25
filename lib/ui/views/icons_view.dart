import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Icons',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10.0,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              WhiteCard(
                title: 'ac_unit_outlined',
                child: Center(
                  child: Icon(
                    Icons.ac_unit_outlined,
                  ),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'access_alarms_outlined',
                child: Center(
                  child: Icon(
                    Icons.access_alarm_outlined,
                  ),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'access_time_outlined',
                child: Center(
                  child: Icon(
                    Icons.access_time_outlined,
                  ),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'beach_access_outlined',
                child: Center(
                  child: Icon(
                    Icons.beach_access_outlined,
                  ),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'translate',
                child: Center(
                  child: Icon(
                    Icons.translate,
                  ),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'lock_outlined',
                child: Center(
                  child: Icon(
                    Icons.lock_outline,
                  ),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'vignette_outlined',
                child: Center(
                  child: Icon(
                    Icons.vignette_outlined,
                  ),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'record_voice_over',
                child: Center(
                  child: Icon(
                    Icons.record_voice_over,
                  ),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'router',
                child: Center(
                  child: Icon(
                    Icons.router,
                  ),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'shop',
                child: Center(
                  child: Icon(
                    Icons.shop,
                  ),
                ),
                width: 170,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
