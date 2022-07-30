import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/styles.dart';
import 'package:elibrary/views/details/details.dart';
import 'package:elibrary/views/home/components/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<FormState> _searchKey = GlobalKey<FormState>();
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  String _searchText = '';
  FocusNode _searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: ProjectStyle.padding(context),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(height: height),
                SizedBox(height: height * 0.02),
                buildSearchField(height),
                SizedBox(height: height * 0.02),
                Container(
                  height: height * 0.6,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: 6,
                    separatorBuilder: (context, index) => SizedBox(
                      height: height * 0.02,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              BookDetails(
                                width: width,
                                height: height,
                                onTap: () {
                                  Get.to(() => DetailsScreen(), arguments: []);
                                },
                              ),
                              BookDetails(
                                width: width,
                                height: height,
                                onTap: () {
                                  Get.to(() => DetailsScreen(), arguments: []);
                                },
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form buildSearchField(double height) {
    return Form(
      key: _searchKey,
      child: TextFormField(
        controller: _searchController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          labelText: 'Search',
          labelStyle: TextStyle(
            fontSize: height * 0.03,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(height * 0.02),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}

class BookDetails extends StatelessWidget {
  const BookDetails({
    Key? key,
    required this.width,
    required this.height,
    required this.onTap,
  }) : super(key: key);

  final double width;
  final double height;
  final String image =
      "https://images.unsplash.com/photo-1495640388908-05fa85288e61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80";
  final String title = "Reading With Friends";
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          Container(
            width: width * 0.45,
            height: height * 0.32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ProjectColors.grey,
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: height * 0.015),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ProjectColors.black.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
