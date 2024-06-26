import 'package:pouchers/ui/features/admin/domain/enum/fees.dart';
import 'package:pouchers/ui/features/admin/domain/model/envs/envs.dart';
import 'package:pouchers/ui/features/dashboard/views/card/data/dao/card_dao.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/enum/card_brand.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/enum/card_type.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/model/cards/cards.dart';
import 'package:pouchers/ui/features/dashboard/views/transaction/domain/model/transaction_analytic.dart';
import 'package:pouchers/ui/features/profile/domain/model/referral/earning.dart';
import 'package:pouchers/ui/features/profile/domain/model/referral/referral.dart';
import 'package:pouchers/ui/features/requests/domain/model/request_model.dart';
import 'package:pouchers/ui/features/transfer/data/dao/local_bank_dao.dart';
import 'package:pouchers/ui/features/transfer/domain/model/attributes.dart';
import 'package:pouchers/ui/features/utilities/data/dao/billers_dao.dart';
import 'package:pouchers/ui/features/utilities/data/dao/cable_services_dao.dart';
import 'package:pouchers/ui/features/voucher/data/dao/vouchers_dao.dart';
import 'package:pouchers/ui/features/voucher/domain/enum/voucher_status.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import '../../../ui/features/admin/data/dao/banner_dao.dart';
import '../../../ui/features/admin/data/dao/env_dao.dart';
import '../../../ui/features/admin/domain/model/banner.dart';
import '../../../ui/features/dashboard/views/card/domain/enum/currency.dart';
import '../../../ui/features/dashboard/views/transaction/data/dao/transaction_analytics_dao.dart';
import '../../../ui/features/dashboard/views/transaction/data/dao/transaction_dao.dart';
import '../../../ui/features/dashboard/views/transaction/domain/enum/transaction_type.dart';
import '../../../ui/features/dashboard/views/transaction/domain/model/transaction_history.dart';
import '../../../ui/features/merchant/data/dao/merchant_dao.dart';
import '../../../ui/features/merchant/domain/model/get_merchants.dart';
import '../../../ui/features/merchant/domain/model/merchants.dart';
import '../../../ui/features/notification/data/dao/notification_dao.dart';
import '../../../ui/features/notification/domain/model/notification_model.dart';
import '../../../ui/features/profile/data/dao/contacts_dao.dart';
import '../../../ui/features/profile/data/dao/referral_dao.dart';
import '../../../ui/features/profile/data/dao/user_dao.dart';
import '../../../ui/features/profile/data/dao/wallet_dao.dart';
import '../../../ui/features/profile/domain/model/referral/referral_trail.dart';
import '../../../ui/features/profile/domain/model/user.dart';
import '../../../ui/features/profile/domain/model/wallet.dart';
import '../../../ui/features/profile/presentation/views/biometric/dao/biometric_dao.dart';
import '../../../ui/features/requests/data/dao/request_received_dao.dart';
import '../../../ui/features/requests/data/dao/request_sent_dao.dart';
import '../../../ui/features/transfer/domain/model/local_bank.dart';
import '../../../ui/features/utilities/domain/enum/service_category.dart';
import '../../../ui/features/utilities/domain/model/billers.dart';
import '../../../ui/features/utilities/domain/model/cable_service.dart';
import '../../../ui/features/utilities/domain/model/get_cable_service.dart';
import '../../../ui/features/voucher/domain/model/vouchers.dart';
import '../../app.locator.dart';
import '../../config/app_logger.dart';

/// initialize local data storage
Future<void> initializeDB() async {
  final logger = getLogger("initializeDB");

  try {
    await Hive.initFlutter();

    await locator<HiveManager>().openAllBox();

    Hive
      ..registerAdapter(UserAdapter())
      ..registerAdapter(ReferralAdapter())
      ..registerAdapter(EarningAdapter())
      ..registerAdapter(ReferralTrailAdapter())
      ..registerAdapter(WalletAdapter())
      ..registerAdapter(LocalBankAdapter())
      ..registerAdapter(AttributesAdapter())
      ..registerAdapter(NotificationModelAdapter())
      ..registerAdapter(BannerAdapter())
      ..registerAdapter(GetMerchantAdapter())
      ..registerAdapter(MerchantAdapter())
      ..registerAdapter(BillersAdapter())
      ..registerAdapter(GetCableServiceAdapter())
      ..registerAdapter(CableServiceAdapter())
      ..registerAdapter(VouchersAdapter())
      ..registerAdapter(VoucherStatusAdapter())
      ..registerAdapter(TransactionHistoryAdapter())
      ..registerAdapter(ExtraDetailsAdapter())
      ..registerAdapter(CurrencyAdapter())
      ..registerAdapter(TransactionTypeAdapter())
      ..registerAdapter(ServiceCategoryAdapter())
      ..registerAdapter(RequestModelAdapter())
      ..registerAdapter(TransactionAnalyticAdapter())
      ..registerAdapter(AnalyticSummaryAdapter())
      ..registerAdapter(AnalyticAdapter())
      ..registerAdapter(CardsAdapter())
      ..registerAdapter(CardTypeAdapter())
      ..registerAdapter(FeesAdapter())
      ..registerAdapter(EnvsAdapter())
      ..registerAdapter(CardBrandAdapter());
  } catch (e) {
    logger.e(e.toString());
  }
}

class HiveManager {
  final logger = getLogger("HiveManager");

  Future openAllBox() async {
    userDao = UserDao();
    walletDao = WalletDao();
    cardsDao = CardsDao();
    referralDao = ReferralDao();
    biometricDao = BiometricDao();
    localBankDao = LocalBankDao();
    notificationDao = NotificationDao();
    bannerDao = BannerDao();
    merchantDao = MerchantDao();
    billersDao = BillersDao();
    cableServicesDao = CableServicesDao();
    vouchersDao = VouchersDao();
    contactDao = ContactDao();
    transactionHistoryDao = TransactionHistoryDao();
    requestSentDao = RequestSentDao();
    requestReceivedDao = RequestReceivedDao();
    transactionAnalyticsDao = TransactionAnalyticsDao();
    envDao = EnvDao();
  }

  Future<void> clearHiveBox({bool reset = false}) async {
    await userDao.truncate();
    await walletDao.truncate();
    await cardsDao.truncate();
    await referralDao.truncate();
    await transactionHistoryDao.truncate();
    await requestSentDao.truncate();
    await requestReceivedDao.truncate();
    await transactionAnalyticsDao.truncate();

    if (reset) {
      await notificationDao.truncate();
      await merchantDao.truncate();
      await billersDao.truncate();
      await cableServicesDao.truncate();
      await vouchersDao.truncate();
    } else {
      await localBankDao.truncate();
      await notificationDao.truncate();
      await bannerDao.truncate();
      await merchantDao.truncate();
      await billersDao.truncate();
      await cableServicesDao.truncate();
      await vouchersDao.truncate();
      await contactDao.truncate();
      await biometricDao.truncate();
      await envDao.truncate();
    }
  }

  Future<Box<T>> openBox<T>(String boxName) async {
    Box<T> box;
    final path = await getApplicationSupportDirectory();

    if (Hive.isBoxOpen(boxName)) {
      box = Hive.box<T>(boxName);
    } else {
      try {
        box = await Hive.openBox<T>(boxName, path: path.path);
      } catch (_) {
        await Hive.deleteBoxFromDisk(boxName, path: path.path);
        box = await Hive.openBox<T>(boxName, path: path.path);
      }
    }
    return box;
  }

  Future<void> clearData() async {
    await _clearBox<Map<String, dynamic>>('');
  }

  Future<void> _clearBox<T>(String name) async {
    try {
      final Box<T> box = await openBox<T>(name);
      await box.clear();
    } catch (_) {
      logger.e('clear $name error: ${_.toString()}');
    }
  }
}
