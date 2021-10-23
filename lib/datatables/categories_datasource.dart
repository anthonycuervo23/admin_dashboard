import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//My imports
import 'package:admin_dashboard/api/models/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';

class CategoriesDTS extends DataTableSource {
  final List<Categoria> categories;
  final BuildContext context;

  CategoriesDTS(this.categories, this.context);

  @override
  DataRow? getRow(int index) {
    final category = categories[index];

    //here we build a row
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(category.id)),
      DataCell(Text(category.nombre)),
      DataCell(Text(category.usuario.nombre)),
      DataCell(Row(
        children: [
          IconButton(
            onPressed: () => showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (_) => CategoryModal(
                category: categories[index],
              ),
            ),
            icon: Icon(Icons.edit_outlined),
          ),
          IconButton(
            onPressed: () {
              final dialog = AlertDialog(
                title: Text('Delete Category?'),
                content: Text('Yo will delete: ${category.nombre}'),
                actions: [
                  TextButton(
                    child: Text('No'),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                    child: Text('Yes, delete'),
                    onPressed: () async {
                      await Provider.of<CategoriesProvider>(context,
                              listen: false)
                          .deleteCategory(category.id);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );

              showDialog(context: context, builder: (_) => dialog);
            },
            icon: Icon(
              Icons.delete_outline_rounded,
              color: Colors.red.withOpacity(0.8),
            ),
          ),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categories.length;

  @override
  int get selectedRowCount => 0;
}
