import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../app/core/network/module/network_module.dart';
import '../merchant_source_impl.dart';
import '../merchants_source.dart';

final merchantsSourceModule = Provider<MerchantsSource>((ref) =>
    MerchantsSourceImpl(networkService: ref.watch(networkServiceProvider)));
