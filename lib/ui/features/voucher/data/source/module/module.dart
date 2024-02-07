import 'package:Pouchers/ui/features/voucher/data/source/voucher_source.dart';
import 'package:Pouchers/ui/features/voucher/data/source/voucher_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../app/core/network/module/network_module.dart';

final voucherSourceModule = Provider<VoucherSource>((ref) =>
    VoucherSourceImpl(networkService: ref.watch(networkServiceProvider)));
