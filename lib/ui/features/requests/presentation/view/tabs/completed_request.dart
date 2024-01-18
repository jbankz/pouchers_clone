import 'package:Pouchers/app/core/skeleton/widgets.dart';
import 'package:Pouchers/ui/features/requests/data/dao/request_sent_dao.dart';
import 'package:Pouchers/ui/features/requests/presentation/notifier/request_notifier.dart';
import 'package:Pouchers/ui/features/requests/presentation/view/widget/request_empty_state.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../domain/enum/request_type.dart';
import '../../../domain/model/filter_model.dart';
import '../sheet/request_filter_sheet.dart';
import '../widget/dropdown_widget.dart';
import '../widget/request_skeleton.dart';
import '../widget/request_widget.dart';

class CompletedRequestView extends ConsumerStatefulWidget {
  const CompletedRequestView({super.key});

  @override
  ConsumerState<CompletedRequestView> createState() =>
      _CompletedRequestViewState();
}

class _CompletedRequestViewState extends ConsumerState<CompletedRequestView> {
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
          requestType: RequestType.sent,
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
          requestType: RequestType.sent,
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
        valueListenable: requestSentDao.getListenable(),
        builder: (_, box, __) {
          final requests = requestSentDao.retrieve(box);

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
                          itemBuilder: (_, index) =>
                              RequestWidget(request: requests[index]),
                          separatorBuilder: (_, __) => const Gap(height: 6),
                          itemCount: requests.length),
                ),
              ))
            ],
          );
        });
  }

  Future<void> _triggerFilterModal() async {
    _filter = await BottomSheets.showSheet(child: const RequestFilterSheet())
        as Filter;
    setState(() {});
    _refresh();
  }
}
