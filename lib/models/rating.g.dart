// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      count: json['count'] as int,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'count': instance.count,
      'rate': instance.rate,
    };
