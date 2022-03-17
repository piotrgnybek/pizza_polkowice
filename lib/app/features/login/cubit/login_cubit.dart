import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(const LoginState(
          errorMessage: "",
          isCreatingAccount: false,
        ));
  Future<void> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (error) {
      emit(LoginState(
        errorMessage: error.toString(),
        isCreatingAccount: false,
      ));
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (error) {
      emit(LoginState(
        errorMessage: error.toString(),
        isCreatingAccount: false,
      ));
    }
  }

  Future<void> start() async {
    emit(
      const LoginState(
        isCreatingAccount: false,
        errorMessage: "",
      ),
    );
  }

  Future<void> setState() async {
    emit(
      const LoginState(
        isCreatingAccount: true,
        errorMessage: "",
      ),
    );
  }
}
