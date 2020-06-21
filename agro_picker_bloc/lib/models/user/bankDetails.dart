import 'package:json_annotation/json_annotation.dart';

part 'bankDetails.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class BankDetails {
  final String bankName;
  final String bankAccountNo;
  final String bankAccountName;
  final String bankBranchName;
  final String bankBranchCode;

  const BankDetails(this.bankName, this.bankAccountNo, this.bankAccountName,
      this.bankBranchName, this.bankBranchCode);

  factory BankDetails.fromJson(Map<String, dynamic> json) =>
      _$BankDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$BankDetailsToJson(this);
}
