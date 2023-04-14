import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/modules/onboarding/model/onboarding_model.dart';
import 'package:pouchers/modules/utilities/model/utilities_model.dart';
import 'package:pouchers/modules/utilities/repository/utilities_repository.dart';

final buyVoucherProvider = StateNotifierProvider.autoDispose<BuyVoucherNotifier,
    NotifierState<String>>((ref) {
  return BuyVoucherNotifier(ref.read(utilitiesRepoProvider));
});

final fetchVoucherProvider = StateNotifierProvider.autoDispose<
    FetchVoucherNotifier, NotifierState<GetVoucherResponse>>((ref) {
  return FetchVoucherNotifier(ref.read(utilitiesRepoProvider));
});

final giftVoucherProvider = StateNotifierProvider.autoDispose<
    GiftVoucherNotifier, NotifierState<String>>((ref) {
  return GiftVoucherNotifier(ref.read(utilitiesRepoProvider));
});

final redeemVoucherProvider = StateNotifierProvider.autoDispose<
    RedeemVoucherNotifier, NotifierState<String>>((ref) {
  return RedeemVoucherNotifier(ref.read(utilitiesRepoProvider));
});

final getUtilitiesProvider = StateNotifierProvider.autoDispose<
    GetUtilitiesNotifier, NotifierState<GetUtilitiesResponse>>((ref) {
  return GetUtilitiesNotifier(ref.read(utilitiesRepoProvider));
});

final getDiscountProvider = StateNotifierProvider.autoDispose<
    GetDiscountNotifier, NotifierState<DiscountResponse>>((ref) {
  return GetDiscountNotifier(ref.read(utilitiesRepoProvider));
});

final getUtilitiesTypeProvider = StateNotifierProvider.autoDispose<
    GetUtilitiesTypeNotifier, NotifierState<GetUtilitiesTypesResponse>>((ref) {
  return GetUtilitiesTypeNotifier(ref.read(utilitiesRepoProvider));
});

final buyUtilitiesProvider = StateNotifierProvider.autoDispose<
    BuyUtilitiesNotifier, NotifierState<String>>((ref) {
  return BuyUtilitiesNotifier(ref.read(utilitiesRepoProvider));
});

final buyAirtimeProvider = StateNotifierProvider.autoDispose<BuyAirtimeNotifier,
    NotifierState<String>>((ref) {
  return BuyAirtimeNotifier(ref.read(utilitiesRepoProvider));
});

final getDataBundleProvider = StateNotifierProvider.autoDispose<
    GetDataBundleNotifier, NotifierState<DataBundleResponse>>((ref) {
  return GetDataBundleNotifier(ref.read(utilitiesRepoProvider));
});

final checkStatusProvider = StateNotifierProvider.autoDispose<
    CheckStatusNotifier, NotifierState<String>>((ref) {
  return CheckStatusNotifier(ref.read(utilitiesRepoProvider));
});

final guestAirtimeProvider = StateNotifierProvider<GuestAirtimeNotifier,
    NotifierState<String>>((ref) {
  return GuestAirtimeNotifier(ref.read(utilitiesRepoProvider));
});

final guestUssdProvider = StateNotifierProvider<GuestUssdNotifier,
    NotifierState<UssdResponse>>((ref) {
  return GuestUssdNotifier(ref.read(utilitiesRepoProvider));
});

final guestUtilityUssdProvider = StateNotifierProvider<GuestUtilityUssdNotifier,
    NotifierState<UssdResponse>>((ref) {
  return GuestUtilityUssdNotifier(ref.read(utilitiesRepoProvider));
});



class BuyVoucherNotifier extends StateNotifier<NotifierState<String>>
     {
  final UtilitiesRepository _repo;

  BuyVoucherNotifier(this._repo) : super(NotifierState());

  void buyVoucher(
      {required String amount,
      required String transactionPin,
      Function()? then}) async {
    state = notifyLoading();
    state =
        await _repo.buyVoucher(amount: amount, transactionPin: transactionPin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class FetchVoucherNotifier
    extends StateNotifier<NotifierState<GetVoucherResponse>>
   {
  final UtilitiesRepository _repo;

  FetchVoucherNotifier(this._repo) : super(NotifierState());

  void fetchVoucher({required String status, Function(List<Voucher>)? then}) async {
    state = notifyLoading();
    state = await _repo.fetchVoucher(status: status);
    if (state.status == NotifierStatus.done) {
      if (then != null) then(state.data!.data!.vouchers);
    }
  }
}

class GiftVoucherNotifier extends StateNotifier<NotifierState<String>>
    {
  final UtilitiesRepository _repo;

  GiftVoucherNotifier(this._repo) : super(NotifierState());

  void giftVoucher(
      {String? email,
      String? tag,
      required String transactionPin,
      required String code,
      Function()? then}) async {
    state = notifyLoading();
    state = await _repo.giftVoucher(
        email: email, code: code, tag: tag, transactionPin: transactionPin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class RedeemVoucherNotifier extends StateNotifier<NotifierState<String>>
    {
  final UtilitiesRepository _repo;

  RedeemVoucherNotifier(this._repo) : super(NotifierState());

  void redeemVoucher(
      {required String transactionPin,
      required String code,
      Function()? then}) async {
    state = notifyLoading();
    state =
        await _repo.redeemVoucher(code: code, transactionPin: transactionPin);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetUtilitiesNotifier
    extends StateNotifier<NotifierState<GetUtilitiesResponse>>
   {
  final UtilitiesRepository _repo;

  GetUtilitiesNotifier(this._repo) : super(NotifierState());

  void getUtilities({required String utility, Function()? then}) async {
    state = notifyLoading();
    state = await _repo.getUtilities(
      utility: utility,
    );
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetDiscountNotifier
    extends StateNotifier<NotifierState<DiscountResponse>>
     {
  final UtilitiesRepository _repo;

  GetDiscountNotifier(this._repo) : super(NotifierState());

  void getDiscount({required String utility, Function()? then}) async {
    state = notifyLoading();
    state = await _repo.getDiscount(
      utility: utility,
    );
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}



class GetUtilitiesTypeNotifier
    extends StateNotifier<NotifierState<GetUtilitiesTypesResponse>>
     {
  final UtilitiesRepository _repo;

  GetUtilitiesTypeNotifier(this._repo) : super(NotifierState());

  void getUtilitiesType(
      {required String merchantServiceId, Function()? then}) async {
    state = notifyLoading();
    state = await _repo.getUtilitiesType(
      merchantServiceId: merchantServiceId,
    );
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    }
  }
}

class GetDataBundleNotifier
    extends StateNotifier<NotifierState<DataBundleResponse>>
     {
  final UtilitiesRepository _repo;

  GetDataBundleNotifier(this._repo) : super(NotifierState());

  void getDataBundle(
      {required String merchantServiceId, Function(DataBundleResponse?)? then}) async {
    state = notifyLoading();
    state = await _repo.getDataBundles(
      merchantServiceId: merchantServiceId,
    );
    if (state.status == NotifierStatus.done) {
      if (then != null) then(state.data );
    }
  }
}

class CheckStatusNotifier
    extends StateNotifier<NotifierState<String>>
  {
  final UtilitiesRepository _repo;

  CheckStatusNotifier(this._repo) : super(NotifierState());

  void checkPaymentStatus(
      {required String reference, Function(String?)? then}) async {
    state = notifyLoading();
    state = await _repo.checkPaymentStatus(
      reference: reference,
    );
    if (state.status == NotifierStatus.done) {
      if (then != null) then(state.data ?? state.message ?? "");
    }
  }
}



class BuyUtilitiesNotifier extends StateNotifier<NotifierState<String>>
   {
  final UtilitiesRepository _repo;

  BuyUtilitiesNotifier(this._repo) : super(NotifierState());

  void buyUtilities(
      {required List<String> merchantService,
      required double amount,
      required String merchantAccount,
      required String transactionPin,
      required String subCategory,
      required String merchantReferenceNumber,
      required String category,
         bool? applyDiscount,
      required bool isSchedule,
      String? frequency,
      Function()? then,
      Function(String)? error}) async {
    state = notifyLoading();
    state = await _repo.buyUtilities(
        category: category,
        merchantService: merchantService,
        transactionPin: transactionPin,
        isSchedule: isSchedule,
        amount: amount,
        applyDiscount : applyDiscount,
        frequency: frequency,
        subCategory: subCategory,
        merchantReferenceNumber: merchantReferenceNumber,
        merchantAccount: merchantAccount);
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    } else if (state.status == NotifierStatus.error) {
      if (error != null) error(state.message ?? state.data ?? "");
    }
  }
}

class BuyAirtimeNotifier extends StateNotifier<NotifierState<String>>
    {
  final UtilitiesRepository _repo;

  BuyAirtimeNotifier(this._repo) : super(NotifierState());

  void buyAirtime(
      {required String subCategory,
      required String amount,
      required String category,
      required String destinationPhoneNumber,
      required String transactionPin,
      required String mobileOperatorPublicId,
      required bool isAirtime,
        required bool applyDiscount,
      String? mobileOperatorServiceId,
      Function()? then,
      Function(String)? error}) async {
    state = notifyLoading();
    state = await _repo.buyAirtime(
      destinationPhoneNumber: destinationPhoneNumber,
      mobileOperatorPublicId: mobileOperatorPublicId,
      transactionPin: transactionPin,
      isAirtime: isAirtime,
      applyDiscount: applyDiscount,
      mobileOperatorServiceId: mobileOperatorServiceId,
      category: category,
      amount: amount,
      subCategory: subCategory,
    );
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    } else if (state.status == NotifierStatus.error) {
      if (error != null) error(state.message ?? state.data ?? "");
    }
  }
}

class GuestAirtimeNotifier extends StateNotifier<NotifierState<String>>
     {
  final UtilitiesRepository _repo;

  GuestAirtimeNotifier(this._repo) : super(NotifierState());

  void guestAirtime(
      {required String subCategory,
        required String amount,
        required String category,
        required String destinationPhoneNumber,
        required String mobileOperatorPublicId,
        required bool isAirtime,
        String? mobileOperatorServiceId, email, name, bank,
        Function(String)? then,
        Function(String)? error}) async {
    state = notifyLoading();
    state = await _repo.isGuestBuyAirtime(
      destinationPhoneNumber: destinationPhoneNumber,
      mobileOperatorPublicId: mobileOperatorPublicId,
      isAirtime: isAirtime,
      mobileOperatorServiceId: mobileOperatorServiceId,
      category: category,
      name: name,
      email: email,
      amount: amount,
      bank: bank,
      subCategory: subCategory,
    );
    if (state.status == NotifierStatus.done) {
      if (then != null) then(state.data ?? "no data");
    } else if (state.status == NotifierStatus.error) {
      if (error != null) error(state.message ?? state.data ?? "");
    }
  }
}

class GuestUssdNotifier extends StateNotifier<NotifierState<UssdResponse>>
     {
  final UtilitiesRepository _repo;

  GuestUssdNotifier(this._repo) : super(NotifierState());

  void guestUssd(
      {required String subCategory,
        required String amount,
        required String category,
        required String destinationPhoneNumber,
        required String mobileOperatorPublicId,
        required bool isAirtime,
        String? mobileOperatorServiceId, email, name, bank,
        Function()? then,
        Function(String)? error}) async {
    state = notifyLoading();
    state = await _repo.isGuestUssd(
      destinationPhoneNumber: destinationPhoneNumber,
      mobileOperatorPublicId: mobileOperatorPublicId,
      isAirtime: isAirtime,
      mobileOperatorServiceId: mobileOperatorServiceId,
      category: category,
      name: name,
      email: email,
      amount: amount,
      bank: bank,
      subCategory: subCategory,
    );
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    } else if (state.status == NotifierStatus.error) {
      if (error != null) error(state.message  ?? "");
    }
  }
}

class GuestUtilityUssdNotifier extends StateNotifier<NotifierState<UssdResponse>>
    {
  final UtilitiesRepository _repo;

  GuestUtilityUssdNotifier(this._repo) : super(NotifierState());

  void guestUtilityUssd(
      {required List<String> merchantService,
        required double amount,
        required String merchantAccount,
        required String subCategory,
        required String merchantReferenceNumber,
        required String category,
        String? email,
        name,
        bank,
        Function()? then,
        Function(String)? error}) async {
    state = notifyLoading();
    state = await _repo.isGuestUtilityUssd(
      merchantReferenceNumber: merchantReferenceNumber,
      merchantService: merchantService,
      merchantAccount: merchantAccount,
      category: category,
      name: name,
      email: email,
      amount: amount,
      bank: bank,
      subCategory: subCategory,
    );
    if (state.status == NotifierStatus.done) {
      if (then != null) then();
    } else if (state.status == NotifierStatus.error) {
      if (error != null) error(state.message  ?? "");
    }
  }
}



