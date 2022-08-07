import 'dart:convert';

import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/styles.dart';
import 'package:elibrary/controllers/post/post.dart';
import 'package:elibrary/services/endpoints/endpoints.dart';
import 'package:elibrary/widgets/button_nav.dart';
import 'package:elibrary/widgets/top_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BorrowBook extends StatelessWidget {
  BorrowBook({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  TextEditingController _indexController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _returnController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  String title = '';
  String author = '';
  String index = '';
  String borrowDate = '';
  String returnDate = '';
  String name = '';

  PostController _postController = Get.put(PostController());

  void _clearForm() {
    _titleController.clear();
    _authorController.clear();
    _indexController.clear();
    _dateController.clear();
    _returnController.clear();
    _nameController.clear();
  }

  sendUserRequest() async {
    var userData = {
      'title': _titleController.text.trim(),
      'author': _authorController.text.trim(),
      'index': _indexController.text.trim(),
      'borrow_date': _dateController.text.trim(),
      'return_date': _returnController.text.trim(),
      'borrowed_by': _nameController.text.trim(),
    };

    var response =
        await _postController.postRequest(userData, ProjectApis.requestUrl);
    var body = json.decode(response.body);
    debugPrint(body.toString());
    if (response.statusCode == 201) {
      Get.snackbar(
        "Success",
        "Book has been borrowed successfully",
      );
      _clearForm();
      // Get.to(
      //   ((_authorController.text.trim() == "")
      //       ? "/"
      //       : "/search?author=" + _authorController.text.trim()),
      // );
      Get.to(() => BottomNavigation());
    } else {
      Get.snackbar(
        "Error",
        body['message'] ?? "Something went wrong",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: ProjectStyle.padding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopSection(
                  width: width,
                  backIcon: Icons.chevron_left_sharp,
                  onPressed: () {},
                  text: "Borrow A Book",
                  height: height,
                  closeIcon: Icons.cancel_outlined,
                ),
                SizedBox(height: height * 0.02),
                Container(
                  height: height * 0.2,
                  width: width,
                  decoration: BoxDecoration(
                    color: ProjectColors.grey,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      filterQuality: FilterQuality.high,
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGJvb2tzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Book Title",
                        style: ProjectStyle.textStyle(context),
                      ),
                      SizedBox(height: height * 0.02),
                      PostFormInputField(
                        inputController: _titleController,
                        hintText: "Enter Book Title",
                        inputType: TextInputType.text,
                        validate: (value) {
                          if (value.isEmpty) {
                            return "Please enter a title";
                          }
                          return null;
                        },
                        saved: (value) {
                          title = value;
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        "Author Name",
                        style: ProjectStyle.textStyle(context),
                      ),
                      SizedBox(height: height * 0.02),
                      PostFormInputField(
                        inputController: _authorController,
                        hintText: "Enter Author Name",
                        inputType: TextInputType.text,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Please enter Author Name';
                          }
                          return null;
                        },
                        saved: (value) {
                          author = value;
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        "Student Index",
                        style: ProjectStyle.textStyle(context),
                      ),
                      SizedBox(height: height * 0.02),
                      PostFormInputField(
                        inputController: _indexController,
                        hintText: "Enter Your Index",
                        inputType: TextInputType.text,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your index';
                          }
                          return null;
                        },
                        saved: (value) {
                          index = value;
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        "Borrow Date",
                        style: ProjectStyle.textStyle(context),
                      ),
                      SizedBox(height: height * 0.02),
                      PostFormInputField(
                        inputController: _dateController,
                        hintText: "Enter Borrow Date",
                        inputType: TextInputType.text,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Please enter Borrow Date';
                          }
                          return null;
                        },
                        saved: (value) {
                          borrowDate = value;
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        "Return Date",
                        style: ProjectStyle.textStyle(context),
                      ),
                      SizedBox(height: height * 0.02),
                      PostFormInputField(
                        inputController: _returnController,
                        hintText: "Enter Return Date",
                        inputType: TextInputType.text,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Please enter return date';
                          }
                          return null;
                        },
                        saved: (value) {
                          returnDate = value;
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        "Borrowed By",
                        style: ProjectStyle.textStyle(context),
                      ),
                      SizedBox(height: height * 0.02),
                      PostFormInputField(
                        inputController: _nameController,
                        hintText: "Enter Your Full Name",
                        inputType: TextInputType.text,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        saved: (value) {
                          name = value;
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ProjectColors.primary,
                          minimumSize: Size(width * 0.95, height * 0.08),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            sendUserRequest();
                          }
                        },
                        child: Text("Submit Request"),
                      ),
                      SizedBox(height: height * 0.02),
                    ],
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

class PostFormInputField extends StatelessWidget {
  const PostFormInputField({
    Key? key,
    required this.inputController,
    required this.inputType,
    required this.hintText,
    required this.validate,
    required this.saved,
  }) : super(key: key);

  final TextEditingController inputController;
  final TextInputType inputType;
  final String hintText;
  final Function validate, saved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: inputController,
      keyboardType: inputType,
      validator: (value) {
        return validate(value);
      },
      onSaved: (value) {
        return saved(value);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ProjectColors.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ProjectColors.grey,
          ),
        ),
        hintText: hintText,
      ),
    );
  }
}
