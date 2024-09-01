import 'package:get/get.dart';

import 'package:task7/data/data.dart';
import 'package:task7/posts/models/posts_models.dart';

class PostController extends GetxController {
  RxList<Post> psots = RxList<Post>();
  var loadData = true.obs;
  onInit() {
    super.onInit();
    getposts();
  }

  getposts() async {
    var response = await DataServecis().getPosts();
    loadData.value = true;

    psots.addAll(response);
    loadData.value = false;
  }
}
