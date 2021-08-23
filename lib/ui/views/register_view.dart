import 'package:admin_dashboard/router/routes.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                //Name
                TextFormField(
                  //validator: ,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: buildInputDecoration(
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
                  //validator: ,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: buildInputDecoration(
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
                  //validator: ,
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: buildInputDecoration(
                    hint: '**********',
                    label: 'Password',
                    icon: Icons.lock_outline_rounded,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomOutlinedButton(
                  onPressed: () {},
                  text: 'Sign up',
                ),
                SizedBox(
                  height: 20.0,
                ),
                LinkText(
                  text: 'Already sign up?',
                  onTap: () =>
                      Navigator.pushNamed(context, Flurorouter.loginRoute),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.3),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.3),
        ),
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(
        icon,
        color: Colors.grey,
      ),
      hintStyle: TextStyle(color: Colors.grey),
      labelStyle: TextStyle(color: Colors.grey),
    );
  }
}