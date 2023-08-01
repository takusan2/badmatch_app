import 'package:badmatch_app/view/home_page/home_page_state.dart';
import 'package:state_notifier/state_notifier.dart';

class HomePageStateNotifier extends StateNotifier<HomePageState> {
  HomePageStateNotifier() : super(const HomePageState());

  void toggleEditFlag() {
    state = state.copyWith(editFlag: !state.editFlag);
  }
}
