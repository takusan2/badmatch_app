import 'package:badmatch_app/view/match_config_page/match_config_page_state.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class MatchConfigPageStateNotifier extends StateNotifier<MatchConfigPageState> {
  MatchConfigPageStateNotifier() : super(MatchConfigPageState());
  void setNumCourt(int numCourt) {
    state = state.copyWith(numCourt: numCourt);
  }

  void toggleIsSingle({bool? toggleTo}) {
    if (toggleTo != null) {
      state = state.copyWith(isSingle: toggleTo);
    } else {
      state = state.copyWith(isSingle: !state.isSingle);
    }
  }

  void toggleEqualNumMatch() {
    state = state.copyWith(equalNumMatch: !state.equalNumMatch);
  }

  void toggleCloseLevel() {
    state = state.copyWith(closeLevel: !state.closeLevel);
  }
}
