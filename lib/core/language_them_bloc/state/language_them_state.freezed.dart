// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_them_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LanguageThemState {

 LanguageTypes get languageCode; bool get isLoggedIn; ThemeEvent get themeEvent;
/// Create a copy of LanguageThemState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LanguageThemStateCopyWith<LanguageThemState> get copyWith => _$LanguageThemStateCopyWithImpl<LanguageThemState>(this as LanguageThemState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LanguageThemState&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.themeEvent, themeEvent) || other.themeEvent == themeEvent));
}


@override
int get hashCode => Object.hash(runtimeType,languageCode,isLoggedIn,themeEvent);

@override
String toString() {
  return 'LanguageThemState(languageCode: $languageCode, isLoggedIn: $isLoggedIn, themeEvent: $themeEvent)';
}


}

/// @nodoc
abstract mixin class $LanguageThemStateCopyWith<$Res>  {
  factory $LanguageThemStateCopyWith(LanguageThemState value, $Res Function(LanguageThemState) _then) = _$LanguageThemStateCopyWithImpl;
@useResult
$Res call({
 LanguageTypes languageCode, bool isLoggedIn, ThemeEvent themeEvent
});




}
/// @nodoc
class _$LanguageThemStateCopyWithImpl<$Res>
    implements $LanguageThemStateCopyWith<$Res> {
  _$LanguageThemStateCopyWithImpl(this._self, this._then);

  final LanguageThemState _self;
  final $Res Function(LanguageThemState) _then;

/// Create a copy of LanguageThemState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? languageCode = null,Object? isLoggedIn = null,Object? themeEvent = null,}) {
  return _then(_self.copyWith(
languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as LanguageTypes,isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,themeEvent: null == themeEvent ? _self.themeEvent : themeEvent // ignore: cast_nullable_to_non_nullable
as ThemeEvent,
  ));
}

}


/// Adds pattern-matching-related methods to [LanguageThemState].
extension LanguageThemStatePatterns on LanguageThemState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LanguageThemState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LanguageThemState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LanguageThemState value)  $default,){
final _that = this;
switch (_that) {
case _LanguageThemState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LanguageThemState value)?  $default,){
final _that = this;
switch (_that) {
case _LanguageThemState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LanguageTypes languageCode,  bool isLoggedIn,  ThemeEvent themeEvent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LanguageThemState() when $default != null:
return $default(_that.languageCode,_that.isLoggedIn,_that.themeEvent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LanguageTypes languageCode,  bool isLoggedIn,  ThemeEvent themeEvent)  $default,) {final _that = this;
switch (_that) {
case _LanguageThemState():
return $default(_that.languageCode,_that.isLoggedIn,_that.themeEvent);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LanguageTypes languageCode,  bool isLoggedIn,  ThemeEvent themeEvent)?  $default,) {final _that = this;
switch (_that) {
case _LanguageThemState() when $default != null:
return $default(_that.languageCode,_that.isLoggedIn,_that.themeEvent);case _:
  return null;

}
}

}

/// @nodoc


class _LanguageThemState implements LanguageThemState {
  const _LanguageThemState({this.languageCode = LanguageTypes.en, this.isLoggedIn = false, this.themeEvent = ThemeEvent.toggleDark});
  

@override@JsonKey() final  LanguageTypes languageCode;
@override@JsonKey() final  bool isLoggedIn;
@override@JsonKey() final  ThemeEvent themeEvent;

/// Create a copy of LanguageThemState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LanguageThemStateCopyWith<_LanguageThemState> get copyWith => __$LanguageThemStateCopyWithImpl<_LanguageThemState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LanguageThemState&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.themeEvent, themeEvent) || other.themeEvent == themeEvent));
}


@override
int get hashCode => Object.hash(runtimeType,languageCode,isLoggedIn,themeEvent);

@override
String toString() {
  return 'LanguageThemState(languageCode: $languageCode, isLoggedIn: $isLoggedIn, themeEvent: $themeEvent)';
}


}

/// @nodoc
abstract mixin class _$LanguageThemStateCopyWith<$Res> implements $LanguageThemStateCopyWith<$Res> {
  factory _$LanguageThemStateCopyWith(_LanguageThemState value, $Res Function(_LanguageThemState) _then) = __$LanguageThemStateCopyWithImpl;
@override @useResult
$Res call({
 LanguageTypes languageCode, bool isLoggedIn, ThemeEvent themeEvent
});




}
/// @nodoc
class __$LanguageThemStateCopyWithImpl<$Res>
    implements _$LanguageThemStateCopyWith<$Res> {
  __$LanguageThemStateCopyWithImpl(this._self, this._then);

  final _LanguageThemState _self;
  final $Res Function(_LanguageThemState) _then;

/// Create a copy of LanguageThemState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? languageCode = null,Object? isLoggedIn = null,Object? themeEvent = null,}) {
  return _then(_LanguageThemState(
languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as LanguageTypes,isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,themeEvent: null == themeEvent ? _self.themeEvent : themeEvent // ignore: cast_nullable_to_non_nullable
as ThemeEvent,
  ));
}


}

// dart format on
