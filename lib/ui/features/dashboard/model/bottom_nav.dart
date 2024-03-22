import '../../../common/app_images.dart';

class BottomNav {
  final String enabledIcon;
  final String disabledIcon;
  final String label;

  BottomNav(
      {required this.enabledIcon,
      required this.disabledIcon,
      required this.label});
}

List<BottomNav> get bottomNav => [
      BottomNav(
          enabledIcon: AppImage.homeLottie,
          disabledIcon: AppImage.home,
          label: 'Home'),
      BottomNav(
          enabledIcon: AppImage.cardLottie,
          disabledIcon: AppImage.card,
          label: 'Cards'),
      BottomNav(
          enabledIcon: AppImage.compareLottie,
          disabledIcon: AppImage.transaction,
          label: 'Transactions'),
      BottomNav(
          enabledIcon: AppImage.accountLottie,
          disabledIcon: AppImage.profile,
          label: 'Account')
    ];
