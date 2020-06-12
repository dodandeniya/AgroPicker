import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_bloc/constants/firebase_interface.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository = UserRepository();
  final FirebaseInterface db = FirebaseInterface();

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is CheckProfileCompleted) {
      yield* _mapCheckProfileCompletedToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    final isSignedIn = await _userRepository.isSignedIn();
    if (isSignedIn) {
      await Future<void>.delayed(Duration(seconds: 5));
      yield* _mapCheckProfileCompletedToState();
    } else {
      await Future<void>.delayed(Duration(seconds: 5));
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapCheckProfileCompletedToState() async* {
    var docId = (await _userRepository.getCurrentUser()).uid;
    var checkAvailable = await db.checkDocumentExist<Users>(docId);

    if (checkAvailable) {
      var document = await db
          .getObject<Users>(docId)
          .first
          .then((value) => Users.fromJson(value.data));

      if (document.isProfileCompleted != null &&
          document.isProfileCompleted == true) {
        yield Authenticated(await _userRepository.getUser());
      } else {
        yield PendingProfileCompletion();
      }
    } else {
      yield PendingProfileCompletion();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    await Future<void>.delayed(Duration(seconds: 5));
    yield* _mapCheckProfileCompletedToState();
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _userRepository.signOut();
  }
}
