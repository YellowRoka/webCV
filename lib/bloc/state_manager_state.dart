part of 'state_manager_bloc.dart';

@immutable
abstract class StateManagerState  extends Equatable{
  const StateManagerState();

  @override
  List<Object> get props =>[];
}

class StateManagerStateInit extends StateManagerState {
  const StateManagerStateInit();
}

class StateManagerStateShowedBar extends StateManagerState {
  const StateManagerStateShowedBar();
}

class StateManagerStateHidedBar extends StateManagerState {
  const StateManagerStateHidedBar();
}

class StateManagerStatePersonal extends StateManagerState {
  const StateManagerStatePersonal();
}

class StateManagerStateWorks extends StateManagerState {
  const StateManagerStateWorks();
}

class StateManagerStateSchools extends StateManagerState {
  const StateManagerStateSchools();
}

class StateManagerStateSkills extends StateManagerState {
  const StateManagerStateSkills();
}
