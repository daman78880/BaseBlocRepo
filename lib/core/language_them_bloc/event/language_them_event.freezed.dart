// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_them_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LanguageThemEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LanguageThemEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LanguageThemEvent()';
}


}

/// @nodoc
class $LanguageThemEventCopyWith<$Res>  {
$LanguageThemEventCopyWith(LanguageThemEvent _, $Res Function(LanguageThemEvent) __);
}


/// Adds pattern-matching-related methods to [LanguageThemEvent].
extension LanguageThemEventPatterns on LanguageThemEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialEvent value)?  initial,TResult Function( ChangeLanguage value)?  onChangeLanguage,TResult Function( IsLoggedInStatusChanged value)?  isLoggedInStatusChanged,TResult Function( IsThemStatusChanged value)?  isThemStatusChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialEvent() when initial != null:
return initial(_that);case ChangeLanguage() when onChangeLanguage != null:
return onChangeLanguage(_that);case IsLoggedInStatusChanged() when isLoggedInStatusChanged != null:
return isLoggedInStatusChanged(_that);case IsThemStatusChanged() when isThemStatusChanged != null:
return isThemStatusChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialEvent value)  initial,required TResult Function( ChangeLanguage value)  onChangeLanguage,required TResult Function( IsLoggedInStatusChanged value)  isLoggedInStatusChanged,required TResult Function( IsThemStatusChanged value)  isThemStatusChanged,}){
final _that = this;
switch (_that) {
case InitialEvent():
return initial(_that);case ChangeLanguage():
return onChangeLanguage(_that);case IsLoggedInStatusChanged():
return isLoggedInStatusChanged(_that);case IsThemStatusChanged():
return isThemStatusChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialEvent value)?  initial,TResult? Function( ChangeLanguage value)?  onChangeLanguage,TResult? Function( IsLoggedInStatusChanged value)?  isLoggedInStatusChanged,TResult? Function( IsThemStatusChanged value)?  isThemStatusChanged,}){
final _that = this;
switch (_that) {
case InitialEvent() when initial != null:
return initial(_that);case ChangeLanguage() when onChangeLanguage != null:
return onChangeLanguage(_that);case IsLoggedInStatusChanged() when isLoggedInStatusChanged != null:
return isLoggedInStatusChanged(_that);case IsThemStatusChanged() when isThemStatusChanged != null:
return isThemStatusChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( LanguageTypes languageType,  ThemeEvent isThemChange)?  initial,TResult Function( LanguageTypes languageType)?  onChangeLanguage,TResult Function( bool isLoggedIn)?  isLoggedInStatusChanged,TResult Function( bool isThemChange)?  isThemStatusChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialEvent() when initial != null:
return initial(_that.languageType,_that.isThemChange);case ChangeLanguage() when onChangeLanguage != null:
return onChangeLanguage(_that.languageType);case IsLoggedInStatusChanged() when isLoggedInStatusChanged != null:
return isLoggedInStatusChanged(_that.isLoggedIn);case IsThemStatusChanged() when isThemStatusChanged != null:
return isThemStatusChanged(_that.isThemChange);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( LanguageTypes languageType,  ThemeEvent isThemChange)  initial,required TResult Function( LanguageTypes languageType)  onChangeLanguage,required TResult Function( bool isLoggedIn)  isLoggedInStatusChanged,required TResult Function( bool isThemChange)  isThemStatusChanged,}) {final _that = this;
switch (_that) {
case InitialEvent():
return initial(_that.languageType,_that.isThemChange);case ChangeLanguage():
return onChangeLanguage(_that.languageType);case IsLoggedInStatusChanged():
return isLoggedInStatusChanged(_that.isLoggedIn);case IsThemStatusChanged():
return isThemStatusChanged(_that.isThemChange);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( LanguageTypes languageType,  ThemeEvent isThemChange)?  initial,TResult? Function( LanguageTypes languageType)?  onChangeLanguage,TResult? Function( bool isLoggedIn)?  isLoggedInStatusChanged,TResult? Function( bool isThemChange)?  isThemStatusChanged,}) {final _that = this;
switch (_that) {
case InitialEvent() when initial != null:
return initial(_that.languageType,_that.isThemChange);case ChangeLanguage() when onChangeLanguage != null:
return onChangeLanguage(_that.languageType);case IsLoggedInStatusChanged() when isLoggedInStatusChanged != null:
return isLoggedInStatusChanged(_that.isLoggedIn);case IsThemStatusChanged() when isThemStatusChanged != null:
return isThemStatusChanged(_that.isThemChange);case _:
  return null;

}
}

}

/// @nodoc


class InitialEvent implements LanguageThemEvent {
  const InitialEvent(this.languageType, this.isThemChange);
  

 final  LanguageTypes languageType;
 final  ThemeEvent isThemChange;

/// Create a copy of LanguageThemEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialEventCopyWith<InitialEvent> get copyWith => _$InitialEventCopyWithImpl<InitialEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialEvent&&(identical(other.languageType, languageType) || other.languageType == languageType)&&(identical(other.isThemChange, isThemChange) || other.isThemChange == isThemChange));
}


@override
int get hashCode => Object.hash(runtimeType,languageType,isThemChange);

@override
String toString() {
  return 'LanguageThemEvent.initial(languageType: $languageType, isThemChange: $isThemChange)';
}


}

/// @nodoc
abstract mixin class $InitialEventCopyWith<$Res> implements $LanguageThemEventCopyWith<$Res> {
  factory $InitialEventCopyWith(InitialEvent value, $Res Function(InitialEvent) _then) = _$InitialEventCopyWithImpl;
@useResult
$Res call({
 LanguageTypes languageType, ThemeEvent isThemChange
});




}
/// @nodoc
class _$InitialEventCopyWithImpl<$Res>
    implements $InitialEventCopyWith<$Res> {
  _$InitialEventCopyWithImpl(this._self, this._then);

  final InitialEvent _self;
  final $Res Function(InitialEvent) _then;

/// Create a copy of LanguageThemEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? languageType = null,Object? isThemChange = null,}) {
  return _then(InitialEvent(
null == languageType ? _self.languageType : languageType // ignore: cast_nullable_to_non_nullable
as LanguageTypes,null == isThemChange ? _self.isThemChange : isThemChange // ignore: cast_nullable_to_non_nullable
as ThemeEvent,
  ));
}


}

/// @nodoc


class ChangeLanguage implements LanguageThemEvent {
  const ChangeLanguage(this.languageType);
  

 final  LanguageTypes languageType;

/// Create a copy of LanguageThemEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeLanguageCopyWith<ChangeLanguage> get copyWith => _$ChangeLanguageCopyWithImpl<ChangeLanguage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeLanguage&&(identical(other.languageType, languageType) || other.languageType == languageType));
}


@override
int get hashCode => Object.hash(runtimeType,languageType);

@override
String toString() {
  return 'LanguageThemEvent.onChangeLanguage(languageType: $languageType)';
}


}

/// @nodoc
abstract mixin class $ChangeLanguageCopyWith<$Res> implements $LanguageThemEventCopyWith<$Res> {
  factory $ChangeLanguageCopyWith(ChangeLanguage value, $Res Function(ChangeLanguage) _then) = _$ChangeLanguageCopyWithImpl;
@useResult
$Res call({
 LanguageTypes languageType
});




}
/// @nodoc
class _$ChangeLanguageCopyWithImpl<$Res>
    implements $ChangeLanguageCopyWith<$Res> {
  _$ChangeLanguageCopyWithImpl(this._self, this._then);

  final ChangeLanguage _self;
  final $Res Function(ChangeLanguage) _then;

/// Create a copy of LanguageThemEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? languageType = null,}) {
  return _then(ChangeLanguage(
null == languageType ? _self.languageType : languageType // ignore: cast_nullable_to_non_nullable
as LanguageTypes,
  ));
}


}

/// @nodoc


class IsLoggedInStatusChanged implements LanguageThemEvent {
  const IsLoggedInStatusChanged(this.isLoggedIn);
  

 final  bool isLoggedIn;

/// Create a copy of LanguageThemEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IsLoggedInStatusChangedCopyWith<IsLoggedInStatusChanged> get copyWith => _$IsLoggedInStatusChangedCopyWithImpl<IsLoggedInStatusChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IsLoggedInStatusChanged&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn));
}


@override
int get hashCode => Object.hash(runtimeType,isLoggedIn);

@override
String toString() {
  return 'LanguageThemEvent.isLoggedInStatusChanged(isLoggedIn: $isLoggedIn)';
}


}

/// @nodoc
abstract mixin class $IsLoggedInStatusChangedCopyWith<$Res> implements $LanguageThemEventCopyWith<$Res> {
  factory $IsLoggedInStatusChangedCopyWith(IsLoggedInStatusChanged value, $Res Function(IsLoggedInStatusChanged) _then) = _$IsLoggedInStatusChangedCopyWithImpl;
@useResult
$Res call({
 bool isLoggedIn
});




}
/// @nodoc
class _$IsLoggedInStatusChangedCopyWithImpl<$Res>
    implements $IsLoggedInStatusChangedCopyWith<$Res> {
  _$IsLoggedInStatusChangedCopyWithImpl(this._self, this._then);

  final IsLoggedInStatusChanged _self;
  final $Res Function(IsLoggedInStatusChanged) _then;

/// Create a copy of LanguageThemEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isLoggedIn = null,}) {
  return _then(IsLoggedInStatusChanged(
null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class IsThemStatusChanged implements LanguageThemEvent {
  const IsThemStatusChanged(this.isThemChange);
  

 final  bool isThemChange;

/// Create a copy of LanguageThemEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IsThemStatusChangedCopyWith<IsThemStatusChanged> get copyWith => _$IsThemStatusChangedCopyWithImpl<IsThemStatusChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IsThemStatusChanged&&(identical(other.isThemChange, isThemChange) || other.isThemChange == isThemChange));
}


@override
int get hashCode => Object.hash(runtimeType,isThemChange);

@override
String toString() {
  return 'LanguageThemEvent.isThemStatusChanged(isThemChange: $isThemChange)';
}


}

/// @nodoc
abstract mixin class $IsThemStatusChangedCopyWith<$Res> implements $LanguageThemEventCopyWith<$Res> {
  factory $IsThemStatusChangedCopyWith(IsThemStatusChanged value, $Res Function(IsThemStatusChanged) _then) = _$IsThemStatusChangedCopyWithImpl;
@useResult
$Res call({
 bool isThemChange
});




}
/// @nodoc
class _$IsThemStatusChangedCopyWithImpl<$Res>
    implements $IsThemStatusChangedCopyWith<$Res> {
  _$IsThemStatusChangedCopyWithImpl(this._self, this._then);

  final IsThemStatusChanged _self;
  final $Res Function(IsThemStatusChanged) _then;

/// Create a copy of LanguageThemEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isThemChange = null,}) {
  return _then(IsThemStatusChanged(
null == isThemChange ? _self.isThemChange : isThemChange // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
