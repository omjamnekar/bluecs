import 'package:bluecs/models/post.dart';
import 'package:flutter/material.dart';

class QuestionPanel extends StatefulWidget {
  final PostModel postModel;
  QuestionPanel({super.key, required this.postModel});

  @override
  State<QuestionPanel> createState() => _QuestionPanelState();
}

class _QuestionPanelState extends State<QuestionPanel> {
  List<String> questionIndex = ["A", "B", "C", "D", "E"];
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 20),
      itemBuilder: (context, index) {
        bool isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 30,
                  child: Text(
                    questionIndex[index],
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 25),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: isSelected
                          ? null
                          : Border.all(
                              color: Theme.of(context).primaryColorLight),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      widget.postModel.question!.options[index],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: isSelected
                              ? Colors.white
                              : Theme.of(context).textTheme.titleMedium?.color),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
