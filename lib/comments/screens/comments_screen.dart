import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task7/comments/conrollers/comments_conroller.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CommentsConroller conroller = Get.put(CommentsConroller());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'COMMINTS',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Obx(
          () => conroller.loadData.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: conroller.comments.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(40)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "comminte ${index + 1}",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 25),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.0),
                                  child: Text(
                                    "${conroller.comments[index].name}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child:
                                      Text("${conroller.comments[index].body}"),
                                )
                              ],
                            ),
                          )),
                    );
                  },
                ),
        ));
  }
}
