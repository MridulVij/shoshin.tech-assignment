class DetailsModel {
  final String? eventId;
  final String? title;
  final String? description;
  final String? payout;
  final bool? isCompleted;
  final int? payoutAmt;
  final String? payoutCurrency;

  DetailsModel({
    this.eventId,
    this.title,
    this.description,
    this.payout,
    this.isCompleted,
    this.payoutAmt,
    this.payoutCurrency,
  });

  DetailsModel.fromJson(Map<String, dynamic> json)
      : eventId = json['eventId'] as String?,
        title = json['title'] as String?,
        description = json['description'] as String?,
        payout = json['payout'] as String?,
        isCompleted = json['isCompleted'] as bool?,
        payoutAmt = json['payout_amt'] as int?,
        payoutCurrency = json['payout_currency'] as String?;

  Map<String, dynamic> toJson() => {
        'eventId': eventId,
        'title': title,
        'description': description,
        'payout': payout,
        'isCompleted': isCompleted,
        'payout_amt': payoutAmt,
        'payout_currency': payoutCurrency
      };
}
