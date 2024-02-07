import 'package:riverpod/riverpod.dart';

import '../../../../../../../app/core/network/module/network_module.dart';
import '../user_source.dart';
import '../user_source_impl.dart';

final userSourceModule = Provider<UserSource>(
    (ref) => UserSourceImpl(networkService: ref.watch(networkServiceProvider)));
