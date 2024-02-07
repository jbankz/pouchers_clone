import 'package:Pouchers/ui/features/authentication/presentation/view/pin/notifier/pin_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pinModule = ChangeNotifierProvider<PinNotifier>((_) => PinNotifier());
