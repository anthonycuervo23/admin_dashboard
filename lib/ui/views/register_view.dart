import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

//My imports
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/routes.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';


class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterFormProvider>(
      create: (_) => RegisterFormProvider(),
      child: Builder(
        builder: (context) {
          final RegisterFormProvider registerFormProvider =
              Provider.of<RegisterFormProvider>(context);
          return Container(
            color: Colors.black,
            margin: EdgeInsets.only(top: 50.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 370,
                ),
                child: Form(
                  key: registerFormProvider.formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      //Name
                      TextFormField(
                        validator: (value) {
                          if (value == '') return 'Name is required';
                          return null;
                        },
                        onChanged: (value) => registerFormProvider.name = value,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: CustomInputs.authInputDecoration(
                          hint: 'Enter your name',
                          label: 'Name',
                          icon: Icons.supervised_user_circle_sharp,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      //Email
                      TextFormField(
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? ''))
                            return 'Enter a valid Email';
                          return null;
                        },
                        onChanged: (value) =>
                            registerFormProvider.email = value,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: CustomInputs.authInputDecoration(
                          hint: 'Enter your email',
                          label: 'Email',
                          icon: Icons.email_outlined,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      //Password
                      TextFormField(
                        validator: (value) {
                          if (value == '') return 'Enter a valid Password';
                          if (value!.length < 8)
                            return 'Password Length must be at least 8 Characters';
                          return null;
                        },
                        onChanged: (value) =>
                            registerFormProvider.password = value,
                        obscureText: true,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: CustomInputs.authInputDecoration(
                          hint: '**********',
                          label: 'Password',
                          icon: Icons.lock_outline_rounded,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomOutlinedButton(
                        onPressed: () {
                          final validForm = registerFormProvider.validateForm();
                          if (!validForm) return;
                          final AuthProvider authProvider =
                              Provider.of<AuthProvider>(context, listen: false);
                          authProvider.register(
                              registerFormProvider.name,
                              registerFormProvider.email,
                              registerFormProvider.password);
                        },
                        text: 'Sign up',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      LinkText(
                        text: 'Already sign up?',
                        onTap: () => Navigator.pushReplacementNamed(
                            context, Flurorouter.loginRoute),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
