import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/card_notifier.dart';
import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/ui/widgets/hint_widget.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../modules/cards/screens/create_card.dart';
import 'widgets/card_empty_state.dart';

class CardView extends ConsumerStatefulWidget {
  const CardView({super.key});

  @override
  ConsumerState<CardView> createState() => _CardViewState();
}

class _CardViewState extends ConsumerState<CardView> {
  late CardNotifier _cardNotifier;
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _cardNotifier = ref.read(cardNotifierProvider.notifier)
        ..getCards(CardDto(userId: userDao.user.userId), _cancelToken);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(cardNotifierProvider);
    return 2 < 2
        ? const CreateCard()
        : Scaffold(
            body: appState.isBusy
                ? const Center(child: CupertinoActivityIndicator())
                : const CardEmptyState());
  }
}
