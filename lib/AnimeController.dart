import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'AnimeModels.dart';

class AnimeController extends GetxController {
  var isLoading = true.obs;
   RxList<AnimeResponseModels> animeResponseModels = <AnimeResponseModels>[].obs;

   

  @override
  void onInit() {
    // TODO: implement onInit
    fetchAnime();
    super.onInit();
  }

  fetchAnime() async {
    final api = 'https://movieonetake.000webhostapp.com/movie/json';
    try {
      final response = await http.get(
        Uri.parse(api),
      );
      if (response.statusCode == 200) {
        animeResponseModels.value = [animeResponseModelsFromJson(response.body)];
        isLoading(false);
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }
}
