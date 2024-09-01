import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:task7/data/data.dart';

import 'package:task7/comments/screens/comments_screen.dart';
import 'package:task7/posts/controllers/post_controller.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PostController controller = Get.put(PostController());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'POSTS',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Obx(() => controller.loadData.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.psots.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: InkWell(
                        onTap: () {
                          postId = controller.psots[index].id!;
                          Get.to(CommentsScreen());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(40)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "post ${index + 1}",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 25),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.0),
                                  child: Text(
                                    controller.psots[index].title!,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    "${controller.psots[index].body}",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  );
                },
              )));
  }
}
