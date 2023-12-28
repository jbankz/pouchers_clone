import 'package:Pouchers/ui/features/transfer/data/source/transfer/transfer_source.dart';
import 'package:Pouchers/ui/features/transfer/data/source/transfer/transfer_source_impl.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../../../../app/core/network/module/network_module.dart';

final transferSourceModule = Provider<TransferSource>((ref) =>
    TransferSourceImpl(networkService: ref.watch(networkServiceProvider)));
