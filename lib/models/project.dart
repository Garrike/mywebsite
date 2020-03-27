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
}