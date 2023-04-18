import 'package:badmatch_app/view/member_page/member_page_state.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class MemberPageStateNotifier extends StateNotifier<MemberPageState> {
  MemberPageStateNotifier() : super(const MemberPageState());

  void toggleEditFlag() {
    state = state.copyWith(editFlag: !state.editFlag);
  }
}
