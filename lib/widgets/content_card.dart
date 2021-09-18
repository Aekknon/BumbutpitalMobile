import 'package:bumbutpital/ContentPage/content_detail.dart';
import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ContentDetail()));
      },
      child: Container(
          height: 250,
          width: 350,
          child: Image.network(
              'https://allwellhealthcare.com/wp-content/uploads/2020/12/depression-disorder.jpg')),
    ),
    SizedBox(height: 20,)
      ],
    );
  }
}

