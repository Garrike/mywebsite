import 'package:flutter/cupertino.dart';

class Project {
  String type, title, description;
  DateTime date;
  List<String> tags, link;
  String image;
  bool status;

  Project(
    this.date,
    this.description,
    this.image,
    this.link,
    this.status,
    this.tags,
    this.title,
    this.type
  );
}