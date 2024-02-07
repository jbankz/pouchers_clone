import 'package:Pouchers/ui/features/utilities/data/source/billers_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../app/core/network/module/network_module.dart';
import '../billers_source_impl.dart';

final billersSourceModule = Provider<BillerSource>((ref) =>
    BillersSourceImpl(networkService: ref.watch(networkServiceProvider)));
