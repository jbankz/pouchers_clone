import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/profile_model.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/account/screens/request/received_details.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReceivedRequests extends ConsumerStatefulWidget {
  @override
  ConsumerState<ReceivedRequests> createState() => _SentRequestsState();
}

class _SentRequestsState extends ConsumerState<ReceivedRequests> {
  String selectedText = "All";
  List<Request> request = [];
  List<Request> totalRequest = [];
  bool loadNextPage = false;
  final ScrollController scrollController = ScrollController();
  int lengthOfData = 0;
  int total = 0;
  int count = 1;
  String status = "All";


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(manageReceivedRequestProvider.notifier).manageRequest(
            type: "received",
            page: count,
          status: status == "All"
              ? null
              : status.toLowerCase()
          );
      scrollController.addListener(() {
        double maxScroll = scrollController.position.maxScrollExtent;
        double currentScroll = scrollController.position.pixels;
        if (currentScroll == maxScroll && (double.parse(total.toString()) != double.parse(totalRequest.length.toString()))) {
          setState(() {
            loadNextPage = true;
          });
          count++;
          ref.read(manageReceivedRequestProvider.notifier).manageRequest(
            type: "received",
            page: count,
            status: status == "All"
                ? null
                : status.toLowerCase()
          );
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Column(
        children: [
          Consumer(builder: (context, ref, _) {
            var _widget = Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: kPadding, horizontal: kMicroPadding),
                          decoration: BoxDecoration(
                              border: Border.all(color: kLightPurple, width: 1),
                              borderRadius: BorderRadius.circular(kPadding),
                              color: kBackgroundColor),
                          child: Text(
                            "Filter by",
                            style: textTheme.headline3!
                                .copyWith(color: kPurpleColor),
                          ),
                        ),
                        SizedBox(
                          width: kRegularPadding,
                        ),
                        Expanded(
                          child: Container(
                            height: 33,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(left: kRegularPadding),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: kSecondaryTextColor, width: 1),
                                borderRadius: BorderRadius.circular(kPadding),
                                color: kBackgroundColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedText,
                                  style: textTheme.headline4!
                                      .copyWith(color: kIconGrey),
                                ),
                                PopupMenuButton(
                                    offset: Offset(0, 40),
                                    padding: EdgeInsets.zero,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: kLightColor600, width: 0.3),
                                        borderRadius:
                                        BorderRadius.circular(kPadding)),
                                    icon: Icon(Icons.keyboard_arrow_down,
                                        color: kIconGrey),
                                    itemBuilder: (_) =>
                                    const <PopupMenuItem<String>>[
                                      PopupMenuItem<String>(
                                          child: Text('All'), value: 'All'),
                                      PopupMenuItem<String>(
                                          child: Text('Accepted'),
                                          value: 'Accepted'),
                                      PopupMenuItem<String>(
                                          child: Text('Pending'),
                                          value: 'Pending'),
                                      PopupMenuItem<String>(
                                          child: Text('Declined'),
                                          value: 'Declined'),
                                    ],
                                    onSelected: (val) {
                                      setState(() {
                                        count = 1;
                                        status = val.toString();
                                      });

                                      ref
                                          .read(manageReceivedRequestProvider.notifier)
                                          .manageRequest(
                                          type: "received",
                                          page: count,
                                          status: val.toString() == "All"
                                              ? null
                                              : val.toString().toLowerCase());
                                      setState(() {
                                        selectedText = val.toString();
                                        request = [];
                                        totalRequest = [];
                                      });
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: kMicroPadding,
                    ),
                    request.isEmpty
                        ? Column(
                      children: [
                        SizedBox(
                          height: kSupremePadding,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kBackgroundColor,
                          ),
                          padding: EdgeInsets.all(kMacroPadding),
                          child: SvgPicture.asset(
                            AssetPaths.requestIcon,
                            color: kIconGrey,
                            height: 35,
                            width: 35,
                          ),
                        ),
                        SizedBox(
                          height: kRegularPadding,
                        ),
                        Text(
                          noRequest,
                          style: textTheme.headline3!.copyWith(
                            color: kIconGrey,
                          ),
                        )
                      ],
                    )
                        : Expanded(
                      child: ListView.builder(
                        itemCount: request.length,
                        controller: scrollController,
                        itemBuilder: (context, index) {
                          return inkWell(
                            onTap: request[index].status == "pending"
                                ? () {
                              pushTo(
                                  context,
                                  ReceivedDetails(
                                      request: request[index]));
                            }
                                : (){

                              showErrorBar(context, "This request has been Accepted or Declined");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: kPrimaryWhite,
                                  borderRadius:
                                  BorderRadius.circular(kSmallPadding),
                                  border: Border.all(
                                      width: 1, color: kLightPurple)),
                              margin:
                              EdgeInsets.symmetric(vertical: kPadding),
                              padding: EdgeInsets.symmetric(
                                  vertical: kRegularPadding,
                                  horizontal: kMediumPadding),
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(116),
                                    child: request[index].profilePicture ==
                                        null
                                        ? Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kPrimaryColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                            "${request[index].firstName!.substring(0, 1).toUpperCase()}${request[index].lastName!.substring(0, 1).toUpperCase()}",
                                            style: textTheme
                                                .bodyText2!
                                                .copyWith(
                                                fontSize: 22)),
                                      ),
                                    )
                                        : Image.network(
                                      request[index].profilePicture ??
                                          "",
                                      errorBuilder:
                                          (BuildContext context, _,
                                          stackTrace) {
                                        return Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kPrimaryColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                                "${request[index].firstName!.substring(0, 1).toUpperCase()}${request[index].lastName!.substring(0, 1).toUpperCase()}",
                                                style: textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                    fontSize:
                                                    22)),
                                          ),
                                        );
                                      },
                                      fit: BoxFit.cover,
                                      height: 50,
                                      width: 50,
                                      loadingBuilder:
                                          (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent?
                                          loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child:
                                          CircularProgressIndicator(
                                            value: loadingProgress
                                                .expectedTotalBytes !=
                                                null
                                                ? loadingProgress
                                                .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: kRegularPadding,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${capitalize(request[index].firstName ?? "")} ${capitalize(request[index].lastName ?? "")}",
                                          style:
                                          textTheme.headline4!.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "DMSans",
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          height: kPadding,
                                        ),
                                        Text(
                                          "₦${kPriceFormatter(
                                            double.parse(
                                                request[index].amount ?? "0"),
                                          )}",
                                          style:
                                          textTheme.headline2!.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: request[index].note == null ? 0: kPadding,
                                        ),
                                        request[index].note == null ? SizedBox():    Text(
                                          request[index].note == null
                                              ? ""
                                              : "Note: ${request[index].note}",
                                          style:
                                          textTheme.headline6!.copyWith(
                                            color: kIconGrey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: kRegularPadding,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: kRegularPadding,
                                        vertical: kPadding),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            kRegularPadding),
                                        color: request[index].status ==
                                            "pending"
                                            ? Color(0xffECECEC)
                                            : request[index].status ==
                                            "accepted"
                                            ? Color(0xffE5F9F0)
                                            : Color(0xffFFECE8)),
                                    child: Text(
                                      capitalize(
                                          request[index].status ?? ""),
                                      style: textTheme.headline4!.copyWith(
                                          fontSize: 12,
                                          color: request[index].status ==
                                              "pending"
                                              ? kPrimaryTextColor
                                              : request[index].status ==
                                              "accepted"
                                              ? kColorGreen
                                              : Color(0xffFF8264)
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ));
            ref.listen(manageReceivedRequestProvider,
                (previous, NotifierState<ManageRequestResponse> next) async {
              if (next.status == NotifierStatus.done) {
                setState(() {
                  loadNextPage = false;
                  total = int.parse(next.data!.data!.total!);
                });
                next.data?.data?.requests?.forEach((element) {
                  setState(() {
                    request.add(element);
                    totalRequest.add(element);
                  });
                });
              }
            });
            return ref.watch(manageReceivedRequestProvider).when(
                loading: () => loadNextPage  ? _widget : SpinKitDemo(),
                done: (data) {
                  if (data != null) {
                    return _widget;
                  } else
                    return SizedBox();
                });
          }),
          loadNextPage ? SpinKitDemo() : SizedBox()
        ],
      ),
    );
  }
}
