import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/profile/presentation/views/wallet/widget/balance_indicator_widget.dart';
import 'package:Pouchers/ui/features/transfer/domain/dto/transfer_money_dto.dart';
import 'package:Pouchers/ui/features/transfer/presentation/notifier/transfer_notifier.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/ui/widgets/keypad/config/keypad_config.dart';
import 'package:Pouchers/ui/widgets/keypad/virtual_keypad.dart';
import 'package:Pouchers/ui/widgets/profile_image.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../widgets/keypad/virtual_key_pad_controller.dart';
import '../../../../widgets/sheets/confirmation_sheet.dart';
import '../../../profile/domain/model/user.dart';
import '../sheets/transfer_to_poucher_note_sheet.dart';
import '../sheets/transfer_to_poucher_tags_sheet.dart';
import '../state/transfer_state.dart';

class TransferMoneyView extends ConsumerStatefulWidget {
  const TransferMoneyView({super.key});

  @override
  ConsumerState<TransferMoneyView> createState() => _TransferMoneyViewState();
}

class _TransferMoneyViewState extends ConsumerState<TransferMoneyView> {
  final VirtualKeyPadController _controller =
      VirtualKeyPadController(applyPinLength: false);

  final CancelToken _cancelToken = CancelToken();

  late TransferNotifier _transferNotifier;

  User? _userTag;
  bool get _isUserAvailable => _userTag != null;
  String get _fullName =>
      '${_userTag?.firstName?.titleCase ?? ''} ${_userTag?.lastName?.titleCase ?? ''}';
  String? _note;
  bool get _isBtnDisEnabled => _controller.pins.isEmpty || _userTag == null;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _transferNotifier = ref.read(transferNotifierProvider.notifier);
      _controller.addListener(() => setState(() {}));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final transferState = ref.watch(transferNotifierProvider);
    return Scaffold(
      backgroundColor: AppColors.kPurpleColor,
      appBar: AppBar(
        backgroundColor: AppColors.kPurpleColor,
        title: Text(
          AppString.transferMoney,
          style: context.bodyLarge?.copyWith(
            color: AppColors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Gap(height: 40),
                    const BalanceIndicatorWidget(
                      amount: 0,
                      balanceColor: AppColors.kLightPurple,
                    ),
                    const Gap(height: 22),
                    _buildTagContainer(context),
                    const Gap(height: 84),
                    _buildAmountText(context),
                    const Gap(height: 52),
                  ],
                ),
              ),
            ),
            _buildVirtualKeyPad(),
            const Gap(height: 23),
            _buildTransferButton(context, transferState),
          ],
        ),
      ),
    );
  }

  Widget _buildTagContainer(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 33.w),
        child: InkWell(
          onTap: () async {
            _userTag = await BottomSheets.showSheet(
              child: const TransferToPoucherTagSheet(),
            ) as User?;
            setState(() {});
          },
          borderRadius: BorderRadius.circular(8.r),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            padding: EdgeInsets.symmetric(
              horizontal: _isUserAvailable ? 16.w : 30.w,
              vertical: _isUserAvailable ? 11.h : 26.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    _isUserAvailable
                        ? ProfileImage(
                            image: _userTag?.profilePicture ?? '',
                            height: 38,
                            width: 38)
                        : Text('@',
                            style: context.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 16)),
                    const Gap(width: 5),
                    Expanded(
                      child: Text(
                        _isUserAvailable
                            ? _fullName
                            : AppString.enterPoucherTag,
                        style: context.titleMedium?.copyWith(
                          color: AppColors.kIconGrey,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    const Gap(width: 5),
                    Container(
                      height: 24.h,
                      width: 24.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.kPurple100,
                      ),
                      child: const Icon(Icons.navigate_next,
                          color: AppColors.white),
                    ),
                  ],
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  child: !_isUserAvailable
                      ? const SizedBox.shrink()
                      : InkWell(
                          onTap: () async {
                            _note = await BottomSheets.showSheet(
                              child: const TransferToPoucherNoteSheet(),
                            ) as String?;
                            setState(() {});
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Gap(height: 10),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Text(
                                      _note ?? AppString.addNote,
                                      style: context.titleMedium?.copyWith(
                                        color: AppColors.kSecondaryTextColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SvgPicture.asset(AppImage.forwardArrow),
                                ],
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildAmountText(BuildContext context) => Text(
        _controller.pins.isEmpty ? 0.toNaira : _controller.pins.join().naira,
        style: context.titleLarge?.copyWith(
          color: AppColors.kBackgroundColor,
          fontWeight: FontWeight.w700,
          fontSize: 40,
        ),
      );

  Widget _buildVirtualKeyPad() => VirtualKeyPad(
      keyPadController: _controller,
      keypadConfig: KeypadConfig(keypadColor: AppColors.white, showPoint: true),
      onComplete: (_) {});

  Widget _buildTransferButton(
          BuildContext context, TransferState transferState) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ElevatedButtonWidget(
          loading: transferState.isBusy,
          bacgroundColor: _isBtnDisEnabled ? null : AppColors.kPurpleDeep,
          title: AppString.transfer,
          onPressed: _isBtnDisEnabled
              ? null
              : () async {
                  final response = await BottomSheets.showAlertDialog(
                    child: TransferConfirmationSheet(
                        amount: num.parse(_controller.pins.join()),
                        receipient: _fullName),
                  ) as String?;

                  if (response != null) {
                    _transferNotifier.p2pTransfer(
                      TransferMoneyDto(
                          tag: _userTag?.tag,
                          amount: _controller.pins.join(),
                          note: _note,
                          transactionPin: response),
                      _cancelToken,
                    );
                  }
                },
        ),
      );
}
