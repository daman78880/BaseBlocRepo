import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/common_enums.dart';
part 'products_event.freezed.dart';

@freezed
sealed class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.initial() = ProductsInitial;
  const factory ProductsEvent.getList({required ListGetType listGetState}) =
      ProductsGetList;
  const factory ProductsEvent.selectProduct({required int index}) =
      ProductToggleSelection;
}
