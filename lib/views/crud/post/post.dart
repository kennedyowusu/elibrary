import 'dart:convert';

import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/styles.dart';
import 'package:elibrary/controllers/post/post.dart';
import 'package:elibrary/services/endpoints/endpoints.dart';
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
      'title': _titleController.text,
      'author': _authorController.text,
      'index': _indexController.text,
      'borrow_date': _dateController.text,
      'return_date': _returnController.text,
      'borrowed_by': _nameController.text,
    };

    var response =
        await _postController.postRequest(userData, ProjectApis.requestUrl);
    var body = json.decode(response.body);
    if (body['status'] == 'success') {
      _clearForm();
      Get.snackbar(
        'Success',
        'Your request has been sent successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        margin: EdgeInsets.all(10),
        borderColor: Colors.green,
        borderWidth: 2,
        colorText: Colors.white,
        snackStyle: SnackStyle.FLOATING,
        duration: Duration(seconds: 2),
      );
    } else {
      Get.snackbar(
        'Error',
        'Something went wrong',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(10),
        borderColor: Colors.red,
        borderWidth: 2,
        colorText: Colors.white,
        snackStyle: SnackStyle.FLOATING,
        duration: Duration(seconds: 2),
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
                        inputType: TextInputType.datetime,
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
                        inputType: TextInputType.datetime,
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
                        inputType: TextInputType.datetime,
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
                        inputType: TextInputType.datetime,
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
                        inputType: TextInputType.datetime,
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
                      ),
                      SizedBox(height: height * 0.02),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ProjectColors.primary,
                          minimumSize: Size(width * 0.95, height * 0.08),
                        ),
                        onPressed: () {
                          sendUserRequest();
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
  }) : super(key: key);

  final TextEditingController inputController;
  final TextInputType inputType;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: inputController,
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
