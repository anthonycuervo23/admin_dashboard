import 'package:flutter/material.dart';

//My imports
import 'package:admin_dashboard/api/models/user.dart';
import 'package:admin_dashboard/services/navigation_service.dart';

class CustomersDTS extends DataTableSource {
  CustomersDTS(this.customers);

  final List<Usuario> customers;

  @override
  DataRow? getRow(int index) {
    final Usuario customer = customers[index];

    final image = (customer.img == null)
        ? Image(
            image: AssetImage('no-image.jpg'),
            width: 35,
            height: 35,
          )
        : FadeInImage.assetNetwork(
            placeholder: 'loader.gif',
            image: customer.img!,
            width: 35,
            height: 35,
          );

    return DataRow.byIndex(index: index, cells: [
      DataCell(ClipOval(child: image)),
      DataCell(Text(customer.nombre)),
      DataCell(Text(customer.correo)),
      DataCell(Text(customer.uid)),
      DataCell(
        IconButton(
          icon: Icon(Icons.edit_outlined),
          onPressed: () => NavigationService.replaceTo(
              '/dashboard/customers/${customer.uid}'),
        ),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => customers.length;

  @override
  int get selectedRowCount => 0;
}
