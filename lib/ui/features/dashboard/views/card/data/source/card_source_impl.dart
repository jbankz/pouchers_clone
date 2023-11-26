import 'package:Pouchers/app/core/network/network_service.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/created_virtual_card/created_virtual_card.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/freeze_card/freeze_card.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/fund_virtual_account/fund_virtual_account.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/get_card/get_cards.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/get_card_token/get_card_token.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/get_card_transactions/get_card_transactions.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/get_exchange_rate/get_exchange_rate.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/get_virtual_account/get_virtual_account.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/virtual_account_balance/virtual_account_balance.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/virtual_card_details/virtual_card_details.dart';
import 'package:dio/dio.dart';

import '../../../../../../../app/core/network/api_path.dart';
import 'card_source.dart';

class CardSourceImpl implements CardSource<CardDto> {
  final NetworkService networkService;

  CardSourceImpl({required this.networkService});

  @override
  Future<CreatedVirtualCard?> createDollarVirtualCard(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.createDollarVirtualCard,
        requestType: RequestType.post,
        data: cardDto.toJson(),
        cancelToken: cancelToken);
    return CreatedVirtualCard.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<CreatedVirtualCard?> createNairaVirtualCard(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.createNairaVirtualCard,
        requestType: RequestType.post,
        data: cardDto.toJson(),
        cancelToken: cancelToken);
    return CreatedVirtualCard.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<FreezeCard?> freezeCard(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    // final response = await networkService.request(
    //     path: '${ApiPath.freezeCard}/${cardDto.sudoId}',
    //     requestType: RequestType.patch,
    //     data: cardDto.toJson(),
    //     cancelToken: cancelToken);
    // return FreezeCard.fromJson(response.data as Map<String, dynamic>);
    return FreezeCard.fromJson({
      "status": "success",
      "message": "Virtual card updated successfully",
      "code": 200,
      "data": {
        "_id": "63d759d69b62e24a4a8fcfbf",
        "business": "63436ade1bd7847e69481e29",
        "customer": {
          "_id": "63d759cc9b62e24a4a8fcf7e",
          "business": "63436ade1bd7847e69481e29",
          "type": "individual",
          "name": "sunday ikechi",
          "phoneNumber": "+2348123456785",
          "emailAddress": "neddy@enyata.com",
          "status": "active",
          "individual": {
            "firstName": "sunday",
            "lastName": "ikechi",
            "dob": "1993-12-10T00:00:00.000Z",
            "identity": {
              "type": "BVN",
              "number": "22222222222",
              "_id": "63d759cc9b62e24a4a8fcf80"
            },
            "_id": "63d759cc9b62e24a4a8fcf7f"
          },
          "billingAddress": {
            "line1": "10 Surulere Aletor",
            "city": "Lagos",
            "state": "Lagos",
            "country": "Nigeria",
            "postalCode": "100001",
            "_id": "63d759cc9b62e24a4a8fcf81"
          },
          "isDeleted": false,
          "createdAt": "2023-01-30T05:46:52.280Z",
          "updatedAt": "2023-01-30T05:46:52.280Z",
          "__v": 0
        },
        "account": "63d759d69b62e24a4a8fcfb8",
        "fundingSource": "63436ade1bd7847e69481e30",
        "type": "virtual",
        "brand": "Visa",
        "currency": "NGN",
        "maskedPan": "880088******9755",
        "last4": "9755",
        "expiryMonth": "08",
        "expiryYear": "25",
        "status": "active",
        "dummyAccount": {
          "currency": "NGN",
          "bankCode": "SudoUBAVisa",
          "accountType": "Current",
          "accountNumber": "1675057622",
          "_id": "63d759d69b62e24a4a8fcfc0"
        },
        "is2FAEnrolled": true,
        "spendingControls": {
          "channels": {
            "atm": true,
            "pos": true,
            "web": true,
            "mobile": true,
            "_id": "63d7b8059b62e24a4a902c19"
          },
          "allowedCategories": [],
          "blockedCategories": [],
          "spendingLimits": [],
          "_id": "63d7b8059b62e24a4a902c18"
        },
        "updatedAt": "2023-01-31T20:22:29.101Z"
      }
    });
  }

  @override
  Future<FundVirtualAccount?> fundVirtualCard(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.fundVirtualCard,
        requestType: RequestType.patch,
        data: cardDto.toJson(),
        cancelToken: cancelToken);
    return FundVirtualAccount.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<VirtualAccountBalance?> getAccountBalance(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    // final response = await networkService.request(
    //     path: ApiPath.balance,
    //     requestType: RequestType.get,
    //     cancelToken: cancelToken);
    // return VirtualAccountBalance.fromJson(  response.data as Map<String, dynamic>);
    return VirtualAccountBalance.fromJson(
        {"currentBalance": 500000, "availableBalance": 30000});
  }

  @override
  Future<GetCardToken?> getCardToken(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: '${ApiPath.token}/_/token',
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return GetCardToken.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<GetCardTransactions?> getCardTransactions(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: '${ApiPath.transactions}/_/transactions',
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return GetCardTransactions.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<GetCards?> getCards(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    // final response = await networkService.request(
    //     path: '${ApiPath.cards}/${cardDto.userId}/all',
    //     requestType: RequestType.get,
    //     cancelToken: cancelToken);
    return GetCards.fromJson({
      "status": "success",
      "message": "User cards fetched successfully",
      "code": 200,
      "data": [
        {
          "user_id": "user-225210cc591611eda4966b7b9c983819",
          "sudo_id": "63d88aed9b62e24a4a907e1c",
          "account_type": "Current",
          "account_number": "1675135725",
          "account_name": "sunday ikechi",
          "brand": "Visa",
          "currency": "NGN"
        },
        {
          "user_id": "user-225210cc591611eda4966b7b9c983819",
          "sudo_id": "63d88aed9b62e24a4a907e1cDDD",
          "account_type": "Current",
          "account_number": "1675135725",
          "account_name": "sunday ikechi",
          "brand": "Verve",
          "currency": "USD"
        },
      ]
    });
  }

  @override
  Future<GetExchangeRate?> getExchangeRate(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.rate,
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return GetExchangeRate.fromJson(
        response.data?['data'] as Map<String, dynamic>);
  }

  @override
  Future<GetVirtualAccount?> getVirtualAccout(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.virtualAccount,
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return GetVirtualAccount.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<VirtualCardDetails?> getVirtualCardDetails(
      {required CardDto cardDto, CancelToken? cancelToken}) async {
    // final response = await networkService.request(
    //     path: '${ApiPath.cards}/${cardDto.sudoId}',
    //     requestType: RequestType.get,
    //     cancelToken: cancelToken);
    // return VirtualCardDetails.fromJson(response.data as Map<String, dynamic>);
    return VirtualCardDetails.fromJson({
      "_id": "63b3f9980c81cb092d9fc5aa",
      "type": "virtual",
      "brand": "Verve",
      "number": "506321jdd26tSJV3531",
      "expiryMonth": "06",
      "expiryYear": "25",
      "cvv": "243",
      "cvv2": "tok_sandbox_4knqi7oLreDLhsnaLSkiAK",
      "defaultPin": "tok_sandbox_4zhQ8LbzMfteamqLWH7YJz",
      "status": "inactive"
    });
  }
}
