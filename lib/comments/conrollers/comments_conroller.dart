import 'package:get/get.dart';
import 'package:task7/data/data.dart';
import 'package:task7/comments/models/comments_models.dart';

class CommentsConroller extends GetxController {
  RxList<Comment> comments = RxList<Comment>();
  var loadData = true.obs;
  onInit() {
    super.onInit();
    getComments();
  }

  getComments() async {
    loadData.value = true;
    var response = await DataServecis().getComments();

    comments.addAll(response);
    loadData.value = false;
  }
}
