import 'package:flutter/material.dart';

//My imports
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      decoration: buildBoxDecoration(),
      child: TextField(
        decoration: CustomInputs.searchInputDecoration(
          hint: 'Search',
          icon: Icons.search_outlined,
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.withOpacity(0.1),
      );
}
