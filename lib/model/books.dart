class Book {
  int? id = 0;
  String? title = "";
  String? description = "";
  String? image = "";
  String? author = "";
  bool? isAvailable = false;
  int? categoryId = 2;
  bool? isRecommended = false;
  bool? isPopular = false;

  Book({
    this.id,
    this.title,
    this.description,
    this.image,
    this.author,
    this.isAvailable,
    this.categoryId,
    this.isRecommended,
    this.isPopular,
  });

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    author = json['author'];
    isAvailable = json['isAvailable'];
    categoryId = json['category_id'];
    isRecommended = json['isRecommended'];
    isPopular = json['isPopular'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['author'] = this.author;
    data['isAvailable'] = this.isAvailable;
    data['category_id'] = this.categoryId;
    data['isRecommended'] = this.isRecommended;
    data['isPopular'] = this.isPopular;
    return data;
  }
}
