import 'package:json_annotation/json_annotation.dart';

part 'rating.g.dart';

@JsonSerializable()
class Rating {
  final int count;
  final double rate;

  Rating({
    required this.count,
    required this.rate,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
