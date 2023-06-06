import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_details.freezed.dart';

part 'user_details.g.dart';

/// [UserDetails] is the model used to see user details

@freezed
class UserDetails with _$UserDetails {
  const factory UserDetails({
    required int id,
    @JsonKey(name: 'fullName') required String name,
    @JsonKey(name: 'role') required int role,
  }) = _UserDetails;

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);
}
