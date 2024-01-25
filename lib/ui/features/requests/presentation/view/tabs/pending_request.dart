import 'package:Pouchers/app/core/skeleton/widgets.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:Pouchers/ui/features/requests/data/dao/request_received_dao.dart';
import 'package:Pouchers/ui/features/requests/presentation/notifier/request_notifier.dart';
import 'package:Pouchers/ui/features/requests/presentation/view/widget/request_empty_state.dart';
import 'package:Pouchers/ui/notification/notification_tray.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../../app/app.router.dart';
import '../../../../../../app/core/router/page_router.dart';
import '../../../../../widgets/filter_sheet.dart';
import '../../../domain/enum/request_type.dart';
import '../../../domain/model/filter_model.dart';
import '../widget/dropdown_widget.dart';
import '../widget/request_skeleton.dart';
import '../widget/request_widget.dart';

class PendingRequestView extends ConsumerStatefulWidget {
  const PendingRequestView({super.key});

  @override
  ConsumerState<PendingRequestView> createState() => _PendingRequestViewState();
}

class _PendingRequestViewState extends ConsumerState<PendingRequestView> {
  late RequestNotifier _requestNotifier;
  final CancelToken _cancelToken = CancelToken();

  Filter _filter = requestFilter.first;

  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _requestNotifier = ref.read(requestNotifierProvider.notifier);
      _refresh();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  Future<void> _refresh() async {
    try {
      _requestNotifier.resetPageCount();
      await _requestNotifier.fetchRequests(
          requestType: RequestType.received,
          status: _filter.value,
          cancelToken: _cancelToken);
      _refreshController.refreshCompleted();
    } catch (e) {
      _refreshController.refreshFailed();
    }
  }

  Future<void> _paginate() async {
    try {
      _requestNotifier.increamentPageCount();
      await _requestNotifier.fetchRequests(
          requestType: RequestType.received,
          status: _filter.value,
          cancelToken: _cancelToken);
      _refreshController.loadComplete();
    } catch (e) {
      _refreshController.loadFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    final requestState = ref.watch(requestNotifierProvider);
    return ValueListenableBuilder(
        valueListenable: requestReceivedDao.getListenable(),
        builder: (_, box, __) {
          final requests = requestReceivedDao.retrieve(box);
          final bool isBvnVerified = userDao.user.tierLevels > 1;
          return Column(
            children: [
              FilterActionButton(value: _filter.key, tap: _triggerFilterModal),
              const Gap(height: 24),
              Expanded(
                  child: Skeleton(
                isLoading: requestState.isBusy,
                skeleton: const RequestSkeleton(),
                child: SmartRefresher(
                  enablePullUp: true,
                  controller: _refreshController,
                  onRefresh: _refresh,
                  onLoading: _paginate,
                  child: requests.isEmpty
                      ? const EmptyRequestState()
                      : ListView.separated(
                          itemBuilder: (_, index) => RequestWidget(
                              showStatus: false,
                              request: requests[index],
                              tapped: () {
                                if (!isBvnVerified) {
                                  triggerNotificationTray(
                                      AppString.verifyBVNproceed,
                                      error: true);
                                  return;
                                }
                                PageRouter.pushNamed(Routes.requestMoneyView,
                                    args: RequestMoneyViewArguments(
                                        request: requests[index]));
                              }),
                          separatorBuilder: (_, __) => const Gap(height: 6),
                          itemCount: requests.length),
                ),
              ))
            ],
          );
        });
  }

  Future<void> _triggerFilterModal() async {
    _filter =
        await BottomSheets.showSheet(child: FilterSheet(filters: requestFilter))
            as Filter;
    setState(() {});
    _refresh();
  }
}
