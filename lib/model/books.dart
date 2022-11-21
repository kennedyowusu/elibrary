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

  Book.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = parsedJson['title'];
    description = parsedJson['description'];
    image = parsedJson['image'];
    author = parsedJson['author'];
    isAvailable = parsedJson['isAvailable'].toString() == '1' ? true : false;
    categoryId = parsedJson['category_id'];
    isRecommended =
        parsedJson['isRecommended'].toString() == '1' ? true : false;
    ;
    isPopular = parsedJson['isPopular'].toString() == '1' ? true : false;
    ;
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
