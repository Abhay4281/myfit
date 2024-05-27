import 'dashboard.dart';
import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String tag;
  final String date;
  final String description;
  final List<String> tags;

  const ArticleWidget({ Key? key,
    required this.title,
    required this.imageUrl,
    required this.tag,
    required this.date,
    required this.description,
    required this.tags,}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
    padding: EdgeInsets.all(10),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
    title,
    style: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    ),
    ),
    SizedBox(height: 10),
    ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Image.network(imageUrl),
    ),
    SizedBox(height: 10),
    Row(
    children: [
    Text(
    tag,
    style: TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(width: 10),
    Text(
    date,
    style: TextStyle(
    color: Colors.grey,
    fontStyle: FontStyle.italic,
    ),
    ),
    Spacer(),
    Icon(Icons.bookmark_border),
    ],
    ),
    SizedBox(height: 10),
    Text(
    description,
    style: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    ),
    ),
    SizedBox(height: 10),
    Wrap(
    spacing: 10,
    children: tags
    .map((tag) => Chip(
    label: Text(tag),
    backgroundColor: Colors.blue.shade50,
    ))
        .toList(),
    ),
    ],
    ),
    )
    );
  }
}
