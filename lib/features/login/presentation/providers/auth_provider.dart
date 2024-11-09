
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/features/login/data/repositories/auth_repository_impl.dart';
import 'package:todo/features/login/domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final firebaseAuth = FirebaseAuth.instance;
  return AuthRepositoryImpl(firebaseAuth: firebaseAuth);
});

final authProvider = Provider(AuthProvider.new);

class AuthProvider {
  AuthProvider(this.ref);
  final Ref ref;

  Future<void> signIn(String email, String password) async {
    final repository = ref.read(authRepositoryProvider);
    await repository.signIn(email: email, password: password);
  }
}