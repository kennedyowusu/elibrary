import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/styles.dart';
import 'package:elibrary/controllers/book_controller.dart';
import 'package:elibrary/controllers/category_controller.dart';
import 'package:elibrary/recommendations.dart';
import 'package:elibrary/routes/routes.dart';
import 'package:elibrary/utils/helper.dart';
import 'package:elibrary/utils/refresher.dart';
import 'package:elibrary/views/home/carousel.dart';
import 'package:elibrary/views/home/components/nav_drawer.dart';
import 'package:elibrary/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final CategoryController categoryController = Get.put(CategoryController());

  final BookController bookController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // bookController.bookList.map((book) => {});

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: ProjectColors.white,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            60.0 * ProjectStyle.kMultiplier * height,
          ),
          child: ProjectAppBar(
            height: height,
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        drawer: NavigationDrawer(),
        body: SingleChildScrollView(
          child: RefreshIndicator(
            onRefresh: loadResources,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: appPaddingHorizontal(20.0),
                  child: SizedBox(
                    height: height * 0.06,
                    child: TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: ProjectColors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search by material name',
                        fillColor: ProjectColors.grey.withOpacity(0.1),
                        filled: true,
                        hintStyle: TextStyle(
                          color: ProjectColors.black.withOpacity(0.5),
                          fontSize: 14 * ProjectStyle.kMultiplier * height,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0,
                          wordSpacing: 0,
                          height: 1.2,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: ProjectColors.black.withOpacity(0.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10 * height,
                          ),
                          borderSide: BorderSide(
                            color: ProjectColors.black,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10 * height,
                          ),
                          borderSide: BorderSide(
                            color: ProjectColors.black,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10 * height,
                          ),
                          borderSide: BorderSide(
                            color: ProjectColors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10 * ProjectStyle.kMultiplier * height,
                ),
                Container(
                    height: height * 0.28,
                    color: ProjectColors.grey.withOpacity(0.2),
                    child: ListView(
                      children: List.generate(
                        bookController.bookList.length,
                        (index) {
                          return Text(
                            bookController.bookList[index].author.toString(),
                            style: TextStyle(color: Colors.red),
                          );
                        },
                      ),
                    )
                    // child: CarouselSlide(
                    //   didSelected: (int index) {
                    //     debugPrint("did Tapped $index");
                    //     Get.toNamed(RouteHelper.getDetailRoute());
                    //   },
                    // ),
                    ),
                SizedBox(
                  height: 20 * ProjectStyle.kMultiplier * height,
                ),
                Padding(
                  padding: appPaddingHorizontal(20.0),
                  child: sText(
                    'All Categories'.toUpperCase(),
                    size: 14 * ProjectStyle.kMultiplier * height,
                    weight: FontWeight.w500,
                    color: ProjectColors.black,
                  ),
                ),
                SizedBox(
                  height: 20 * ProjectStyle.kMultiplier * height,
                ),
                SizedBox(
                  height: height * 0.16,
                  child: Obx(
                    () => ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: categoryController.categoryList
                          .map(
                            (category) => CategoryItem(
                              height: height,
                              name: category.name ?? "",
                              icon: category.icon ?? "",
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0 * ProjectStyle.kMultiplier * height,
                ),
                Container(
                  height: height * 0.008,
                  width: width,
                  color: ProjectColors.grey.withOpacity(0.1),
                ),
                SizedBox(
                  height: 20 * ProjectStyle.kMultiplier * height,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: appPaddingHorizontal(20.0),
                      child: sText(
                        'Recommended for you'.toUpperCase(),
                        size: 14 * ProjectStyle.kMultiplier * height,
                        weight: FontWeight.w500,
                        color: ProjectColors.black,
                      ),
                    ),
                    Padding(
                      padding: appPaddingHorizontal(20.0),
                      child: InkWell(
                        onTap: () {
                          debugPrint("did Tapped");
                        },
                        child: sText(
                          'View All'.toUpperCase(),
                          size: 14 * ProjectStyle.kMultiplier * height,
                          weight: FontWeight.w500,
                          color: ProjectColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20 * ProjectStyle.kMultiplier * height,
                ),
                Container(
                  width: width,
                  height: height * 0.230,
                  color: ProjectColors.grey.withOpacity(0.1),
                  child: Padding(
                    padding: appPaddingHorizontal(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int index = 0;
                            index < recommendations.length;
                            index++)
                          Column(
                            children: [
                              Container(
                                height: height * 0.20,
                                width: width * 0.29,
                                margin: EdgeInsets.only(
                                  top: 10 * ProjectStyle.kMultiplier * height,
                                ),
                                decoration: BoxDecoration(
                                  color: ProjectColors.white,
                                  borderRadius: BorderRadius.circular(
                                    10 * ProjectStyle.kMultiplier * height,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          ProjectColors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(
                                        0,
                                        1,
                                      ), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(RouteHelper.getDetailRoute());
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          recommendations[index].image,
                                          fit: BoxFit.contain,
                                          height: height * 0.16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10 *
                                            ProjectStyle.kMultiplier *
                                            height,
                                      ),
                                      sText(
                                        recommendations[index].title,
                                        size: 12 *
                                            ProjectStyle.kMultiplier *
                                            height,
                                        weight: FontWeight.w500,
                                        color: ProjectColors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.height,
    required this.name,
    required this.icon,
  });

  final double height;
  final String name;
  final String icon;

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.find();
    return Padding(
      padding: appPaddingHorizontal(20.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              for (int i = 0; i < categoryController.categoryList.length; i++) {
                if (categoryController.categoryList[i].name == name) {
                  Get.toNamed(
                    RouteHelper.category,
                    arguments: categoryController.categoryList[i].name,
                  );
                  debugPrint(
                    "did Tapped ${categoryController.categoryList[i].name}",
                  );
                } else {
                  // debugPrint(
                  //     "did Tapped ${categoryController.categoryList[i].name}");
                }
              }

              Get.toNamed(RouteHelper.category);
            },
            child: Column(
              children: [
                Container(
                  height: 70 * ProjectStyle.kMultiplier * height,
                  width: 70 * ProjectStyle.kMultiplier * height,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ProjectColors.white.withOpacity(0.7),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: ProjectColors.grey.withOpacity(0.2),
                        blurRadius: 10 * ProjectStyle.kMultiplier * height,
                        offset: Offset(
                          0,
                          5 * ProjectStyle.kMultiplier * height,
                        ),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    maxRadius: 30,
                    backgroundColor: Colors.transparent,
                    // backgroundImage: NetworkImage(
                    //   icon,
                    //   scale: 1,
                    // ),
                  ),
                ),
                SizedBox(
                  height: 10 * ProjectStyle.kMultiplier * height,
                ),
                sText(
                  name,
                  size: 14 * ProjectStyle.kMultiplier * height,
                  color: ProjectColors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
