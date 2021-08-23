import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/routes.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginFormProvider>(
      create: (_) => LoginFormProvider(),
      child: Builder(
        builder: (context) {
          final LoginFormProvider loginFormProvider =
              Provider.of<LoginFormProvider>(context);
          return Container(
            color: Colors.black,
            margin: EdgeInsets.only(top: 100.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 370,
                ),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: loginFormProvider.formKey,
                  child: Column(
                    children: [
                      //Email
                      TextFormField(
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? ''))
                            return 'Enter a valid Email';
                          return null;
                        },
                        onChanged: (value) => loginFormProvider.email = value,
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
                            return 'Password length must be at least 8 characters';
                          return null;
                        },
                        onChanged: (value) =>
                            loginFormProvider.password = value,
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
                          loginFormProvider.validateForm();
                        },
                        text: 'Sign in',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      LinkText(
                        text: 'New account',
                        onTap: () => Navigator.pushNamed(
                          context,
                          Flurorouter.registerRoute,
                        ),
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
