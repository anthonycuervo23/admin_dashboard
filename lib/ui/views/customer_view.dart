import 'package:admin_dashboard/api/models/user.dart';
import 'package:admin_dashboard/providers/customer_form_provider.dart';
import 'package:admin_dashboard/providers/customers_provider.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerView extends StatefulWidget {
  const CustomerView({Key? key, required this.uid}) : super(key: key);

  final String uid;

  @override
  _CustomerViewState createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  Usuario? customer;

  @override
  void initState() {
    final CustomersProvider customersProvider =
        Provider.of<CustomersProvider>(context, listen: false);

    final CustomerFormProvider customerFormProvider =
        Provider.of<CustomerFormProvider>(context, listen: false);

    customersProvider.getUserById(widget.uid).then((customerDB) {
      if (customerDB != null) {
        customerFormProvider.customer = customerDB;
        customerFormProvider.formKey = new GlobalKey<FormState>();
        setState(() {
          customer = customerDB;
        });
      } else {
        NavigationService.replaceTo('/dashboard/customers');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    customer = null;
    Provider.of<CustomerFormProvider>(context, listen: false).customer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Customer',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10.0,
          ),
          if (customer == null)
            WhiteCard(
              child: Container(
                height: 400,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          if (customer != null) _CustomerViewBody()
        ],
      ),
    );
  }
}

class _CustomerViewBody extends StatelessWidget {
  const _CustomerViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        //width of column
        columnWidths: {
          //key: index of column, value: width
          0: FixedColumnWidth(250),
        },
        children: [
          TableRow(
            children: [
              //Avatar
              _AvatarContainer(),

              //Form
              _UserViewForm(),
            ],
          ),
        ],
      ),
    );
  }
}

class _UserViewForm extends StatelessWidget {
  const _UserViewForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomerFormProvider customerFormProvider =
        Provider.of<CustomerFormProvider>(context);
    final Usuario customer = customerFormProvider.customer!;

    return WhiteCard(
      title: 'Customer Information',
      child: Form(
        key: customerFormProvider.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              initialValue: customer.nombre,
              onChanged: (value) =>
                  customerFormProvider.copyUserWith(nombre: value),
              validator: (value) {
                if (value == '') return 'Name is required';
                return null;
              },
              decoration: CustomInputs.formInputDecoration(
                hint: 'Customer Name',
                label: 'Name',
                icon: Icons.supervised_user_circle_outlined,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              onChanged: (value) =>
                  customerFormProvider.copyUserWith(correo: value),
              validator: (value) {
                if (!EmailValidator.validate(value ?? ''))
                  return 'Enter a valid Email';
                return null;
              },
              initialValue: customer.correo,
              decoration: CustomInputs.formInputDecoration(
                hint: 'Customer email',
                label: 'Email',
                icon: Icons.mark_email_read_outlined,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 100,
              ),
              child: ElevatedButton(
                onPressed: () async {
                  final updated = await customerFormProvider.updateUser();
                  if (updated) {
                    NotificationsService.showSnackBar(
                        'Customer information updated successfully!');
                    Provider.of<CustomersProvider>(context, listen: false)
                        .refreshCustomer(customer);
                  } else {
                    NotificationsService.showSnackBarError(
                        'Something went wrong, please try again');
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigo),
                  shadowColor: MaterialStateProperty.all(Colors.indigo),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.save_outlined,
                    ),
                    Text(' Save'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  const _AvatarContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomerFormProvider customerFormProvider =
        Provider.of<CustomerFormProvider>(context);
    final Usuario customer = customerFormProvider.customer!;
    return WhiteCard(
      width: 250.0,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Profile',
              style: CustomLabels.h2,
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 150.0,
              height: 160.0,
              child: Stack(
                children: [
                  ClipOval(
                    child: Image(
                      image: AssetImage('no-image.jpg'),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 45.0,
                      height: 45.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                      ),
                      child: FloatingActionButton(
                        backgroundColor: Colors.indigo,
                        elevation: 0,
                        onPressed: () {},
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 20.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              customer.nombre,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              customer.correo,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
