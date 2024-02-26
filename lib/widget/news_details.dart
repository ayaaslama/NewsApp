import 'package:flutter/material.dart';

import '../models/article_model.dart';
class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {

    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child:articleModel.image!=null? GestureDetector(
                child: Image.network(
                  '${articleModel.image}',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                onTap:(){
                }
            ):Image.asset("assets/news.jpg",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            )
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          articleModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          articleModel.subTitle ?? '',
          maxLines: 20,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        )
      ],
    );
  }
}
