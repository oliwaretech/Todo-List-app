
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/features/login/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.firebaseAuth,
  });

  final FirebaseAuth firebaseAuth;

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final authUser = response.user;
      if (authUser == null) throw Exception('User not found');
    } catch (e) {
      rethrow;
    }
  }
}