import 'package:pouchers/ui/features/merchant/data/repository/merchants_repo_impl.dart';
import 'package:pouchers/ui/features/merchant/domain/repository/merchants_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../source/module/module.dart';

final merchantRepoModule = Provider<MerchantsRepo>(
    (ref) => MerchantsRepoImpl(ref.read(merchantsSourceModule)));
