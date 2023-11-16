import 'package:flutter/material.dart';

import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';

import 'keypad/virtual_key_pad_controller.dart';

class VirtualKeyPad extends StatefulWidget {
  const VirtualKeyPad(
      {super.key,
      required this.keyPadController,
      required this.onComplete,
      this.onTyping,
      this.padding = const EdgeInsets.symmetric(horizontal: 49)});

  final Function()? onTyping;
  final Function(String) onComplete;
  final EdgeInsets padding;
  final VirtualKeyPadController keyPadController;

  @override
  State<VirtualKeyPad> createState() => _VirtualKeyPadState();
}

class _VirtualKeyPadState extends State<VirtualKeyPad> {
  String get _jointPin => widget.keyPadController.pins.join();
  bool get _completed =>
      _jointPin.isNotEmpty &&
      _jointPin.length == widget.keyPadController.pinCount;

  void _addPin(String code) {
    if (_completed) return;

    widget.keyPadController.addPin(code);

    if (widget.onTyping != null) widget.onTyping!();

    if (_completed) {
      widget.onComplete(_jointPin);
    }
  }

  void _removePin() => widget.keyPadController.removePin();

  @override
  Widget build(BuildContext context) => Padding(
        padding: widget.padding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(title: '1', onPressed: () => _addPin('1')),
                ButtonWidget(title: '2', onPressed: () => _addPin('2')),
                ButtonWidget(title: '3', onPressed: () => _addPin('3'))
              ],
            ),
            const Gap(height: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(title: '4', onPressed: () => _addPin('4')),
                ButtonWidget(title: '5', onPressed: () => _addPin('5')),
                ButtonWidget(title: '6', onPressed: () => _addPin('6'))
              ],
            ),
            const Gap(height: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(title: '7', onPressed: () => _addPin('7')),
                ButtonWidget(title: '8', onPressed: () => _addPin('8')),
                ButtonWidget(title: '9', onPressed: () => _addPin('9'))
              ],
            ),
            const Gap(height: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ButtonWidget(title: ''),
                ButtonWidget(title: '0', onPressed: () => _addPin('0')),
                ButtonWidget(
                    child: const Icon(Icons.backspace_outlined,
                        color: AppColors.kPrimaryTextColor),
                    onPressed: () => _removePin())
              ],
            )
          ],
        ),
      );
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, this.title, this.child, this.onPressed});

  final String? title;
  final Widget? child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          enableFeedback: true,
          overlayColor: MaterialStateColor.resolveWith(
              (_) => AppColors.kGreyScale.withOpacity(.30)),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      child: child ??
          Text(title ?? '',
              style: context.titleLarge?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.kPrimaryTextColor)));
}
