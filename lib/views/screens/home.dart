import 'package:bluecs/views/widgets/drawer_widget.dart';
import 'package:bluecs/views/widgets/sections/post_section.dart';
import 'package:bluecs/views/widgets/sections/tabbar_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabController.length,
      child: Scaffold(
        drawer: DrawerSection(),
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Image.asset('assets/icons/menu.png', scale: 1.4),
              );
            },
          ),
          title: SizedBox(
            height: 45,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search here...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset("assets/icons/map.png", scale: 0.7),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined, size: 30),
            ),
          ],
        ),
        body: Column(
          children: [
            TabBarSection(
              onTap: (index) {
                _tabController.animateTo(index);
                setState(() {});
              },
              tabController: _tabController,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  PostSection(),
                  Container(
                    alignment: Alignment.center,
                    child: Text("video"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("shorts"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("nearby"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
