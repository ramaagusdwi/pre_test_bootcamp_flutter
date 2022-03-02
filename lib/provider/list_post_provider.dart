import 'package:flutter/cupertino.dart';
import 'package:pre_test_app/models/post_model.dart';
import 'package:pre_test_app/services/list_services.dart';
import 'package:provider/provider.dart';

class ListPostProvider extends ChangeNotifier {
  late List<PostModel> listPostModel;

  bool isLoading = false;
  ListPostProvider() {
    fetchListPost();
  }

  Future<void> fetchListPost() async {
    isLoading = true;
    notifyListeners();

    listPostModel = await ListPostService.getListPost();

    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchPost({required String id}) async {
    isLoading = true;
    notifyListeners();
    listPostModel.clear();
    var post = await ListPostService.getPost(id);
    listPostModel.add(post);

    isLoading = false;
    notifyListeners();
  }
}
