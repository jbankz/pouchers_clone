import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/app/core/skeleton/widgets.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/app_strings.dart';
import '../../../../../widgets/edit_text_field_with.dart';
import '../../../../../widgets/gap.dart';
import '../../../../transfer/domain/model/guest_local_bank.dart';
import '../../../../transfer/presentation/notifier/local_bank_notifier.dart';

class UssdSheets extends ConsumerStatefulWidget {
  const UssdSheets({super.key});

  @override
  ConsumerState<UssdSheets> createState() => _UssdSheetsState();
}

class _UssdSheetsState extends ConsumerState<UssdSheets> {
  String _searchQuery = '';

  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => ref
        .read(localBankNotifierProvider.notifier)
        .getGuestLocalBanks(_cancelToken));
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final guestBanks = ref.watch(localBankNotifierProvider);
    final banks = guestBanks.guestLocalBanks
        .where((element) =>
            element.name!.toLowerCase().startsWith(_searchQuery.toLowerCase()))
        .toList();
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          EditTextFieldWidget(
              title: AppString.selectBank,
              label: AppString.selectBankInst,
              onChanged: (value) => setState(() => _searchQuery = value)),
          const Gap(height: 23),
          SizedBox(
            height: context.height * .7,
            child: Skeleton(
              isLoading: ref.watch(localBankNotifierProvider).isBusy,
              skeleton: _buildBankListSkeleton(),
              child: _buildBankList(banks, context),
            ),
          )
        ],
      ),
    );
  }

  ListView _buildBankListSkeleton() => ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemBuilder: (_, index) =>
          Container(height: 40.h, width: double.infinity, color: Colors.white),
      separatorBuilder: (_, __) =>
          const Column(children: [Gap(height: 7), Divider(), Gap(height: 7)]),
      itemCount: context.height.toInt());

  ListView _buildBankList(List<GuestLocalBank> banks, BuildContext context) =>
      ListView.separated(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemBuilder: (_, index) {
            final bank = banks[index];
            return GestureDetector(
                onTap: () => PageRouter.pop(bank),
                child: Text(bank.name ?? '',
                    style: context.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w500)));
          },
          separatorBuilder: (_, __) => const Column(
              children: [Gap(height: 14), Divider(), Gap(height: 14)]),
          itemCount: banks.length);
}
