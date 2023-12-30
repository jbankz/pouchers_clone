import 'package:flutter/material.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/keypad_config.dart';
import 'virtual_key_pad_controller.dart';

class VirtualKeyPad extends StatefulWidget {
  const VirtualKeyPad(
      {super.key,
      required this.keyPadController,
      required this.onComplete,
      this.onTyping,
      this.keypadConfig});

  final Function()? onTyping;
  final Function(String) onComplete;
  final VirtualKeyPadController keyPadController;
  final KeypadConfig? keypadConfig;

  @override
  State<VirtualKeyPad> createState() => _VirtualKeyPadState();
}

class _VirtualKeyPadState extends State<VirtualKeyPad> {
  String get _jointPin => widget.keyPadController.pins.join();
  bool get _completed =>
      _jointPin.isNotEmpty &&
      _jointPin.length == widget.keyPadController.pinCount;

  Future<void> _addPin(String code) async {
    if (widget.keypadConfig?.feedback ?? false) {
      await HapticFeedback.selectionClick();
    }

    if (widget.keyPadController.applyPinLength && _completed) return;

    final String value = widget.keyPadController.pins.join();

    final bool isCompletedDecimal = (value.contains('.') &&
        (widget.keypadConfig?.decimal != null) &&
        value.substring(value.indexOf('.')).length >
            (widget.keypadConfig?.decimal ?? 0));

    widget.keyPadController.addPin(code);

    if (isCompletedDecimal) {
      widget.keyPadController.pins.removeLast();
      return;
    }

    if (widget.onTyping != null) widget.onTyping!();

    if (widget.keyPadController.applyPinLength && _completed) {
      widget.onComplete(_jointPin);
    }
  }

  Future<void> _removePin() async {
    if (widget.keypadConfig?.feedback ?? false) {
      await HapticFeedback.selectionClick();
    }

    widget.keyPadController.removePin();

    if (widget.onTyping != null) widget.onTyping!();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget.keyPadController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: widget.keypadConfig?.padding ??
            EdgeInsets.symmetric(horizontal: 49.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  title: '1',
                  onPressed: () => _addPin('1'),
                  keypadConfig: widget.keypadConfig,
                ),
                ButtonWidget(
                  title: '2',
                  onPressed: () => _addPin('2'),
                  keypadConfig: widget.keypadConfig,
                ),
                ButtonWidget(
                  title: '3',
                  onPressed: () => _addPin('3'),
                  keypadConfig: widget.keypadConfig,
                ),
              ],
            ),
            const Gap(height: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  title: '4',
                  onPressed: () => _addPin('4'),
                  keypadConfig: widget.keypadConfig,
                ),
                ButtonWidget(
                  title: '5',
                  onPressed: () => _addPin('5'),
                  keypadConfig: widget.keypadConfig,
                ),
                ButtonWidget(
                  title: '6',
                  onPressed: () => _addPin('6'),
                  keypadConfig: widget.keypadConfig,
                ),
              ],
            ),
            const Gap(height: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  title: '7',
                  onPressed: () => _addPin('7'),
                  keypadConfig: widget.keypadConfig,
                ),
                ButtonWidget(
                  title: '8',
                  onPressed: () => _addPin('8'),
                  keypadConfig: widget.keypadConfig,
                ),
                ButtonWidget(
                  title: '9',
                  onPressed: () => _addPin('9'),
                  keypadConfig: widget.keypadConfig,
                ),
              ],
            ),
            const Gap(height: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  title: (widget.keypadConfig?.showPoint ?? false) ? '.' : '',
                  onPressed: (widget.keypadConfig?.showPoint ?? false)
                      ? () => _addPin('.')
                      : null,
                  keypadConfig: widget.keypadConfig,
                ),
                ButtonWidget(
                  title: '0',
                  onPressed: () => _addPin('0'),
                  keypadConfig: widget.keypadConfig,
                ),
                ButtonWidget(
                    child: Icon(Icons.backspace_outlined,
                        color: widget.keypadConfig?.keypadColor ??
                            AppColors.kPrimaryTextColor),
                    onPressed: () => _removePin()),
              ],
            ),
          ],
        ),
      );
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key, this.title, this.child, this.onPressed, this.keypadConfig});

  final String? title;
  final Widget? child;
  final void Function()? onPressed;
  final KeypadConfig? keypadConfig;

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          enableFeedback: true,
          overlayColor: MaterialStateColor.resolveWith(
            (_) => AppColors.kGreyScale.withOpacity(.30),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        child: child ??
            Text(
              title ?? '',
              style: context.titleLarge?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: keypadConfig?.keypadColor ?? AppColors.kPrimaryTextColor,
              ),
            ),
      );
}
