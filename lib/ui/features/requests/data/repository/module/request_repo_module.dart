import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/request_repo.dart';
import '../../source/module/module.dart';
import '../request_repo_impl.dart';

final requestRepoModule = Provider<RequestRepo>(
    (ref) => RequestRepoImpl(requestSource: ref.read(requestSourceModule)));
