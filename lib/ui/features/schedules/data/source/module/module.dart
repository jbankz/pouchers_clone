import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../app/core/network/module/network_module.dart';
import '../schedule_source.dart';
import '../schedule_source_impl.dart';

final scheduleSourceModule = Provider<ScheduleSource>((ref) =>
    ScheduleSourceImpl(networkService: ref.watch(networkServiceProvider)));
