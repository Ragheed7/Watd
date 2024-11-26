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
mixin _$CartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DefaultApiResponse data) itemAdded,
    required TResult Function(DefaultApiResponse data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(DefaultApiResponse data) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DefaultApiResponse data)? itemAdded,
    TResult? Function(DefaultApiResponse data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(DefaultApiResponse data)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DefaultApiResponse data)? itemAdded,
    TResult Function(DefaultApiResponse data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(DefaultApiResponse data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(ItemAdded value) itemAdded,
    required TResult Function(ItemRemoved value) itemRemoved,
    required TResult Function(CartItemsFetched value) cartItemsFetched,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(ItemAdded value)? itemAdded,
    TResult? Function(ItemRemoved value)? itemRemoved,
    TResult? Function(CartItemsFetched value)? cartItemsFetched,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ItemAdded value)? itemAdded,
    TResult Function(ItemRemoved value)? itemRemoved,
    TResult Function(CartItemsFetched value)? cartItemsFetched,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CartState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DefaultApiResponse data) itemAdded,
    required TResult Function(DefaultApiResponse data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(DefaultApiResponse data) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DefaultApiResponse data)? itemAdded,
    TResult? Function(DefaultApiResponse data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(DefaultApiResponse data)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DefaultApiResponse data)? itemAdded,
    TResult Function(DefaultApiResponse data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(DefaultApiResponse data)? success,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(ItemAdded value) itemAdded,
    required TResult Function(ItemRemoved value) itemRemoved,
    required TResult Function(CartItemsFetched value) cartItemsFetched,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(ItemAdded value)? itemAdded,
    TResult? Function(ItemRemoved value)? itemRemoved,
    TResult? Function(CartItemsFetched value)? cartItemsFetched,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ItemAdded value)? itemAdded,
    TResult Function(ItemRemoved value)? itemRemoved,
    TResult Function(CartItemsFetched value)? cartItemsFetched,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CartState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'CartState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DefaultApiResponse data) itemAdded,
    required TResult Function(DefaultApiResponse data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(DefaultApiResponse data) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DefaultApiResponse data)? itemAdded,
    TResult? Function(DefaultApiResponse data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(DefaultApiResponse data)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DefaultApiResponse data)? itemAdded,
    TResult Function(DefaultApiResponse data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(DefaultApiResponse data)? success,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(ItemAdded value) itemAdded,
    required TResult Function(ItemRemoved value) itemRemoved,
    required TResult Function(CartItemsFetched value) cartItemsFetched,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(ItemAdded value)? itemAdded,
    TResult? Function(ItemRemoved value)? itemRemoved,
    TResult? Function(CartItemsFetched value)? cartItemsFetched,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ItemAdded value)? itemAdded,
    TResult Function(ItemRemoved value)? itemRemoved,
    TResult Function(CartItemsFetched value)? cartItemsFetched,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements CartState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ItemAddedImplCopyWith<$Res> {
  factory _$$ItemAddedImplCopyWith(
          _$ItemAddedImpl value, $Res Function(_$ItemAddedImpl) then) =
      __$$ItemAddedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DefaultApiResponse data});
}

/// @nodoc
class __$$ItemAddedImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$ItemAddedImpl>
    implements _$$ItemAddedImplCopyWith<$Res> {
  __$$ItemAddedImplCopyWithImpl(
      _$ItemAddedImpl _value, $Res Function(_$ItemAddedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ItemAddedImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DefaultApiResponse,
    ));
  }
}

/// @nodoc

class _$ItemAddedImpl implements ItemAdded {
  const _$ItemAddedImpl(this.data);

  @override
  final DefaultApiResponse data;

  @override
  String toString() {
    return 'CartState.itemAdded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemAddedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemAddedImplCopyWith<_$ItemAddedImpl> get copyWith =>
      __$$ItemAddedImplCopyWithImpl<_$ItemAddedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DefaultApiResponse data) itemAdded,
    required TResult Function(DefaultApiResponse data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(DefaultApiResponse data) success,
    required TResult Function(String error) error,
  }) {
    return itemAdded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DefaultApiResponse data)? itemAdded,
    TResult? Function(DefaultApiResponse data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(DefaultApiResponse data)? success,
    TResult? Function(String error)? error,
  }) {
    return itemAdded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DefaultApiResponse data)? itemAdded,
    TResult Function(DefaultApiResponse data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(DefaultApiResponse data)? success,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(ItemAdded value) itemAdded,
    required TResult Function(ItemRemoved value) itemRemoved,
    required TResult Function(CartItemsFetched value) cartItemsFetched,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return itemAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(ItemAdded value)? itemAdded,
    TResult? Function(ItemRemoved value)? itemRemoved,
    TResult? Function(CartItemsFetched value)? cartItemsFetched,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return itemAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ItemAdded value)? itemAdded,
    TResult Function(ItemRemoved value)? itemRemoved,
    TResult Function(CartItemsFetched value)? cartItemsFetched,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (itemAdded != null) {
      return itemAdded(this);
    }
    return orElse();
  }
}

abstract class ItemAdded implements CartState {
  const factory ItemAdded(final DefaultApiResponse data) = _$ItemAddedImpl;

  DefaultApiResponse get data;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemAddedImplCopyWith<_$ItemAddedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ItemRemovedImplCopyWith<$Res> {
  factory _$$ItemRemovedImplCopyWith(
          _$ItemRemovedImpl value, $Res Function(_$ItemRemovedImpl) then) =
      __$$ItemRemovedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DefaultApiResponse data});
}

/// @nodoc
class __$$ItemRemovedImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$ItemRemovedImpl>
    implements _$$ItemRemovedImplCopyWith<$Res> {
  __$$ItemRemovedImplCopyWithImpl(
      _$ItemRemovedImpl _value, $Res Function(_$ItemRemovedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ItemRemovedImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DefaultApiResponse,
    ));
  }
}

/// @nodoc

class _$ItemRemovedImpl implements ItemRemoved {
  const _$ItemRemovedImpl(this.data);

  @override
  final DefaultApiResponse data;

  @override
  String toString() {
    return 'CartState.itemRemoved(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemRemovedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemRemovedImplCopyWith<_$ItemRemovedImpl> get copyWith =>
      __$$ItemRemovedImplCopyWithImpl<_$ItemRemovedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DefaultApiResponse data) itemAdded,
    required TResult Function(DefaultApiResponse data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(DefaultApiResponse data) success,
    required TResult Function(String error) error,
  }) {
    return itemRemoved(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DefaultApiResponse data)? itemAdded,
    TResult? Function(DefaultApiResponse data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(DefaultApiResponse data)? success,
    TResult? Function(String error)? error,
  }) {
    return itemRemoved?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DefaultApiResponse data)? itemAdded,
    TResult Function(DefaultApiResponse data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(DefaultApiResponse data)? success,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(ItemAdded value) itemAdded,
    required TResult Function(ItemRemoved value) itemRemoved,
    required TResult Function(CartItemsFetched value) cartItemsFetched,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return itemRemoved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(ItemAdded value)? itemAdded,
    TResult? Function(ItemRemoved value)? itemRemoved,
    TResult? Function(CartItemsFetched value)? cartItemsFetched,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return itemRemoved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ItemAdded value)? itemAdded,
    TResult Function(ItemRemoved value)? itemRemoved,
    TResult Function(CartItemsFetched value)? cartItemsFetched,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (itemRemoved != null) {
      return itemRemoved(this);
    }
    return orElse();
  }
}

abstract class ItemRemoved implements CartState {
  const factory ItemRemoved(final DefaultApiResponse data) = _$ItemRemovedImpl;

  DefaultApiResponse get data;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemRemovedImplCopyWith<_$ItemRemovedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartItemsFetchedImplCopyWith<$Res> {
  factory _$$CartItemsFetchedImplCopyWith(_$CartItemsFetchedImpl value,
          $Res Function(_$CartItemsFetchedImpl) then) =
      __$$CartItemsFetchedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GetCartItems data});
}

/// @nodoc
class __$$CartItemsFetchedImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartItemsFetchedImpl>
    implements _$$CartItemsFetchedImplCopyWith<$Res> {
  __$$CartItemsFetchedImplCopyWithImpl(_$CartItemsFetchedImpl _value,
      $Res Function(_$CartItemsFetchedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$CartItemsFetchedImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GetCartItems,
    ));
  }
}

/// @nodoc

class _$CartItemsFetchedImpl implements CartItemsFetched {
  const _$CartItemsFetchedImpl(this.data);

  @override
  final GetCartItems data;

  @override
  String toString() {
    return 'CartState.cartItemsFetched(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemsFetchedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemsFetchedImplCopyWith<_$CartItemsFetchedImpl> get copyWith =>
      __$$CartItemsFetchedImplCopyWithImpl<_$CartItemsFetchedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DefaultApiResponse data) itemAdded,
    required TResult Function(DefaultApiResponse data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(DefaultApiResponse data) success,
    required TResult Function(String error) error,
  }) {
    return cartItemsFetched(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DefaultApiResponse data)? itemAdded,
    TResult? Function(DefaultApiResponse data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(DefaultApiResponse data)? success,
    TResult? Function(String error)? error,
  }) {
    return cartItemsFetched?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DefaultApiResponse data)? itemAdded,
    TResult Function(DefaultApiResponse data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(DefaultApiResponse data)? success,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(ItemAdded value) itemAdded,
    required TResult Function(ItemRemoved value) itemRemoved,
    required TResult Function(CartItemsFetched value) cartItemsFetched,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return cartItemsFetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(ItemAdded value)? itemAdded,
    TResult? Function(ItemRemoved value)? itemRemoved,
    TResult? Function(CartItemsFetched value)? cartItemsFetched,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return cartItemsFetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ItemAdded value)? itemAdded,
    TResult Function(ItemRemoved value)? itemRemoved,
    TResult Function(CartItemsFetched value)? cartItemsFetched,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (cartItemsFetched != null) {
      return cartItemsFetched(this);
    }
    return orElse();
  }
}

abstract class CartItemsFetched implements CartState {
  const factory CartItemsFetched(final GetCartItems data) =
      _$CartItemsFetchedImpl;

  GetCartItems get data;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemsFetchedImplCopyWith<_$CartItemsFetchedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DefaultApiResponse data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SuccessImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DefaultApiResponse,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl(this.data);

  @override
  final DefaultApiResponse data;

  @override
  String toString() {
    return 'CartState.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DefaultApiResponse data) itemAdded,
    required TResult Function(DefaultApiResponse data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(DefaultApiResponse data) success,
    required TResult Function(String error) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DefaultApiResponse data)? itemAdded,
    TResult? Function(DefaultApiResponse data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(DefaultApiResponse data)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DefaultApiResponse data)? itemAdded,
    TResult Function(DefaultApiResponse data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(DefaultApiResponse data)? success,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(ItemAdded value) itemAdded,
    required TResult Function(ItemRemoved value) itemRemoved,
    required TResult Function(CartItemsFetched value) cartItemsFetched,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(ItemAdded value)? itemAdded,
    TResult? Function(ItemRemoved value)? itemRemoved,
    TResult? Function(CartItemsFetched value)? cartItemsFetched,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ItemAdded value)? itemAdded,
    TResult Function(ItemRemoved value)? itemRemoved,
    TResult Function(CartItemsFetched value)? cartItemsFetched,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements CartState {
  const factory Success(final DefaultApiResponse data) = _$SuccessImpl;

  DefaultApiResponse get data;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'CartState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DefaultApiResponse data) itemAdded,
    required TResult Function(DefaultApiResponse data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(DefaultApiResponse data) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DefaultApiResponse data)? itemAdded,
    TResult? Function(DefaultApiResponse data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(DefaultApiResponse data)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DefaultApiResponse data)? itemAdded,
    TResult Function(DefaultApiResponse data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(DefaultApiResponse data)? success,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(ItemAdded value) itemAdded,
    required TResult Function(ItemRemoved value) itemRemoved,
    required TResult Function(CartItemsFetched value) cartItemsFetched,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(ItemAdded value)? itemAdded,
    TResult? Function(ItemRemoved value)? itemRemoved,
    TResult? Function(CartItemsFetched value)? cartItemsFetched,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ItemAdded value)? itemAdded,
    TResult Function(ItemRemoved value)? itemRemoved,
    TResult Function(CartItemsFetched value)? cartItemsFetched,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements CartState {
  const factory Error({required final String error}) = _$ErrorImpl;

  String get error;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
