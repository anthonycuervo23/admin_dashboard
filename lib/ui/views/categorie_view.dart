import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//My imports
import 'package:admin_dashboard/api/models/category.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:admin_dashboard/datatables/categories_datasource.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Categoria> categories =
        Provider.of<CategoriesProvider>(context).categories;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Categories',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10.0,
          ),
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Category')),
              DataColumn(label: Text('Created by')),
              DataColumn(label: Text('Actions')),
            ],
            source: CategoriesDTS(categories, context),
            header: Text(
              'Available Categories',
              maxLines: 2,
            ),
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            actions: [
              CustomIconButton(
                onPressed: () => showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (_) => CategoryModal(
                    category: null,
                  ),
                ),
                text: 'New',
                icon: Icons.add,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
