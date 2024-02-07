import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'timer_notifier.dart';

final otpTimerModule =
    ChangeNotifierProvider<OtpTimerNotifier>((_) => OtpTimerNotifier());
