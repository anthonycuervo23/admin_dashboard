import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//My imports
import 'package:admin_dashboard/datatables/customers_datasource.dart';
import 'package:admin_dashboard/providers/customers_provider.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class CustomersView extends StatelessWidget {
  const CustomersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomersProvider customersProvider =
        Provider.of<CustomersProvider>(context);

    final usersDataSource = new CustomersDTS(customersProvider.customers);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Customers',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10.0,
          ),
          PaginatedDataTable(
            sortAscending: customersProvider.isAscending,
            sortColumnIndex: customersProvider.sortColumnIndex,
            columns: [
              DataColumn(
                label: Text('Avatar'),
              ),
              DataColumn(
                label: Text('Name'),
                onSort: (columnIndex, _) {
                  customersProvider.sortColumnIndex = columnIndex;
                  customersProvider.sort<String>((customer) => customer.nombre);
                },
              ),
              DataColumn(
                label: Text('Email'),
                onSort: (columnIndex, _) {
                  customersProvider.sortColumnIndex = columnIndex;
                  customersProvider.sort<String>((customer) => customer.correo);
                },
              ),
              DataColumn(label: Text('UID')),
              DataColumn(label: Text('Actions')),
            ],
            source: usersDataSource,
          ),
        ],
      ),
    );
  }
}
