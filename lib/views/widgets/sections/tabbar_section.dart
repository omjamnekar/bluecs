import 'package:bluecs/views/widgets/tabs_widget.dart';
import 'package:flutter/material.dart';

class TabBarSection extends StatefulWidget {
  TabController tabController;
  Function(int) onTap;
  TabBarSection({super.key, required this.tabController, required this.onTap});

  @override
  State<TabBarSection> createState() => _TabSectionState();
}

class _TabSectionState extends State<TabBarSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10, top: 30, bottom: 10),
      child: TabBar(
        isScrollable: true,
        controller: widget.tabController,
        tabAlignment: TabAlignment.start,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        padding: EdgeInsets.zero,
        labelPadding:
            EdgeInsets.only(left: 10, right: 0), // Removes gap between tabs
        tabs: [
          TabsWidget(
              onTap: () => widget.onTap(0),
              text: "All Posts",
              isActive: widget.tabController.index == 0 ? true : false),
          TabsWidget(
              onTap: () => widget.onTap(1),
              text: "Videos",
              isActive: widget.tabController.index == 1 ? true : false),
          TabsWidget(
              onTap: () => widget.onTap(2),
              text: "Short Videos",
              isActive: widget.tabController.index == 2 ? true : false),
          TabsWidget(
              onTap: () => widget.onTap(3),
              text: "Nearby",
              isActive: widget.tabController.index == 3 ? true : false),
        ],
      ),
    );
  }
}
