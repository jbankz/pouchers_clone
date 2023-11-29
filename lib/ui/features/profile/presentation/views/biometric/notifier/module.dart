import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'biometric_notifier.dart';

final biometricNotifier =
    ChangeNotifierProvider<BiometricNotifier>((_) => BiometricNotifier());
