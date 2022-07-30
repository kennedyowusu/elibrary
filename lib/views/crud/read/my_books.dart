import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestedBooks extends StatefulWidget {
  const RequestedBooks({Key? key}) : super(key: key);

  @override
  State<RequestedBooks> createState() => _RequestedBooksState();
}

class _RequestedBooksState extends State<RequestedBooks> {
  Container leftSection() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.all(10),
      color: ProjectColors.green.withOpacity(0.5),
      child: Icon(
        Icons.edit,
        color: ProjectColors.white,
      ),
    );
  }

  Container rightSection() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.all(10),
      color: ProjectColors.red,
      child: Icon(
        Icons.delete,
        color: ProjectColors.white,
      ),
    );
  }

  bool status = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ProjectStyle.padding(context),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.12,
                    height: height * 0.06,
                    margin: EdgeInsets.only(top: height * 0.012),
                    decoration: BoxDecoration(
                      color: ProjectColors.secondary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: IconButton(
                      icon: Icon(CupertinoIcons.chevron_back),
                      onPressed: () => Get.back(),
                    ),
                  ),
                  Text(
                    "Your Requested Books",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: ProjectColors.black,
                    ),
                  ),
                  Container(
                    width: width * 0.12,
                    height: height * 0.06,
                    margin: EdgeInsets.only(top: height * 0.012),
                    decoration: BoxDecoration(
                      color: ProjectColors.secondary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "2",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: ProjectColors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Container(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 3,
                  separatorBuilder: (context, index) => SizedBox(
                    height: height * 0.02,
                  ),
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        print(direction);
                      },
                      confirmDismiss: (direction) async {
                        if (direction == DismissDirection.endToStart) {
                          return await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Confirm"),
                              content: Text(
                                "Are you sure you want to delete this book?",
                                style: ProjectStyle.textStyle(context),
                              ),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: ProjectColors.red,
                                  ),
                                  child: Text("Cancel"),
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: ProjectColors.primary,
                                  ),
                                  child: Text("Delete"),
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Future.delayed(
                            Duration(milliseconds: 100),
                            () async {
                              if (direction == DismissDirection.startToEnd) {
                                return await showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  builder: (_) {
                                    return Container(
                                      height: height * 0.18,
                                      decoration: BoxDecoration(
                                        color: ProjectColors.secondary,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: ProjectColors.primary,
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              "View",
                                              style: TextStyle(
                                                color: ProjectColors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                              primary: ProjectColors.primary,
                                            ),
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.edit,
                                              color: ProjectColors.white,
                                            ),
                                            label: Text(
                                              "Edit",
                                              style: TextStyle(
                                                color: ProjectColors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }
                              return null;
                            },
                          );
                        }
                      },
                      background: leftSection(),
                      secondaryBackground: rightSection(),
                      child: Container(
                        height: height * 0.12,
                        child: Card(
                          child: ListTile(
                            title: Text(
                              "Book Name",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: ProjectColors.black,
                              ),
                            ),
                            subtitle: Text(
                              "Book Author",
                              style: TextStyle(
                                fontSize: 15,
                                color: ProjectColors.black,
                              ),
                            ),
                            trailing: status == true
                                ? Icon(
                                    Icons.check_circle,
                                    color: ProjectColors.green,
                                  )
                                : Icon(
                                    Icons.cancel_outlined,
                                    color: ProjectColors.red,
                                  ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
