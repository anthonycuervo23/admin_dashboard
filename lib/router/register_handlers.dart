import 'package:admin_dashboard/ui/views/register_view.dart';
import 'package:fluro/fluro.dart';

class RegisterHandlers {
  static Handler register = Handler(handlerFunc: (context, params) {
    return RegisterView();
  });
}
