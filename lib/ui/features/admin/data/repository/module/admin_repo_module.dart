import 'package:Pouchers/ui/features/admin/data/repository/admin_repo_impl.dart';
import 'package:Pouchers/ui/features/admin/domain/repository/admin_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../source/module/module.dart';

final adminRepoModule =
    Provider<AdminRepo>((ref) => AdminRepoImpl(ref.read(adminSourceModule)));
