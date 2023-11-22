import 'package:Pouchers/ui/features/dashboard/views/card/data/repository/card_repo_impl.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/data/source/module/module.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/repository/card_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardRepoModule =
    Provider<CardRepo>((ref) => CardRepoImpl(ref.read(cardSourceModule)));
