class Project {
  String type, title, description, status;
  DateTime date;
  List<String> tags, link, comments;
  String image;
  int likes;

  Project(
    this.date,
    this.description,
    this.image,
    this.link,
    this.status,
    this.tags,
    this.title,
    this.type,
    this.comments,
    this.likes
  );

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      json['date'],
      json['description'],
      json['image'],
      json['link'],
      json['status'],
      json['tags'],
      json['title'],
      json['type'],
      json['comments'],
      json['likes'],
    );
  }
}