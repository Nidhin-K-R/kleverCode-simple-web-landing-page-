import 'package:flutter_riverpod/legacy.dart';

class AppProviders {
  static final scrollProvider = StateProvider((_) => false);
  static final outlinrButtonProvider = StateProvider((_) => -1);
  static final containerProvider = StateProvider<int?>((_) => null);
}
