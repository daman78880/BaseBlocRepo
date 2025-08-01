// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsState()';
}


}

/// @nodoc
class $ProductsStateCopyWith<$Res>  {
$ProductsStateCopyWith(ProductsState _, $Res Function(ProductsState) __);
}


/// Adds pattern-matching-related methods to [ProductsState].
extension ProductsStatePatterns on ProductsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProductsInitial value)?  initial,TResult Function( ProductsLoading value)?  loading,TResult Function( ProductsLoadingMore value)?  loadingMore,TResult Function( ProductsSuccess value)?  success,TResult Function( ProductsFailure value)?  failure,TResult Function( ProductsProductDetail value)?  productDetail,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProductsInitial() when initial != null:
return initial(_that);case ProductsLoading() when loading != null:
return loading(_that);case ProductsLoadingMore() when loadingMore != null:
return loadingMore(_that);case ProductsSuccess() when success != null:
return success(_that);case ProductsFailure() when failure != null:
return failure(_that);case ProductsProductDetail() when productDetail != null:
return productDetail(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProductsInitial value)  initial,required TResult Function( ProductsLoading value)  loading,required TResult Function( ProductsLoadingMore value)  loadingMore,required TResult Function( ProductsSuccess value)  success,required TResult Function( ProductsFailure value)  failure,required TResult Function( ProductsProductDetail value)  productDetail,}){
final _that = this;
switch (_that) {
case ProductsInitial():
return initial(_that);case ProductsLoading():
return loading(_that);case ProductsLoadingMore():
return loadingMore(_that);case ProductsSuccess():
return success(_that);case ProductsFailure():
return failure(_that);case ProductsProductDetail():
return productDetail(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProductsInitial value)?  initial,TResult? Function( ProductsLoading value)?  loading,TResult? Function( ProductsLoadingMore value)?  loadingMore,TResult? Function( ProductsSuccess value)?  success,TResult? Function( ProductsFailure value)?  failure,TResult? Function( ProductsProductDetail value)?  productDetail,}){
final _that = this;
switch (_that) {
case ProductsInitial() when initial != null:
return initial(_that);case ProductsLoading() when loading != null:
return loading(_that);case ProductsLoadingMore() when loadingMore != null:
return loadingMore(_that);case ProductsSuccess() when success != null:
return success(_that);case ProductsFailure() when failure != null:
return failure(_that);case ProductsProductDetail() when productDetail != null:
return productDetail(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( bool isLoading)?  loading,TResult Function( bool isLoadingMore)?  loadingMore,TResult Function( List<ProductListLocal> products,  ListGetType listGetState,  bool maxReached)?  success,TResult Function( String error)?  failure,TResult Function( ProductListLocal product)?  productDetail,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProductsInitial() when initial != null:
return initial();case ProductsLoading() when loading != null:
return loading(_that.isLoading);case ProductsLoadingMore() when loadingMore != null:
return loadingMore(_that.isLoadingMore);case ProductsSuccess() when success != null:
return success(_that.products,_that.listGetState,_that.maxReached);case ProductsFailure() when failure != null:
return failure(_that.error);case ProductsProductDetail() when productDetail != null:
return productDetail(_that.product);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( bool isLoading)  loading,required TResult Function( bool isLoadingMore)  loadingMore,required TResult Function( List<ProductListLocal> products,  ListGetType listGetState,  bool maxReached)  success,required TResult Function( String error)  failure,required TResult Function( ProductListLocal product)  productDetail,}) {final _that = this;
switch (_that) {
case ProductsInitial():
return initial();case ProductsLoading():
return loading(_that.isLoading);case ProductsLoadingMore():
return loadingMore(_that.isLoadingMore);case ProductsSuccess():
return success(_that.products,_that.listGetState,_that.maxReached);case ProductsFailure():
return failure(_that.error);case ProductsProductDetail():
return productDetail(_that.product);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( bool isLoading)?  loading,TResult? Function( bool isLoadingMore)?  loadingMore,TResult? Function( List<ProductListLocal> products,  ListGetType listGetState,  bool maxReached)?  success,TResult? Function( String error)?  failure,TResult? Function( ProductListLocal product)?  productDetail,}) {final _that = this;
switch (_that) {
case ProductsInitial() when initial != null:
return initial();case ProductsLoading() when loading != null:
return loading(_that.isLoading);case ProductsLoadingMore() when loadingMore != null:
return loadingMore(_that.isLoadingMore);case ProductsSuccess() when success != null:
return success(_that.products,_that.listGetState,_that.maxReached);case ProductsFailure() when failure != null:
return failure(_that.error);case ProductsProductDetail() when productDetail != null:
return productDetail(_that.product);case _:
  return null;

}
}

}

/// @nodoc


class ProductsInitial implements ProductsState {
  const ProductsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsState.initial()';
}


}




/// @nodoc


class ProductsLoading implements ProductsState {
  const ProductsLoading({required this.isLoading});
  

 final  bool isLoading;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsLoadingCopyWith<ProductsLoading> get copyWith => _$ProductsLoadingCopyWithImpl<ProductsLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsLoading&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading);

@override
String toString() {
  return 'ProductsState.loading(isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $ProductsLoadingCopyWith<$Res> implements $ProductsStateCopyWith<$Res> {
  factory $ProductsLoadingCopyWith(ProductsLoading value, $Res Function(ProductsLoading) _then) = _$ProductsLoadingCopyWithImpl;
@useResult
$Res call({
 bool isLoading
});




}
/// @nodoc
class _$ProductsLoadingCopyWithImpl<$Res>
    implements $ProductsLoadingCopyWith<$Res> {
  _$ProductsLoadingCopyWithImpl(this._self, this._then);

  final ProductsLoading _self;
  final $Res Function(ProductsLoading) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isLoading = null,}) {
  return _then(ProductsLoading(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ProductsLoadingMore implements ProductsState {
  const ProductsLoadingMore({required this.isLoadingMore});
  

 final  bool isLoadingMore;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsLoadingMoreCopyWith<ProductsLoadingMore> get copyWith => _$ProductsLoadingMoreCopyWithImpl<ProductsLoadingMore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsLoadingMore&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,isLoadingMore);

@override
String toString() {
  return 'ProductsState.loadingMore(isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $ProductsLoadingMoreCopyWith<$Res> implements $ProductsStateCopyWith<$Res> {
  factory $ProductsLoadingMoreCopyWith(ProductsLoadingMore value, $Res Function(ProductsLoadingMore) _then) = _$ProductsLoadingMoreCopyWithImpl;
@useResult
$Res call({
 bool isLoadingMore
});




}
/// @nodoc
class _$ProductsLoadingMoreCopyWithImpl<$Res>
    implements $ProductsLoadingMoreCopyWith<$Res> {
  _$ProductsLoadingMoreCopyWithImpl(this._self, this._then);

  final ProductsLoadingMore _self;
  final $Res Function(ProductsLoadingMore) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isLoadingMore = null,}) {
  return _then(ProductsLoadingMore(
isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ProductsSuccess implements ProductsState {
  const ProductsSuccess({required final  List<ProductListLocal> products, required this.listGetState, required this.maxReached}): _products = products;
  

 final  List<ProductListLocal> _products;
 List<ProductListLocal> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

 final  ListGetType listGetState;
 final  bool maxReached;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsSuccessCopyWith<ProductsSuccess> get copyWith => _$ProductsSuccessCopyWithImpl<ProductsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsSuccess&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.listGetState, listGetState) || other.listGetState == listGetState)&&(identical(other.maxReached, maxReached) || other.maxReached == maxReached));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),listGetState,maxReached);

@override
String toString() {
  return 'ProductsState.success(products: $products, listGetState: $listGetState, maxReached: $maxReached)';
}


}

/// @nodoc
abstract mixin class $ProductsSuccessCopyWith<$Res> implements $ProductsStateCopyWith<$Res> {
  factory $ProductsSuccessCopyWith(ProductsSuccess value, $Res Function(ProductsSuccess) _then) = _$ProductsSuccessCopyWithImpl;
@useResult
$Res call({
 List<ProductListLocal> products, ListGetType listGetState, bool maxReached
});




}
/// @nodoc
class _$ProductsSuccessCopyWithImpl<$Res>
    implements $ProductsSuccessCopyWith<$Res> {
  _$ProductsSuccessCopyWithImpl(this._self, this._then);

  final ProductsSuccess _self;
  final $Res Function(ProductsSuccess) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,Object? listGetState = null,Object? maxReached = null,}) {
  return _then(ProductsSuccess(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductListLocal>,listGetState: null == listGetState ? _self.listGetState : listGetState // ignore: cast_nullable_to_non_nullable
as ListGetType,maxReached: null == maxReached ? _self.maxReached : maxReached // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ProductsFailure implements ProductsState {
  const ProductsFailure({required this.error});
  

 final  String error;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsFailureCopyWith<ProductsFailure> get copyWith => _$ProductsFailureCopyWithImpl<ProductsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ProductsState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $ProductsFailureCopyWith<$Res> implements $ProductsStateCopyWith<$Res> {
  factory $ProductsFailureCopyWith(ProductsFailure value, $Res Function(ProductsFailure) _then) = _$ProductsFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ProductsFailureCopyWithImpl<$Res>
    implements $ProductsFailureCopyWith<$Res> {
  _$ProductsFailureCopyWithImpl(this._self, this._then);

  final ProductsFailure _self;
  final $Res Function(ProductsFailure) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ProductsFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProductsProductDetail implements ProductsState {
  const ProductsProductDetail({required this.product});
  

 final  ProductListLocal product;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsProductDetailCopyWith<ProductsProductDetail> get copyWith => _$ProductsProductDetailCopyWithImpl<ProductsProductDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsProductDetail&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'ProductsState.productDetail(product: $product)';
}


}

/// @nodoc
abstract mixin class $ProductsProductDetailCopyWith<$Res> implements $ProductsStateCopyWith<$Res> {
  factory $ProductsProductDetailCopyWith(ProductsProductDetail value, $Res Function(ProductsProductDetail) _then) = _$ProductsProductDetailCopyWithImpl;
@useResult
$Res call({
 ProductListLocal product
});


$ProductListLocalCopyWith<$Res> get product;

}
/// @nodoc
class _$ProductsProductDetailCopyWithImpl<$Res>
    implements $ProductsProductDetailCopyWith<$Res> {
  _$ProductsProductDetailCopyWithImpl(this._self, this._then);

  final ProductsProductDetail _self;
  final $Res Function(ProductsProductDetail) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(ProductsProductDetail(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductListLocal,
  ));
}

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductListLocalCopyWith<$Res> get product {
  
  return $ProductListLocalCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

// dart format on
