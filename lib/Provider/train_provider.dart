import 'package:flutter/cupertino.dart';
import 'package:train_api/Utils/api_helper.dart';

class TrainProvider with ChangeNotifier {
  Future<List> getTrain() async {
    ApiHelper apiHelper = ApiHelper();

    List l1 = await apiHelper.TrainApicall();
    return l1;
  }
}
