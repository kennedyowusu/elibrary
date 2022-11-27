import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/widgets/small_text.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({super.key, required this.text});

  final String text;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf, secondHalf;

  bool isExpanded = true;
  double textHeight = 5.58;

  @override
  initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              text: firstHalf,
              height: 1.8,
            )
          : Column(
              children: [
                SmallText(
                  text: isExpanded ? firstHalf + secondHalf : '$firstHalf...',
                ),
                InkWell(
                  onTap: () {
                    setState(
                      () {
                        isExpanded = !isExpanded;
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        isExpanded ? 'Hide Text' : 'Show Text',
                        style: TextStyle(
                          color: ProjectColors.red,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
