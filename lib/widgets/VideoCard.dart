import 'package:bumbutpital/VideoPage/VideoDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_link_preview/flutter_link_preview.dart';

class VideotCard extends StatelessWidget {
  const VideotCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => VideoDetail()));
                                },
                                child: Column(
                                  children: [
                                    Stack(children: [
                                      Row(
                                        children: [
                                          FlutterLinkPreview(
    url: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    titleStyle: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
    ),
),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,

                                                  // transform:
                                                  //     Matrix4.translationValues(
                                                  //         -20, -30, 0.0),
                                                  child: Text(
                                                    'Topic: โรคภัยใกล้ตัว โรคซึมเศร้า',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                  child: Icon(
                                                      Icons.schedule_outlined),
                                                  alignment: Alignment.topLeft,
                                                ),
                                                Container(
                                                    transform: Matrix4
                                                        .translationValues(
                                                            -30, -20, 0.0),
                                                    child: Text('20 min')),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
    SizedBox(height: 20,)
      ],
    );
  }
}