import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'user_provider.dart';

class ProviderConfig {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context) => UserProvider()),
  ];
}
