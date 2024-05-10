import 'package:pouchers/ui/features/utilities/data/repository/billers_repo_impl.dart';
import 'package:pouchers/ui/features/utilities/domain/repository/billers_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../source/module/module.dart';

final billersRepoModule = Provider<BillerRepo>(
    (ref) => BillersRepoImpl(ref.read(billersSourceModule)));
