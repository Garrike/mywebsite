import 'package:flutter/cupertino.dart';

class Profile {
  String name, email, password, office, description;
  DateTime birth;
  List<String> tags, link, bookId, projectId;
  Image image;

  Profile(
    this.birth,
    this.description,
    this.email,
    this.image,
    this.link,
    this.name,
    this.office,
    this.password,
    this.tags,
    this.bookId,
    this.projectId
  );
}