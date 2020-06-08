
import 'package:agro_picker_bloc/blocs/blocs.dart';
import 'package:agro_picker_bloc/repository/repository.dart';
import 'package:agro_picker_bloc/validators/validators.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
 final UserRepository _userRepository = UserRepository();

  @override
  RegisterState get initialState => RegisterState.empty();

  @override
  Stream<Transition<RegisterEvent, RegisterState>> transformEvents(
    Stream<RegisterEvent> events,
    TransitionFunction<RegisterEvent, RegisterState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! RegisterEmailChanged && event is! RegisterPasswordChanged);
    });
    final debounceStream = events.where((event) {
      return (event is RegisterEmailChanged || event is RegisterPasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterEmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is RegisterPasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is RegisterSubmitted) {
      yield* _mapFormSubmittedToState(event.email, event.password);
    }
  }

  Stream<RegisterState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: EmailValidators.isValidEmail(email),
    );
  }

  Stream<RegisterState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: EmailValidators.isValidPassword(password),
    );
  }

  Stream<RegisterState> _mapFormSubmittedToState(
    String email,
    String password,
  ) async* {
    yield RegisterState.loading();
    try {
      await _userRepository.signUp(
        email: email,
        password: password,
      );
      yield RegisterState.success();
    } catch (_) {
      yield RegisterState.failure();
    }
  }
}
