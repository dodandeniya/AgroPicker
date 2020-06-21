import 'package:json_annotation/json_annotation.dart';

part 'consumer.g.dart';

@JsonSerializable()
class Consumer {
  final String consumerId;
  final String consumerFirstName;
  final String consumerLastName;
  Consumer(this.consumerId, this.consumerFirstName, this.consumerLastName);

  factory Consumer.fromJson(Map<String, dynamic> json) =>
      _$ConsumerFromJson(json);

  Map<String, dynamic> toJson() => _$ConsumerToJson(this);
}
