import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app/core/auto_logout/module/module.dart';

class SessionTimeOutListener extends HookConsumerWidget {
  const SessionTimeOutListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) => ref.read(timerProvider).reStartTimer(),
      child: child);
}
