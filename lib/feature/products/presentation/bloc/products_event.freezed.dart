// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsEvent()';
}


}

/// @nodoc
class $ProductsEventCopyWith<$Res>  {
$ProductsEventCopyWith(ProductsEvent _, $Res Function(ProductsEvent) __);
}


/// Adds pattern-matching-related methods to [ProductsEvent].
extension ProductsEventPatterns on ProductsEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProductsInitial value)?  initial,TResult Function( ProductsGetList value)?  getList,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProductsInitial() when initial != null:
return initial(_that);case ProductsGetList() when getList != null:
return getList(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProductsInitial value)  initial,required TResult Function( ProductsGetList value)  getList,}){
final _that = this;
switch (_that) {
case ProductsInitial():
return initial(_that);case ProductsGetList():
return getList(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProductsInitial value)?  initial,TResult? Function( ProductsGetList value)?  getList,}){
final _that = this;
switch (_that) {
case ProductsInitial() when initial != null:
return initial(_that);case ProductsGetList() when getList != null:
return getList(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( ListGetType listGetState)?  getList,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProductsInitial() when initial != null:
return initial();case ProductsGetList() when getList != null:
return getList(_that.listGetState);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( ListGetType listGetState)  getList,}) {final _that = this;
switch (_that) {
case ProductsInitial():
return initial();case ProductsGetList():
return getList(_that.listGetState);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( ListGetType listGetState)?  getList,}) {final _that = this;
switch (_that) {
case ProductsInitial() when initial != null:
return initial();case ProductsGetList() when getList != null:
return getList(_that.listGetState);case _:
  return null;

}
}

}

/// @nodoc


class ProductsInitial implements ProductsEvent {
  const ProductsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsEvent.initial()';
}


}




/// @nodoc


class ProductsGetList implements ProductsEvent {
  const ProductsGetList({required this.listGetState});
  

 final  ListGetType listGetState;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsGetListCopyWith<ProductsGetList> get copyWith => _$ProductsGetListCopyWithImpl<ProductsGetList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsGetList&&(identical(other.listGetState, listGetState) || other.listGetState == listGetState));
}


@override
int get hashCode => Object.hash(runtimeType,listGetState);

@override
String toString() {
  return 'ProductsEvent.getList(listGetState: $listGetState)';
}


}

/// @nodoc
abstract mixin class $ProductsGetListCopyWith<$Res> implements $ProductsEventCopyWith<$Res> {
  factory $ProductsGetListCopyWith(ProductsGetList value, $Res Function(ProductsGetList) _then) = _$ProductsGetListCopyWithImpl;
@useResult
$Res call({
 ListGetType listGetState
});




}
/// @nodoc
class _$ProductsGetListCopyWithImpl<$Res>
    implements $ProductsGetListCopyWith<$Res> {
  _$ProductsGetListCopyWithImpl(this._self, this._then);

  final ProductsGetList _self;
  final $Res Function(ProductsGetList) _then;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? listGetState = null,}) {
  return _then(ProductsGetList(
listGetState: null == listGetState ? _self.listGetState : listGetState // ignore: cast_nullable_to_non_nullable
as ListGetType,
  ));
}


}

// dart format on
