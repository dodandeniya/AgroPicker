import 'dart:async';

import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_bloc/constants/firebase_interface.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository = UserRepository();
  final FirebaseInterface firebaseInterface = FirebaseInterface();

  @override
  ProfileState get initialState => ProfileInitial();

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is InsertProfile) {
      yield ProfileCreationLoading();
      try {
        var currentUser = await userRepository.getCurrentUser();
        event.user.userId = currentUser.uid;
        event.user.email = currentUser.email;

        await firebaseInterface.insertDocumentData<Users>(
            event.user.toJson(), event.user.userId);
        yield ProfileCreationLoaded();
      } catch (e) {
        print(e);
        yield ProfileCreationError();
      }
    }
    if (event is UpdateProfile) {
      yield ProfileUpdating();
      try {
        var currentUser = await userRepository.getCurrentUser();
        await firebaseInterface.updateData<Users>(
            event.users.toJson(), currentUser.uid);
        yield ProfileUpdated();
      } catch (e) {
        print(e);
        yield ProfileCreationError();
      }
    }
  }
}
