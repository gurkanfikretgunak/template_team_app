// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_BookingModel _$$_BookingModelFromJson(Map<String, dynamic> json) =>
    _$_BookingModel(
      title: json['title'] as String?,
      location: json['location'] as String?,
      distance: json['distance'] as String?,
      desc: json['desc'] as String?,
      date: json['date'] as String?,
      price: json['price'] as String?,
      isFavorite: json['isFavorite'] as bool?,
      isCancel: json['isCancel'] as bool?,
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_BookingModelToJson(_$_BookingModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'location': instance.location,
      'distance': instance.distance,
      'desc': instance.desc,
      'date': instance.date,
      'price': instance.price,
      'isFavorite': instance.isFavorite,
      'isCancel': instance.isCancel,
    };
