import 'package:get/get.dart';
import 'package:getx_state_management/models/new_res_model.dart';
import 'package:getx_state_management/services/api_service.dart';

class DashboardController extends GetxController {
  APIService service = APIService();
  NewsResModel? newsResModel;
  bool isLoading = false;
  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  Future<void> fetchNews() async {
    isLoading = true;
    final res = await service.getLastNews();
    if (res != null) {
      newsResModel = res;
      update();
    } else {
      newsResModel = res;
    }
    isLoading = false;
  }
}
