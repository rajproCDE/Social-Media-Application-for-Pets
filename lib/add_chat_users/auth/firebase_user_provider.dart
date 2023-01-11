import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class HealthAppFirebaseUser {
  HealthAppFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

HealthAppFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<HealthAppFirebaseUser> healthAppFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<HealthAppFirebaseUser>(
      (user) {
        currentUser = HealthAppFirebaseUser(user);
        return currentUser!;
      },
    );
