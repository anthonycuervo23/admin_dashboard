import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//My imports
import 'package:admin_dashboard/api/models/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';


class CategoryModal extends StatefulWidget {
  const CategoryModal({
    Key? key,
    this.category,
  }) : super(key: key);

  final Categoria? category;

  @override
  _CategoryModalState createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String name = '';
  String? id;

  @override
  void initState() {
    id = widget.category?.id;
    name = widget.category?.nombre ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CategoriesProvider categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 500,
      width: 300, //is not necessary because it will expand
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.category?.nombre ?? 'New Category',
                style: CustomLabels.h1.copyWith(color: Colors.white),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.close_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.white.withOpacity(0.3),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            initialValue: widget.category?.nombre ?? '',
            onChanged: (value) => name = value,
            decoration: CustomInputs.authInputDecoration(
              hint: 'Category Name',
              label: 'Category',
              icon: Icons.new_releases_outlined,
            ),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 30.0,
            ),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              onPressed: () async {
                try {
                  if (id == null) {
                    //create new category
                    await categoriesProvider.newCategory(name);
                    NotificationsService.showSnackBar(
                        'Category $name successfully created!');
                  } else {
                    // update category
                    await categoriesProvider.updateCategory(name, id!);
                    NotificationsService.showSnackBar(
                        'Category $name successfully updated!');
                  }
                } catch (e) {
                  NotificationsService.showSnackBarError(
                      'Something went wrong, try again');
                }

                Navigator.pop(context);
              },
              text: 'Save',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Color(0xFF0F2041),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
          ),
        ],
      );
}
