import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/dto/mobile_dto.dart';
import '../../domain/model/airtime_top_deals.dart';
import '../../domain/model/billers.dart';
import '../../domain/model/get_cable_service.dart';
import '../../domain/model/guest_services_purchase.dart';
import '../../domain/model/mobile_data_services.dart';
import '../../domain/model/discounts.dart';
import '../../domain/model/validate_customer.dart';

part 'billers_state.freezed.dart';

@Freezed(copyWith: true)
class BillersState<T> with _$BillersState<T> {
  const factory BillersState(
      {@Default(false) bool isGuest,
      @Default(false) bool isBusy,
      @Default(false) bool isPurchasing,
      @Default(false) bool isGettingServices,
      @Default(false) bool isScheduling,
      @Default(false) bool isValidatingCustomerInfo,
      @Default(false) bool isGettingDiscount,
      @Default(false) bool isGettingUssd,
      String? errorMessage,
      StackTrace? stackTrace,
      @Default([]) List<Billers> billers,
      DiscountsData? discounts,
      @Default([]) List<AirtimeTopDeals> airtimeTopDeals,
      @Default([]) List<MobileOperatorServices> mobileOperatorServices,
      ValidateCustomer? validateCustomerInfo,
      GetCableService? cableService,
      MobileDto? mobileDto,
      GuestServicesPurchase? guestServicesPurchase}) = _BillersState<T>;
}
