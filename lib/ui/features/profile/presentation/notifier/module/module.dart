import 'package:Pouchers/ui/features/profile/domain/model/wallet.dart';
import 'package:Pouchers/ui/features/profile/domain/usecase/module/module.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'module.g.dart';

@riverpod
Future<Wallet?> walletBalance(WalletBalanceRef ref,
        {CancelToken? cancelToken}) async =>
    await ref.read(getWalletUseCaseModule).execute(cancelToken);
