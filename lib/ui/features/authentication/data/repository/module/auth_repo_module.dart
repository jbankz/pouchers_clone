import 'package:pouchers/ui/features/authentication/data/repository/auth_repo_impl.dart';
import 'package:pouchers/ui/features/authentication/domain/repository/auth_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../source/module/module.dart';

final authRepoModule =
    Provider<AuthRepo>((ref) => AuthRepoImpl(ref.read(authSourceModule)));
