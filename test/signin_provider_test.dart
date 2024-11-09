
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo/features/login/domain/repositories/auth_repository.dart';
import 'package:todo/features/login/presentation/providers/auth_provider.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late ProviderContainer container;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    container = ProviderContainer(overrides: [
      authRepositoryProvider.overrideWithValue(mockAuthRepository),
    ]);
  });

  tearDown(() {
    container.dispose();
  });

  test('signIn calls AuthRepository.signIn with correct email and password', () async {
    const testEmail = 'test_user@test.com';
    const testPassword = '123456';

    // Set up mock to return a successful result when signIn is called
    when(() => mockAuthRepository.signIn(email: testEmail, password: testPassword))
        .thenAnswer((_) async {});

    // Get an instance of the AuthProvider
    final authProviderInstance = container.read(authProvider);

    // Call signIn and expect no errors
    await authProviderInstance.signIn(testEmail, testPassword);

    // Verify that signIn was called on the mock repository with the correct parameters
    verify(() => mockAuthRepository.signIn(email: testEmail, password: testPassword)).called(1);
  });

  test('signIn throws error when AuthRepository.signIn fails', () async {
    const testEmail = 'test@example.com';
    const testPassword = 'wrongpassword';

    // Set up mock to throw an exception when signIn is called
    when(() => mockAuthRepository.signIn(email: testEmail, password: testPassword))
        .thenThrow(FirebaseAuthException(
      code: 'user-not-found',
      message: 'No user found for that email.',
    ));

    final authProviderInstance = container.read(authProvider);

    expect(
          () => authProviderInstance.signIn(testEmail, testPassword),
      throwsA(isA<FirebaseAuthException>()),
    );

    // Verify that signIn was called on the mock repository with the correct parameters
    verify(() => mockAuthRepository.signIn(email: testEmail, password: testPassword)).called(1);
  });
}
