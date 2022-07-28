import 'package:elibrary/constants/images.dart';

class SliderModel {
  String image = '';

// images given
  SliderModel({required this.image});

// setter for image
  void setImage(String getImage) {
    image = getImage;
  }

// getter for image
  String getImage() {
    return image;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = [];
  SliderModel sliderModel = SliderModel(image: '');

  // 1
  sliderModel.setImage(ProjectImages.library);
  slides.add(sliderModel);

  sliderModel = new SliderModel(image: '');

  // 2
  sliderModel.setImage(ProjectImages.library_2);
  slides.add(sliderModel);

  sliderModel = new SliderModel(image: '');

  // 3
  sliderModel.setImage(ProjectImages.library_3);
  slides.add(sliderModel);

  sliderModel = new SliderModel(image: '');
  return slides;
}
