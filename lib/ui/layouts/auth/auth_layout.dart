import 'package:flutter/material.dart';

//My imports
import 'package:admin_dashboard/ui/layouts/auth/widgets/background_twitter.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/links_footer.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          (size.width > 1000)
              ?
              //Desktop View
              _DesktopBody(child: child)
              :

              //Mobile View
              _MobileBody(child: child),

          //Footer with links
          Footer(),
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.95,
      color: Colors.black,
      child: Row(
        children: [
          //Twitter Background
          Expanded(child: BackgroundTwitter()),
          // View Container
          Container(
            width: 600.0,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                //Custom title
                CustomTitle(),
                SizedBox(
                  height: 50.0,
                ),
                //Sign in or Sign up form
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  const _MobileBody({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.0,
          ),
          CustomTitle(),
          Container(
            width: double.infinity,
            height: 420.0,
            child: child,
          ),
          Container(
            width: double.infinity,
            height: 400.0,
            child: BackgroundTwitter(),
          )
        ],
      ),
    );
  }
}
