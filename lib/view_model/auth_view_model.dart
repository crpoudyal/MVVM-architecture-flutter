import 'package:flutter/cupertino.dart';
import 'package:mvvm_architecture_flutter/repository/auth_repo.dart';
import 'package:mvvm_architecture_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_architecture_flutter/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepo();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUploading = false;
  bool get signUploading => _signUploading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignupLoading(bool value) {
    _signUploading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);

      Utils.flashBarSuccessMessage(
          "Login success ${value.toString()}", context);
      Navigator.pushNamed(context, RoutesName.home);
      print(value.toString());
    }).onError((error, stackTrace) {
      setLoading(false);

      Utils.flashBarErrorMessage(error.toString(), context);
      print(error.toString());
    });
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {
    setSignupLoading(true);
    _myRepo.signupApi(data).then((value) {
      setSignupLoading(false);

      Utils.flashBarSuccessMessage(
          "Register success ${value.toString()}", context);
      Navigator.pushNamed(context, RoutesName.home);
      print(value.toString());
    }).onError((error, stackTrace) {
      setSignupLoading(false);

      Utils.flashBarErrorMessage(error.toString(), context);
      print(error.toString());
    });
  }
}
