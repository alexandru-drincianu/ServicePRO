import 'package:equatable/equatable.dart';

/// [Void] is used to define an action state where data is not needed.
///
/// Use:
/// ```dart
/// const ActionState.data(Void())
/// ```
class Void {
  const Void();
}

/// [successActionState] can be used to simplify the code by returning this variable
/// instead of the whole declaration.
///
/// Instead of:
/// ```dart
/// state = const ActionState.data(Void());
/// ```
///
/// You can write:
/// ```dart
/// state = successActionState;
/// ```
const successActionState = ActionState.data(Void());

/// [ActionState] is a default of [SimpleState] with [Void] for data.
/// It can be used for any type of action.
typedef ActionState = SimpleState<Void>;

/// [SimpleState] is a default of [BaseState] with [String] for error. Can be
/// used to represent any state which uses a String as the error.
typedef SimpleState<T extends Object> = BaseState<T, String>;

/// [BaseState] is the most basic state to use in your providers.
/// It can represent empty, busy, success and failure states and even a mix of them.
class BaseState<T extends Object, U extends Object> extends Equatable {
  const BaseState({
    this.isBusy = false,
    this.hasError = false,
    this.error,
    this.data,
  });

  /// An empty state is the most initial state of an action
  const BaseState.empty() : this();

  /// Busy state means the action is in progress
  const BaseState.busy() : this(isBusy: true);

  /// Success state marks a successful action
  const BaseState.data(T data) : this(data: data);

  /// Failure marks a failed action attempt
  const BaseState.error([U? error])
      : this(
          hasError: true,
          error: error,
        );

  /// True if the action is in progress
  final bool isBusy;

  /// True if the action failed
  final bool hasError;

  /// The error of the action
  final U? error;

  /// The data to display in success state
  final T? data;

  /// Returns true if the state is success
  bool get isSuccess => data != null && !hasError && !isBusy;

  /// Returns true if the state is empty
  bool get isEmpty => data == null && !hasError && !isBusy;

  /// [props] is required by [Equatable] to correctly compare the states.
  @override
  List<Object?> get props => [
        isBusy,
        hasError,
        error,
        data,
      ];

  /// [toString] returns this state as a [String] ready to be printed for debug.
  @override
  String toString() {
    final stateName = isBusy
        ? 'busy'
        : (hasError ? 'failure' : (data != null ? 'success' : 'empty'));
    return '''
    BaseState.$stateName {
      isBusy: $isBusy,
      hasError: $hasError,
      hasData: ${data != null}
      error: $error,
      data: $data,
    }
    ''';
  }

  /// [when] calls the correct function based on the current state. All methods
  /// are required.
  ///
  /// ```dart
  /// final value = state.when(
  ///   empty: () {
  ///     ...
  ///   },
  ///   busy: () {
  ///     ...
  ///   },
  ///   data: (Object data) {
  ///     ...
  ///   },
  ///   error: (Object? error) {
  ///     ...
  ///   },
  /// );
  /// ```
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() busy,
    required TResult Function(T data) data,
    required TResult Function(U? error) error,
  }) {
    if (isBusy) {
      return busy();
    } else if (hasError) {
      return error(this.error);
    } else if (this.data != null) {
      return data(this.data!);
    } else {
      return empty();
    }
  }

  /// [whenOrNull] calls the correct function based on the current state. If the
  /// function is not provided, [Null] is returned instead.
  ///
  /// ```dart
  /// final value = state.whenOrNull(
  ///   data: (Object data) {
  ///     ...
  ///   },
  /// );
  /// ```
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? busy,
    TResult Function(T data)? data,
    TResult Function(U? error)? error,
  }) {
    if (isBusy && busy != null) {
      return busy();
    } else if (hasError && error != null) {
      return error(this.error);
    } else if (this.data != null && data != null) {
      return data(this.data!);
    } else if (empty != null) {
      return empty();
    }
    return null;
  }

  /// [maybeWhen] calls the correct function based on the current state. If the
  /// function is not provided, [orElse] is called instead.
  /// ```dart
  /// final value = state.whenOrNull(
  ///   data: (Object data) {
  ///     ...
  ///   },
  ///   orElse: () {
  ///     ...
  ///   },
  /// );
  /// ```
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? busy,
    TResult Function(T data)? data,
    TResult Function(U? error)? error,
    required TResult Function() orElse,
  }) {
    if (isBusy && busy != null) {
      return busy();
    } else if (hasError && error != null) {
      return error(this.error);
    } else if (this.data != null && data != null) {
      return data(this.data!);
    } else if (empty != null) {
      return empty();
    }
    return orElse();
  }
}
