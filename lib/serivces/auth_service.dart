import 'dart:convert';
import 'package:authentication/models/userModel.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );

  static Future logOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      print(e);
    }
  }

  static Future<User> signInWithGoogle(String userType) async {
    try {
      // Trigger the Google sign-in flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final response = await http.post(
          Uri.parse(
              'https://service-provider-apis.onrender.com/api/v1/auth/google'),
          body: {
            'token': googleAuth.idToken,
            'userType': userType,
          },
        );

        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          final userModel = UserModel.fromJson(jsonData);

          // Access the user data
          final user = userModel.user;
          return user;
        } else {
          throw Exception('Failed to sign in with Google');
        }
      } else {
        throw Exception('Google sign-in canceled');
      }
    } catch (error) {
      throw Exception('Error signing in with Google: $error');
    }
  }
}
