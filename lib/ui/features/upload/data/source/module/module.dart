import 'package:Pouchers/ui/features/upload/data/source/upload_source.dart';
import 'package:Pouchers/ui/features/upload/data/source/upload_source_impl.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../../../app/core/network/module/network_module.dart';

final uploadSourceModule = Provider<UploadSource>((ref) =>
    UploadSourceImpl(networkService: ref.watch(networkServiceProvider)));
