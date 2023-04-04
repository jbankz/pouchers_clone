import 'package:flutter/material.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';

class RewardsContainer extends StatelessWidget {
  final Widget widget, icon;

  const RewardsContainer(
      {Key? key,
      required this.textTheme,
      required this.widget,
      required this.icon})
      : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kRegularPadding, vertical: kMediumPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kSmallPadding),
          border:
              Border.all(width: 1, color: Color.fromRGBO(233, 230, 253, 0.5)),
          color: kPrimaryWhite),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              padding: EdgeInsets.all(kSmallPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kPadding),
                border: Border.all(
                  width: 1,
                  color: kLightPurple,
                ),
              ),
              child: icon),
          Expanded(child: widget),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: kRegularPadding, vertical: kSmallPadding),
            decoration: BoxDecoration(
                color: Color.fromRGBO(80, 52, 196, 0.2),
                borderRadius: BorderRadius.circular(kSupremePadding)),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(80, 52, 196, 0.2),
                      border: Border.all(
                        color: kPrimaryColor,
                        width: 2,
                      )),
                  child: Text(
                    "P",
                    style: textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(
                  width: kSmallPadding,
                ),
                Text(
                  "10",
                  style: textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ReferralClass {
  final String name;
  final String date;
  final String status;

  ReferralClass(this.name, this.date, this.status);
}

class GetReferralResponse {
  GetReferralResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  GetReferralData? data;

  factory GetReferralResponse.fromJson(Map<String, dynamic> json) =>
      GetReferralResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : GetReferralData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data!.toJson(),
      };
}

class GetReferralData {
  GetReferralData({
    this.earning,
    this.referralTrail,
  });

  List<Earning>? earning;
  List<ReferralTrail>? referralTrail;

  factory GetReferralData.fromJson(Map<String, dynamic> json) =>
      GetReferralData(
        earning:
            List<Earning>.from(json["earning"].map((x) => Earning.fromJson(x))),
        referralTrail: List<ReferralTrail>.from(
            json["referralTrail"].map((x) => ReferralTrail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "earning": List<dynamic>.from(earning!.map((x) => x.toJson())),
        "referralTrail":
            List<dynamic>.from(referralTrail!.map((x) => x.toJson())),
      };
}

class Earning {
  Earning({
    this.totalEarnings,
  });

  dynamic totalEarnings;

  factory Earning.fromJson(Map<String, dynamic> json) => Earning(
        totalEarnings: json["total_earnings"],
      );

  Map<String, dynamic> toJson() => {
        "total_earnings": totalEarnings,
      };
}

class ReferralTrail {
  ReferralTrail({
    this.id,
    this.referrerUserId,
    this.referredUserId,
    this.isPaid,
    this.referralAmount,
    this.firstName,
    this.lastName,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? referrerUserId;
  String? referredUserId;
  bool? isPaid;
  String? referralAmount;
  String? firstName;
  String? lastName;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ReferralTrail.fromJson(Map<String, dynamic> json) => ReferralTrail(
        id: json["id"],
        referrerUserId: json["referrer_user_id"],
        referredUserId: json["referred_user_id"],
        isPaid: json["is_paid"],
        referralAmount: json["referral_amount"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "referrer_user_id": referrerUserId,
        "referred_user_id": referredUserId,
        "is_paid": isPaid,
        "referral_amount": referralAmount,
        "first_name": firstName,
        "last_name": lastName,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class BannerResponse {
  BannerResponse({
     this.status,
     this.message,
     this.code,
     this.data,
  });

  String? status;
  String? message;
  int? code;
  List<BannerData>? data;

  factory BannerResponse.fromJson(Map<String, dynamic> json) => BannerResponse(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: json["data"] == null ? null : List<BannerData>.from(json["data"].map((x) => BannerData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class BannerData {
  BannerData({
     this.id,
     this.imageUrl,
     this.type,
  });

  String? id;
  String? imageUrl;
  String? type;

  factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
    id: json["id"],
    imageUrl: json["image_url"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_url": imageUrl,
    "type": type,
  };

  @override
  String toString() {
    return 'BannerData{id: $id, imageUrl: $imageUrl, type: $type}';
  }
}

