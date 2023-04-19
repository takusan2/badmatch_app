import 'package:badmatch_app/infrastructure/entity/members.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_member_page_state.freezed.dart';

@freezed
class EditMemberPageState with _$EditMemberPageState {
  const factory EditMemberPageState({
    int? level,
    String? name,
    int? age,
    @Default(SexEnum.male) SexEnum sex,
  }) = _EditMemberPageState;
}
