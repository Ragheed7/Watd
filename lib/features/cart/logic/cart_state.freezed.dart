// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) itemAdded,
    required TResult Function(T data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(T data) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? itemAdded,
    TResult? Function(T data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(T data)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? itemAdded,
    TResult Function(T data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(T data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(ItemAdded<T> value) itemAdded,
    required TResult Function(ItemRemoved<T> value) itemRemoved,
    required TResult Function(CartItemsFetched<T> value) cartItemsFetched,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(ItemAdded<T> value)? itemAdded,
    TResult? Function(ItemRemoved<T> value)? itemRemoved,
    TResult? Function(CartItemsFetched<T> value)? cartItemsFetched,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(ItemAdded<T> value)? itemAdded,
    TResult Function(ItemRemoved<T> value)? itemRemoved,
    TResult Function(CartItemsFetched<T> value)? cartItemsFetched,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<T, $Res> {
  factory $CartStateCopyWith(
          CartState<T> value, $Res Function(CartState<T>) then) =
      _$CartStateCopyWithImpl<T, $Res, CartState<T>>;
}

/// @nodoc
class _$CartStateCopyWithImpl<T, $Res, $Val extends CartState<T>>
    implements $CartStateCopyWith<T, $Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$CartStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CartState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) itemAdded,
    required TResult Function(T data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(T data) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? itemAdded,
    TResult? Function(T data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(T data)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? itemAdded,
    TResult Function(T data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(T data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(ItemAdded<T> value) itemAdded,
    required TResult Function(ItemRemoved<T> value) itemRemoved,
    required TResult Function(CartItemsFetched<T> value) cartItemsFetched,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(ItemAdded<T> value)? itemAdded,
    TResult? Function(ItemRemoved<T> value)? itemRemoved,
    TResult? Function(CartItemsFetched<T> value)? cartItemsFetched,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(ItemAdded<T> value)? itemAdded,
    TResult Function(ItemRemoved<T> value)? itemRemoved,
    TResult Function(CartItemsFetched<T> value)? cartItemsFetched,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements CartState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<T, $Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl<T> value, $Res Function(_$LoadingImpl<T>) then) =
      __$$LoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<T, $Res>
    extends _$CartStateCopyWithImpl<T, $Res, _$LoadingImpl<T>>
    implements _$$LoadingImplCopyWith<T, $Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl<T> _value, $Res Function(_$LoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl<T> implements Loading<T> {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'CartState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) itemAdded,
    required TResult Function(T data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(T data) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? itemAdded,
    TResult? Function(T data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(T data)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? itemAdded,
    TResult Function(T data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(T data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(ItemAdded<T> value) itemAdded,
    required TResult Function(ItemRemoved<T> value) itemRemoved,
    required TResult Function(CartItemsFetched<T> value) cartItemsFetched,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(ItemAdded<T> value)? itemAdded,
    TResult? Function(ItemRemoved<T> value)? itemRemoved,
    TResult? Function(CartItemsFetched<T> value)? cartItemsFetched,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(ItemAdded<T> value)? itemAdded,
    TResult Function(ItemRemoved<T> value)? itemRemoved,
    TResult Function(CartItemsFetched<T> value)? cartItemsFetched,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements CartState<T> {
  const factory Loading() = _$LoadingImpl<T>;
}

/// @nodoc
abstract class _$$ItemAddedImplCopyWith<T, $Res> {
  factory _$$ItemAddedImplCopyWith(
          _$ItemAddedImpl<T> value, $Res Function(_$ItemAddedImpl<T>) then) =
      __$$ItemAddedImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ItemAddedImplCopyWithImpl<T, $Res>
    extends _$CartStateCopyWithImpl<T, $Res, _$ItemAddedImpl<T>>
    implements _$$ItemAddedImplCopyWith<T, $Res> {
  __$$ItemAddedImplCopyWithImpl(
      _$ItemAddedImpl<T> _value, $Res Function(_$ItemAddedImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ItemAddedImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ItemAddedImpl<T> implements ItemAdded<T> {
  const _$ItemAddedImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'CartState<$T>.itemAdded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemAddedImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemAddedImplCopyWith<T, _$ItemAddedImpl<T>> get copyWith =>
      __$$ItemAddedImplCopyWithImpl<T, _$ItemAddedImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) itemAdded,
    required TResult Function(T data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(T data) success,
    required TResult Function(String error) error,
  }) {
    return itemAdded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? itemAdded,
    TResult? Function(T data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(T data)? success,
    TResult? Function(String error)? error,
  }) {
    return itemAdded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? itemAdded,
    TResult Function(T data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(T data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (itemAdded != null) {
      return itemAdded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(ItemAdded<T> value) itemAdded,
    required TResult Function(ItemRemoved<T> value) itemRemoved,
    required TResult Function(CartItemsFetched<T> value) cartItemsFetched,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
  }) {
    return itemAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(ItemAdded<T> value)? itemAdded,
    TResult? Function(ItemRemoved<T> value)? itemRemoved,
    TResult? Function(CartItemsFetched<T> value)? cartItemsFetched,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
  }) {
    return itemAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(ItemAdded<T> value)? itemAdded,
    TResult Function(ItemRemoved<T> value)? itemRemoved,
    TResult Function(CartItemsFetched<T> value)? cartItemsFetched,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (itemAdded != null) {
      return itemAdded(this);
    }
    return orElse();
  }
}

abstract class ItemAdded<T> implements CartState<T> {
  const factory ItemAdded(final T data) = _$ItemAddedImpl<T>;

  T get data;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemAddedImplCopyWith<T, _$ItemAddedImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ItemRemovedImplCopyWith<T, $Res> {
  factory _$$ItemRemovedImplCopyWith(_$ItemRemovedImpl<T> value,
          $Res Function(_$ItemRemovedImpl<T>) then) =
      __$$ItemRemovedImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ItemRemovedImplCopyWithImpl<T, $Res>
    extends _$CartStateCopyWithImpl<T, $Res, _$ItemRemovedImpl<T>>
    implements _$$ItemRemovedImplCopyWith<T, $Res> {
  __$$ItemRemovedImplCopyWithImpl(
      _$ItemRemovedImpl<T> _value, $Res Function(_$ItemRemovedImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ItemRemovedImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ItemRemovedImpl<T> implements ItemRemoved<T> {
  const _$ItemRemovedImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'CartState<$T>.itemRemoved(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemRemovedImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemRemovedImplCopyWith<T, _$ItemRemovedImpl<T>> get copyWith =>
      __$$ItemRemovedImplCopyWithImpl<T, _$ItemRemovedImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) itemAdded,
    required TResult Function(T data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(T data) success,
    required TResult Function(String error) error,
  }) {
    return itemRemoved(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? itemAdded,
    TResult? Function(T data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(T data)? success,
    TResult? Function(String error)? error,
  }) {
    return itemRemoved?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? itemAdded,
    TResult Function(T data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(T data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (itemRemoved != null) {
      return itemRemoved(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(ItemAdded<T> value) itemAdded,
    required TResult Function(ItemRemoved<T> value) itemRemoved,
    required TResult Function(CartItemsFetched<T> value) cartItemsFetched,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
  }) {
    return itemRemoved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(ItemAdded<T> value)? itemAdded,
    TResult? Function(ItemRemoved<T> value)? itemRemoved,
    TResult? Function(CartItemsFetched<T> value)? cartItemsFetched,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
  }) {
    return itemRemoved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(ItemAdded<T> value)? itemAdded,
    TResult Function(ItemRemoved<T> value)? itemRemoved,
    TResult Function(CartItemsFetched<T> value)? cartItemsFetched,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (itemRemoved != null) {
      return itemRemoved(this);
    }
    return orElse();
  }
}

abstract class ItemRemoved<T> implements CartState<T> {
  const factory ItemRemoved(final T data) = _$ItemRemovedImpl<T>;

  T get data;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemRemovedImplCopyWith<T, _$ItemRemovedImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartItemsFetchedImplCopyWith<T, $Res> {
  factory _$$CartItemsFetchedImplCopyWith(_$CartItemsFetchedImpl<T> value,
          $Res Function(_$CartItemsFetchedImpl<T>) then) =
      __$$CartItemsFetchedImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({GetCartItems data});
}

/// @nodoc
class __$$CartItemsFetchedImplCopyWithImpl<T, $Res>
    extends _$CartStateCopyWithImpl<T, $Res, _$CartItemsFetchedImpl<T>>
    implements _$$CartItemsFetchedImplCopyWith<T, $Res> {
  __$$CartItemsFetchedImplCopyWithImpl(_$CartItemsFetchedImpl<T> _value,
      $Res Function(_$CartItemsFetchedImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$CartItemsFetchedImpl<T>(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GetCartItems,
    ));
  }
}

/// @nodoc

class _$CartItemsFetchedImpl<T> implements CartItemsFetched<T> {
  const _$CartItemsFetchedImpl(this.data);

  @override
  final GetCartItems data;

  @override
  String toString() {
    return 'CartState<$T>.cartItemsFetched(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemsFetchedImpl<T> &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemsFetchedImplCopyWith<T, _$CartItemsFetchedImpl<T>> get copyWith =>
      __$$CartItemsFetchedImplCopyWithImpl<T, _$CartItemsFetchedImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) itemAdded,
    required TResult Function(T data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(T data) success,
    required TResult Function(String error) error,
  }) {
    return cartItemsFetched(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? itemAdded,
    TResult? Function(T data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(T data)? success,
    TResult? Function(String error)? error,
  }) {
    return cartItemsFetched?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? itemAdded,
    TResult Function(T data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(T data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (cartItemsFetched != null) {
      return cartItemsFetched(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(ItemAdded<T> value) itemAdded,
    required TResult Function(ItemRemoved<T> value) itemRemoved,
    required TResult Function(CartItemsFetched<T> value) cartItemsFetched,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
  }) {
    return cartItemsFetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(ItemAdded<T> value)? itemAdded,
    TResult? Function(ItemRemoved<T> value)? itemRemoved,
    TResult? Function(CartItemsFetched<T> value)? cartItemsFetched,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
  }) {
    return cartItemsFetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(ItemAdded<T> value)? itemAdded,
    TResult Function(ItemRemoved<T> value)? itemRemoved,
    TResult Function(CartItemsFetched<T> value)? cartItemsFetched,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (cartItemsFetched != null) {
      return cartItemsFetched(this);
    }
    return orElse();
  }
}

abstract class CartItemsFetched<T> implements CartState<T> {
  const factory CartItemsFetched(final GetCartItems data) =
      _$CartItemsFetchedImpl<T>;

  GetCartItems get data;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemsFetchedImplCopyWith<T, _$CartItemsFetchedImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<T, $Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl<T> value, $Res Function(_$SuccessImpl<T>) then) =
      __$$SuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<T, $Res>
    extends _$CartStateCopyWithImpl<T, $Res, _$SuccessImpl<T>>
    implements _$$SuccessImplCopyWith<T, $Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl<T> _value, $Res Function(_$SuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<T> implements Success<T> {
  const _$SuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'CartState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      __$$SuccessImplCopyWithImpl<T, _$SuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) itemAdded,
    required TResult Function(T data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(T data) success,
    required TResult Function(String error) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? itemAdded,
    TResult? Function(T data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(T data)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? itemAdded,
    TResult Function(T data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(T data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(ItemAdded<T> value) itemAdded,
    required TResult Function(ItemRemoved<T> value) itemRemoved,
    required TResult Function(CartItemsFetched<T> value) cartItemsFetched,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(ItemAdded<T> value)? itemAdded,
    TResult? Function(ItemRemoved<T> value)? itemRemoved,
    TResult? Function(CartItemsFetched<T> value)? cartItemsFetched,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(ItemAdded<T> value)? itemAdded,
    TResult Function(ItemRemoved<T> value)? itemRemoved,
    TResult Function(CartItemsFetched<T> value)? cartItemsFetched,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements CartState<T> {
  const factory Success(final T data) = _$SuccessImpl<T>;

  T get data;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<T, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<T> value, $Res Function(_$ErrorImpl<T>) then) =
      __$$ErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<T, $Res>
    extends _$CartStateCopyWithImpl<T, $Res, _$ErrorImpl<T>>
    implements _$$ErrorImplCopyWith<T, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<T> _value, $Res Function(_$ErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl<T> implements Error<T> {
  const _$ErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'CartState<$T>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      __$$ErrorImplCopyWithImpl<T, _$ErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) itemAdded,
    required TResult Function(T data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(T data) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? itemAdded,
    TResult? Function(T data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(T data)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? itemAdded,
    TResult Function(T data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(T data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(ItemAdded<T> value) itemAdded,
    required TResult Function(ItemRemoved<T> value) itemRemoved,
    required TResult Function(CartItemsFetched<T> value) cartItemsFetched,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(ItemAdded<T> value)? itemAdded,
    TResult? Function(ItemRemoved<T> value)? itemRemoved,
    TResult? Function(CartItemsFetched<T> value)? cartItemsFetched,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(ItemAdded<T> value)? itemAdded,
    TResult Function(ItemRemoved<T> value)? itemRemoved,
    TResult Function(CartItemsFetched<T> value)? cartItemsFetched,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements CartState<T> {
  const factory Error({required final String error}) = _$ErrorImpl<T>;

  String get error;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
