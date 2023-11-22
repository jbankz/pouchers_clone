import 'package:Pouchers/ui/features/upload/data/repository/upload_repo_impl.dart';
import 'package:Pouchers/ui/features/upload/data/source/module/module.dart';
import 'package:Pouchers/ui/features/upload/domain/repository/upload_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final uploadRepoModule = Provider<UploadRepo>(
    (ref) => UploadRepImpl(uploadSource: ref.read(uploadSourceModule)));
