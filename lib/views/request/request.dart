import 'dart:convert';

import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/styles.dart';
import 'package:elibrary/views/home/components/nav_drawer.dart';
import 'package:elibrary/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RequestBookView extends StatefulWidget {
  RequestBookView({Key? key}) : super(key: key);

  @override
  State<RequestBookView> createState() => _RequestBookViewState();
}

class _RequestBookViewState extends State<RequestBookView> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
  }

  DateTime selectReturnDate = DateTime.now();
  DateTime selectBorrowDate = DateTime.now();

  Future<void> _selectReturnDate(BuildContext context) async {
    final today = DateTime.now();
    final newDate = DateTime(
      today.year,
      today.month + 1,
      today.day,
    );
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: newDate,
      firstDate: newDate,
      lastDate: newDate,
    );
    if (picked != null && picked != selectReturnDate)
      setState(
        () {
          selectReturnDate = picked;
        },
      );
  }

  Future<void> _selectBorrowDate(BuildContext context) async {
    final today = DateTime.now();
    final newDate = DateTime(
      today.year,
      today.month + 1,
      today.day,
    );

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectBorrowDate,
      firstDate: DateTime.now(),
      lastDate: newDate,
    );
    if (picked != null && picked != selectBorrowDate)
      setState(
        () {
          selectBorrowDate = picked;
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    debugPrint(selectReturnDate.toString());
    debugPrint(selectBorrowDate.toString());
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
          child: Padding(
            padding: ProjectStyle.padding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                        style: ProjectStyle.textStyle(context,
                            size: height * 0.02,
                            color: ProjectColors.black,
                            weight: FontWeight.w500),
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
                        style: ProjectStyle.textStyle(context,
                            size: height * 0.02,
                            color: ProjectColors.black,
                            weight: FontWeight.w500),
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
                        style: ProjectStyle.textStyle(context,
                            size: height * 0.02,
                            color: ProjectColors.black,
                            weight: FontWeight.w500),
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
                      SizedBox(height: height * 0.04),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: height * 0.010,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: ProjectColors.grey,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Borrow Date",
                                      style: ProjectStyle.textStyle(
                                        context,
                                        size: height * 0.02,
                                        color: ProjectColors.black,
                                        weight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: height * 0.010),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: ProjectColors.primary,
                                      ),
                                      onPressed: () =>
                                          _selectBorrowDate(context),
                                      child: Text(
                                        "${selectBorrowDate.toLocal()}"
                                            .split(' ')[0],
                                        style: ProjectStyle.textStyle(
                                          context,
                                          size: height * 0.02,
                                          color: ProjectColors.white,
                                          weight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.080,
                                  child: VerticalDivider(
                                    color: ProjectColors.red,
                                    thickness: 1,
                                    indent: height * 0.040,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Return Date",
                                      style: ProjectStyle.textStyle(context,
                                          size: height * 0.02,
                                          color: ProjectColors.black,
                                          weight: FontWeight.w500),
                                    ),
                                    SizedBox(height: height * 0.010),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: ProjectColors.primary,
                                      ),
                                      onPressed: () =>
                                          _selectReturnDate(context),
                                      child: Text(
                                        "${selectReturnDate.toLocal()}"
                                            .split(' ')[0],
                                        style: ProjectStyle.textStyle(
                                          context,
                                          size: height * 0.02,
                                          color: ProjectColors.white,
                                          weight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              "Abide by your chosen date".toUpperCase(),
                              style: TextStyle(
                                color: ProjectColors.red,
                                fontSize: height * 0.02,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        "Borrowed By",
                        style: ProjectStyle.textStyle(context,
                            size: height * 0.02,
                            color: ProjectColors.black,
                            weight: FontWeight.w500),
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
