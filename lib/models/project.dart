class Project {
  String type, title, description, status, author, collaborators;
  DateTime date;
  List tags, link, comments;
  String image;
  int likes;

  Project({
    this.date,
    this.description,
    this.image,
    this.link,
    this.status,
    this.tags,
    this.title,
    this.type,
    this.author,
    this.collaborators,
    this.comments,
    this.likes
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      date: json['date'],
      description: json['description'],
      image: json['image'],
      link: json['link'],
      status: json['status'],
      tags: json['tags'],
      title: json['title'],
      type: json['type'],
      author: json['author'],
      collaborators: json['collaborators'],
      comments: [''],
      likes: 4,
    );
  }
}