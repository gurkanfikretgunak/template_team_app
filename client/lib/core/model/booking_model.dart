import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@unfreezed
class BookingModel with _$BookingModel {
  factory BookingModel({
    String? title,
    String? location,
    String? distance,
    String? desc,
    String? date,
    String? price,
    bool? isFavorite,
    bool? isCancel,
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);
}
