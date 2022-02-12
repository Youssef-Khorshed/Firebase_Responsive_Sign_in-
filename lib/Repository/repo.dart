// ignore_for_file: non_constant_identifier_names

abstract class Repository {
  // sigin in method anonymous

  Future Singin_Anonymous();
  Future Google_siginin();
  Future Facebook_siginin();
  Future Email_Password_Signin(
      {required String email, required String password});
  Future Create_Email_Password(
      {required String email, required String password});
}
