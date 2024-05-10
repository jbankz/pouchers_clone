import 'package:pouchers/ui/features/admin/data/source/admin_source.dart';
import 'package:pouchers/ui/features/admin/data/source/admin_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../app/core/network/module/network_module.dart';

final adminSourceModule = Provider<AdminSource>((ref) =>
    AdminSourceImpl(networkService: ref.watch(networkServiceProvider)));
