import 'package:flutter/cupertino.dart';
import 'package:mvvm_architecture_flutter/repository/auth_repo.dart';
import 'package:mvvm_architecture_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_architecture_flutter/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepo();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
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
}
