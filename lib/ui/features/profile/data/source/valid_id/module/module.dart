import 'package:riverpod/riverpod.dart';

import '../valid_id_source.dart';
import '../valid_id_source_impl.dart';

final validIdSourceModule = Provider<ValidIdSource>((_) => ValidIdSourceImpl());
