import 'package:Pouchers/ui/features/authentication/data/source/auth_source.dart';
import 'package:Pouchers/ui/features/authentication/data/source/auth_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../app/core/network/module/network_module.dart';

final authSourceModule = Provider<AuthSource>((ref) {
  final networkService = ref.watch(networkServiceProvider);
  return AuthSourceImpl(networkService: networkService);
});
