import 'package:crypto_app/models/api_response.dart';
import 'package:crypto_app/services/http_service.dart';
import 'package:get/get.dart';

class AddAssetsDialogController extends GetxController{
  RxBool loading = false.obs;
  RxList<String> assets = <String>[].obs;
  RxString selectedAsset = "".obs;
  RxDouble assetValue = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getAssets();
  }

  Future<void> getAssets() async{
    loading.value = true;
    HTTPService httpService = Get.find<HTTPService>();
    var responseData = await httpService.get("currencies");
    CurrenciesListAPIResponse currenciesListAPIResponse = CurrenciesListAPIResponse.fromJson(responseData);
    currenciesListAPIResponse.data!.forEach((coin) {
      assets.add(coin.name!);
    });
    selectedAsset.value = assets.first;
    loading.value = false;
  }



}