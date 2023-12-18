import '../../../common/app_images.dart';

class BottomNav {
  final String icon;
  final String label;

  BottomNav({required this.icon, required this.label});
}

List<BottomNav> get bottomNav => [
      BottomNav(icon: AppImage.home, label: 'Home'),
      BottomNav(icon: AppImage.card, label: 'Cards'),
      BottomNav(icon: AppImage.transaction, label: 'Transactions'),
      BottomNav(icon: AppImage.profile, label: 'Account')
    ];
