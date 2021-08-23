import 'package:fluro/fluro.dart';

//My imports
import 'package:admin_dashboard/ui/views/login_view.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: (context, params) {
    return LoginView();
  });
}
