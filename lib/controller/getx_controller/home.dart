import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_1/controller/api_service/memes_list.dart';
import 'package:test_1/model/memes_list.dart';

class HomeController extends GetxController {
  List<Memes> memesList = [];
  RxBool isLoading = false.obs;
  TextEditingController searchController = TextEditingController();
  List<Memes> searchList = [];

  getMemes() async {
    isLoading.value = true;
    memesList = await MemesListService.memesListService();
    log("...........${memesList.length}");
    searchList.addAll(memesList);
    log("...........${searchList.length}");
    isLoading.value = false;
  }

  searchFun({required String searchText}) async {
    isLoading.value = true;
    log("________________$searchText");
    searchList = memesList
        .where((value) =>
            value.name?.toLowerCase().contains(searchText.toLowerCase()) ??
            false)
        .toList();
    isLoading.value = false;
  }

  @override
  void onInit() {
    getMemes();
    super.onInit();
  }
}

