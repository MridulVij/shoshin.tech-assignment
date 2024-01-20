class TasksModel {
  final String? taskId;
  final String? title;
  final String? thumbnail;
  final String? shortDesc;
  final String? payout;
  final String? ctaShort;
  final String? ctaLong;
  final String? type;
  final String? totalLead;
  final bool? isTrending;
  final String? earned;
  final String? status;
  final String? isCompleted;
  final Brand? brand;
  final int? payoutAmt;
  final String? payoutCurrency;
  final String? ctaAction;
  final CustomData? customData;

  TasksModel({
    this.taskId,
    this.title,
    this.thumbnail,
    this.shortDesc,
    this.payout,
    this.ctaShort,
    this.ctaLong,
    this.type,
    this.totalLead,
    this.isTrending,
    this.earned,
    this.status,
    this.isCompleted,
    this.brand,
    this.payoutAmt,
    this.payoutCurrency,
    this.ctaAction,
    this.customData,
  });

  TasksModel.fromJson(Map<String, dynamic> json)
      : taskId = json['taskId'] as String?,
        title = json['title'] as String?,
        thumbnail = json['thumbnail'] as String?,
        shortDesc = json['shortDesc'] as String?,
        payout = json['payout'] as String?,
        ctaShort = json['ctaShort'] as String?,
        ctaLong = json['ctaLong'] as String?,
        type = json['type'] as String?,
        totalLead = json['total_lead'] as String?,
        isTrending = json['isTrending'] as bool?,
        earned = json['earned'] as String?,
        status = json['status'] as String?,
        isCompleted = json['isCompleted'] as String?,
        brand = (json['brand'] as Map<String, dynamic>?) != null
            ? Brand.fromJson(json['brand'] as Map<String, dynamic>)
            : null,
        payoutAmt = json['payout_amt'] as int?,
        payoutCurrency = json['payout_currency'] as String?,
        ctaAction = json['ctaAction'] as String?,
        customData = (json['custom_data'] as Map<String, dynamic>?) != null
            ? CustomData.fromJson(json['custom_data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'taskId': taskId,
        'title': title,
        'thumbnail': thumbnail,
        'shortDesc': shortDesc,
        'payout': payout,
        'ctaShort': ctaShort,
        'ctaLong': ctaLong,
        'type': type,
        'total_lead': totalLead,
        'isTrending': isTrending,
        'earned': earned,
        'status': status,
        'isCompleted': isCompleted,
        'brand': brand?.toJson(),
        'payout_amt': payoutAmt,
        'payout_currency': payoutCurrency,
        'ctaAction': ctaAction,
        'custom_data': customData?.toJson()
      };
}

class Brand {
  final String? brandId;
  final String? title;
  final String? logo;

  Brand({
    this.brandId,
    this.title,
    this.logo,
  });

  Brand.fromJson(Map<String, dynamic> json)
      : brandId = json['brandId'] as String?,
        title = json['title'] as String?,
        logo = json['logo'] as String?;

  Map<String, dynamic> toJson() =>
      {'brandId': brandId, 'title': title, 'logo': logo};
}

class CustomData {
  final String? appRating;
  final String? wallUrl;
  final String? dominantColor;

  CustomData({
    this.appRating,
    this.wallUrl,
    this.dominantColor,
  });

  CustomData.fromJson(Map<String, dynamic> json)
      : appRating = json['app_rating'] as String?,
        wallUrl = json['wall_url'] as String?,
        dominantColor = json['dominant_color'] as String?;

  Map<String, dynamic> toJson() => {
        'app_rating': appRating,
        'wall_url': wallUrl,
        'dominant_color': dominantColor
      };
}
