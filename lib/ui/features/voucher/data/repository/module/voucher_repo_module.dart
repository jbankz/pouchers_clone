import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/voucher_repository.dart';
import '../../source/module/module.dart';
import '../voucher_repo_impl.dart';

final voucherRepoModule = Provider<VoucherRepo>(
    (ref) => VoucherRepoImpl(ref.read(voucherSourceModule)));
