import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'AnimeController.dart';

class Homepage extends StatelessWidget {
  final animeController = Get.put(AnimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ANIMEK"),
        actions: const [],
      ),
      body: Obx(() => animeController.isLoading.value
      ? CircularProgressIndicator()
      : ListView.builder(
        itemCount: animeController.animeResponseModels[0].data.length,
        itemBuilder: (BuildContext context, int index){
          final anime = animeController.animeResponseModels[0].data[index];
          return Container(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(anime.title),
              leading: Image.network(anime.poster),
            ),
          );
        },
      )),
    );
  }
}
