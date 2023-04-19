import 'package:badmatch_app/infrastructure/entity/members.dart';
import 'package:badmatch_app/view/edit_member_page/edit_member_page_state.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class EditMemberPageStateNotifier extends StateNotifier<EditMemberPageState> {
  EditMemberPageStateNotifier() : super(const EditMemberPageState());

  void setSex(SexEnum sex) {
    state = state.copyWith(sex: sex);
  }

  void setLevel(int level) {
    state = state.copyWith(level: level);
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setAge(int age) {
    state = state.copyWith(age: age);
  }
}
