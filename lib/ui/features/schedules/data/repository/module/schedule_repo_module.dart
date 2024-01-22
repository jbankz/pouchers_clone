import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/schedule_repo.dart';
import '../../source/module/module.dart';
import '../schedule_repo_impl.dart';

final scheduleRepoModule = Provider<ScheduleRepo>(
    (ref) => ScheduleRepoImpl(scheduleSource: ref.read(scheduleSourceModule)));
