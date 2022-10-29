import 'package:elibrary/constants/images.dart';

class HomeModel {
  final String authorName, image;

  HomeModel({required this.authorName, required this.image});
}

List<HomeModel> homeModel = [
  HomeModel(authorName: 'Author Name', image: ProjectImages.library),
  HomeModel(authorName: 'Author Name', image: ProjectImages.library),
  HomeModel(authorName: 'Author Name', image: ProjectImages.library),
  HomeModel(authorName: 'Author Name', image: ProjectImages.library),
  HomeModel(authorName: 'Author Name', image: ProjectImages.library),
  HomeModel(authorName: 'Author Name', image: ProjectImages.library),
  HomeModel(authorName: 'Author Name', image: ProjectImages.library),
];
