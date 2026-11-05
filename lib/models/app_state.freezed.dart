// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppState {

/// List of todo items.
 List<Todo> get todos;/// Whether the dark theme is enabled.
 bool get isDarkMode;/// Whether the user is asked to confirm before deleting a todo.
 bool get askForDeletionConfirmation;
/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateCopyWith<AppState> get copyWith => _$AppStateCopyWithImpl<AppState>(this as AppState, _$identity);

  /// Serializes this AppState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AppState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppState&&const DeepCollectionEquality().equals(other.todos, _this.todos)&&(identical(other.isDarkMode, _this.isDarkMode) || other.isDarkMode == _this.isDarkMode)&&(identical(other.askForDeletionConfirmation, _this.askForDeletionConfirmation) || other.askForDeletionConfirmation == _this.askForDeletionConfirmation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AppState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.todos),_this.isDarkMode,_this.askForDeletionConfirmation);
}

@override
String toString() {
  final _this = this as AppState;
  return 'AppState(todos: ${_this.todos}, isDarkMode: ${_this.isDarkMode}, askForDeletionConfirmation: ${_this.askForDeletionConfirmation})';
}


}

/// @nodoc
abstract mixin class $AppStateCopyWith<$Res>  {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) _then) = _$AppStateCopyWithImpl;
@useResult
$Res call({
 List<Todo> todos, bool isDarkMode, bool askForDeletionConfirmation
});




}
/// @nodoc
class _$AppStateCopyWithImpl<$Res>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._self, this._then);

  final AppState _self;
  final $Res Function(AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? todos = null,Object? isDarkMode = null,Object? askForDeletionConfirmation = null,}) {
  return _then(AppState(
todos: null == todos ? _self.todos : todos // ignore: cast_nullable_to_non_nullable
as List<Todo>,isDarkMode: null == isDarkMode ? _self.isDarkMode : isDarkMode // ignore: cast_nullable_to_non_nullable
as bool,askForDeletionConfirmation: null == askForDeletionConfirmation ? _self.askForDeletionConfirmation : askForDeletionConfirmation // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AppState].
extension AppStatePatterns on AppState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppState value)  $default,){
final _that = this;
switch (_that) {
case _AppState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppState value)?  $default,){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Todo> todos,  bool isDarkMode,  bool askForDeletionConfirmation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.todos,_that.isDarkMode,_that.askForDeletionConfirmation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Todo> todos,  bool isDarkMode,  bool askForDeletionConfirmation)  $default,) {final _that = this;
switch (_that) {
case _AppState():
return $default(_that.todos,_that.isDarkMode,_that.askForDeletionConfirmation);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Todo> todos,  bool isDarkMode,  bool askForDeletionConfirmation)?  $default,) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.todos,_that.isDarkMode,_that.askForDeletionConfirmation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppState implements AppState {
  const _AppState({required  List<Todo> todos, required this.isDarkMode, required this.askForDeletionConfirmation}): _todos = todos;
  factory _AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);

/// List of todo items.
 final  List<Todo> _todos;
/// List of todo items.
@override List<Todo> get todos {
  if (_todos is EqualUnmodifiableListView) return _todos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_todos);
}

/// Whether the dark theme is enabled.
@override final  bool isDarkMode;
/// Whether the user is asked to confirm before deleting a todo.
@override final  bool askForDeletionConfirmation;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppStateCopyWith<_AppState> get copyWith => __$AppStateCopyWithImpl<_AppState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppStateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppState&&const DeepCollectionEquality().equals(other.todos, _todos)&&(identical(other.isDarkMode, isDarkMode) || other.isDarkMode == isDarkMode)&&(identical(other.askForDeletionConfirmation, askForDeletionConfirmation) || other.askForDeletionConfirmation == askForDeletionConfirmation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_todos),isDarkMode,askForDeletionConfirmation);
}

@override
String toString() {
    return 'AppState(todos: $todos, isDarkMode: $isDarkMode, askForDeletionConfirmation: $askForDeletionConfirmation)';
}


}

/// @nodoc
abstract mixin class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) _then) = __$AppStateCopyWithImpl;
@override @useResult
$Res call({
 List<Todo> todos, bool isDarkMode, bool askForDeletionConfirmation
});




}
/// @nodoc
class __$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(this._self, this._then);

  final _AppState _self;
  final $Res Function(_AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? todos = null,Object? isDarkMode = null,Object? askForDeletionConfirmation = null,}) {
  return _then(_AppState(
todos: null == todos ? _self._todos : todos // ignore: cast_nullable_to_non_nullable
as List<Todo>,isDarkMode: null == isDarkMode ? _self.isDarkMode : isDarkMode // ignore: cast_nullable_to_non_nullable
as bool,askForDeletionConfirmation: null == askForDeletionConfirmation ? _self.askForDeletionConfirmation : askForDeletionConfirmation // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
