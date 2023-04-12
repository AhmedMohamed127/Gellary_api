

import 'package:flutter/material.dart';

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);


Widget ArticleItem(article,context) =>Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30)
      ),
      width: MediaQuery.of(context).size.width/3.8,
        height: MediaQuery.of(context).size.height/8,
        child: Image(
            fit: BoxFit.fill,
            image: NetworkImage(
                "$article")
        )
    ),
    SizedBox(width: 20.0,),
  ],
);