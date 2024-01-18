import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../app/core/network/module/network_module.dart';
import '../request_source.dart';
import '../request_source_impl.dart';

final requestSourceModule = Provider<RequestSource>((ref) =>
    RequestSourceImpl(networkService: ref.watch(networkServiceProvider)));
