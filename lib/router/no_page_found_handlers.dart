import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
//My imports
import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/ui/views/no_page_found_view.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = Handler(handlerFunc: (context, params) {
    Provider.of<SidebarProvider>(context!).setCurrentPageUrl('/404');

    return NoPageFoundView();
  });
}
