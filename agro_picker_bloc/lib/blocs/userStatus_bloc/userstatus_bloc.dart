import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_bloc/constants/firebase_interface.dart';
import 'package:bloc/bloc.dart';

class UserStatusBloc extends Bloc<UserStatusEvent, UserStatusState> {
  final UserStatusSingleton userStatusSingleton =
      UserStatusSingleton.getInstance();
  final FirebaseInterface firebaseInterface = FirebaseInterface();
  final ProductStockRepository productStockRepository =
      ProductStockRepository();

  @override
  UserStatusState get initialState => UserStatusInitial();

  @override
  Stream<UserStatusState> mapEventToState(UserStatusEvent event) async* {
    if (event is ChangeUserStatus) {
      yield* _mapUpdateUserStatusEventToState(event.isOnline);
    }
  }

  Stream<UserStatusState> _mapUpdateUserStatusEventToState(
      bool isOnline) async* {
    try {
      userStatusSingleton.user.isOnline = isOnline;

      if (isOnline) {
        yield UserStatusOnline();
      } else {
        yield UserStatusOffline();
      }
      await firebaseInterface.updateData<Users>(
          userStatusSingleton.user.toJson(), userStatusSingleton.user.userId);
      await productStockRepository.updateProducerStatus(isOnline);
    } catch (e) {
      yield UserStatusError();
    }
  }
}
