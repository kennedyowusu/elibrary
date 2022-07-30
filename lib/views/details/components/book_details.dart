import 'package:elibrary/constants/colors.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({
    Key? key,
    required this.height,
    required this.width,
    required this.icon,
  }) : super(key: key);

  final double height;
  final double width;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height * 0.4,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ProjectColors.white,
            image: DecorationImage(
              image: NetworkImage(
                "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: height * 0.02),
        Text(
          "Reading With Friends",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ProjectColors.black.withOpacity(0.5),
          ),
        ),
        SizedBox(height: height * 0.02),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat.",
          style: TextStyle(
            fontSize: 16,
            color: ProjectColors.black.withOpacity(0.5),
          ),
        ),
        SizedBox(height: height * 0.02),
        Text(
          "Author of the book",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ProjectColors.black.withOpacity(0.5),
          ),
        ),
        SizedBox(height: height * 0.02),
        Text(
          "Edition",
          style: TextStyle(
            fontSize: 16,
            color: ProjectColors.black.withOpacity(0.5),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Availability",
              style: TextStyle(
                fontSize: 16,
                color: ProjectColors.black.withOpacity(0.5),
              ),
            ),
            Icon(icon),
          ],
        ),
      ],
    );
  }
}
