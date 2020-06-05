import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AuthenticationState get initialState => throw UnimplementedError();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) {
    throw UnimplementedError();
  }
}
