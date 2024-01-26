import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../../../../common/app_strings.dart';
import '../../../../../widgets/edit_text_field_with.dart';
import '../../../../../widgets/gap.dart';
import '../../../../transfer/data/dao/local_bank_dao.dart';

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
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<Box>(
      valueListenable: localBankDao.getListenable(),
      builder: (_, box, __) {
        final banks = localBankDao.retrieve(box, query: _searchQuery);
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
                child: ListView.separated(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemBuilder: (_, index) {
                      final bank = banks[index].attributes;
                      return GestureDetector(
                          onTap: () => PageRouter.pop(bank),
                          child: Text(bank?.name ?? '',
                              style: context.headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.w500)));
                    },
                    separatorBuilder: (_, __) => const Column(children: [
                          Gap(height: 14),
                          Divider(),
                          Gap(height: 14)
                        ]),
                    itemCount: banks.length),
              )
            ],
          ),
        );
      });
}
