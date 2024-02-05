import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/card_brand.dart';

class CardIcon {
  static String returnIcon(CardBrand? brand) {
    switch (brand) {
      case CardBrand.verve:
        return AppImage.verve;
      case CardBrand.visa:
        return AppImage.visa;
      case CardBrand.masterCard:
        return AppImage.mastercard;
      default:
        return AppImage.visa;
    }
  }
}
