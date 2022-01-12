import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final goolgesignIn = GoogleSignIn();

Future<bool?> googleSignIn() async {
  GoogleSignInAccount? account = await goolgesignIn.signIn();
  if (account != null) {
    GoogleSignInAuthentication googleauth = await account.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleauth.idToken,
      accessToken: googleauth.accessToken,
    );

    final result = await auth.signInWithCredential(credential);
    final user = await auth.currentUser;
    print(user!.uid);
    return Future.value(true);
  }
}

Future<bool?> signoutUser() async {
  final user = await auth.currentUser;
  if (user!.providerData[1].providerId == 'google.com') {
    await goolgesignIn.disconnect();
  }
  await auth.signOut();
}
