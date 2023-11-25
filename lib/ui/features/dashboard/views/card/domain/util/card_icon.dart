import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/card_brand.dart';

class CardIcon {
  static String returnIcon(CardBrand? brand) {
    switch (brand) {
      case CardBrand.Verve:
        return AppImage.verve;
      case CardBrand.Visa:
        return AppImage.visa;
      case CardBrand.MasterCard:
        return AppImage.mastercard;
      default:
        return AppImage.visa;
    }
  }
}
