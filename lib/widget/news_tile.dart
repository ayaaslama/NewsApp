import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/article_model.dart';

// cached network image
class NewsTile extends StatefulWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  int maxlines=1;
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child:widget.articleModel.image!=null?
            GestureDetector(
            onTap:(){
               setState(() {
             maxlines=20;
               });
                   },
              child: Image.network(
                '${widget.articleModel.image}',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

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
          widget.articleModel.title,
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
          widget.articleModel.subTitle ?? '',
          maxLines: maxlines,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        )
      ],
    );
  }
}