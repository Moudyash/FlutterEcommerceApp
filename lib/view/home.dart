import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mohammed/view/util/category.dart';
import 'package:mohammed/view/util/colors.dart';
import 'package:mohammed/view/widget/coustomStagGrid.dart';
import 'package:mohammed/view/widget/drawer.dart';

import '../controller/logic/uploaddata.dart';
import 'mycategory.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData.fallback(),
            elevation: 0,
            title: Text("Home",
                style: TextStyle(color: Colors.black, fontSize: 18)),
            centerTitle: true,
            backgroundColor: MyColors.backgroundAppBar,
            actions: [
              IconButton(
                  padding: const EdgeInsets.all(20),
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/cart");
                  },
                  color: Colors.black),
            ],
          ),
          drawer: const Drawer(child: MyDrawer()),
          body: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                color: MyColors.backgroundAppBar,
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: const TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black54,
                    padding: EdgeInsets.only(right: 20),
                    isScrollable: true,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Color(0xFFF9A236),
                        border: Border(
                            top: BorderSide(width: 1, color: Color(0xEFEFEFEF)),
                            left:
                                BorderSide(width: 1, color: Color(0xEFEFEFEF)),
                            bottom:
                                BorderSide(width: 1, color: Color(0xEFEFEFEF)),
                            right: BorderSide(
                                width: 1, color: Color(0xEFEFEFEF)))),
                    tabs: [
                      Tab(
                        text: "All",
                      ),
                      Tab(
                        text: "Tables",
                      ),
                      Tab(
                        text: "Chair",
                      ),
                      Tab(
                        text: "Sofas",
                      ),
                      Tab(
                        text: "Office Tables",
                      ),
                    ]),
              ),
              Container(
                color: const Color(0xEFEFEFEF),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      StaggeredGridView.countBuilder(
                        physics: const BouncingScrollPhysics(),
                        staggeredTileBuilder: (int index) =>
                            const StaggeredTile.count(1, 1.8),
                        crossAxisCount: 2,
                        itemCount: CategoryAllList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomStagGrid(
                              onPress: () {
                                uploadData(index, CategoryAllList);
                              },
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return MyCategory(
                                          categoryModel:
                                              CategoryAllList[index]);
                                    },
                                  )),
                              label: "${CategoryAllList[index].name}",
                              image: "${CategoryAllList[index].image}",
                              description:
                                  "${CategoryAllList[index].description}",
                              price: "${CategoryAllList[index].price}");
                        },
                      ),
                      StaggeredGridView.countBuilder(
                        physics: const BouncingScrollPhysics(),
                        staggeredTileBuilder: (int index) =>
                            const StaggeredTile.count(1, 1.8),
                        crossAxisCount: 2,
                        itemCount: CategoryList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomStagGrid(
                              onPress: () => uploadData(index, CategoryAllList),
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return MyCategory(
                                          categoryModel: CategoryList[index]);
                                    },
                                  )),
                              label: "${CategoryList[index].name}",
                              image: "${CategoryList[index].image}",
                              description: "${CategoryList[index].description}",
                              price: "${CategoryList[index].price}");
                        },
                      ),
                      StaggeredGridView.countBuilder(
                        physics: const BouncingScrollPhysics(),
                        staggeredTileBuilder: (int index) =>
                            const StaggeredTile.count(1, 1.8),
                        crossAxisCount: 2,
                        itemCount: CategoryTableList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomStagGrid(
                              onPress: () =>
                                  uploadData(index, CategoryTableList),
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return MyCategory(
                                          categoryModel:
                                              CategoryTableList[index]);
                                    },
                                  )),
                              label: "${CategoryTableList[index].name}",
                              image: "${CategoryTableList[index].image}",
                              description:
                                  "${CategoryTableList[index].description}",
                              price: "${CategoryTableList[index].price}");
                        },
                      ),
                      StaggeredGridView.countBuilder(
                        physics: const BouncingScrollPhysics(),
                        staggeredTileBuilder: (int index) =>
                            const StaggeredTile.count(1, 1.8),
                        crossAxisCount: 2,
                        itemCount: CategorySofaList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomStagGrid(
                              onPress: () =>
                                  uploadData(index, CategorySofaList),
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return MyCategory(
                                          categoryModel:
                                              CategorySofaList[index]);
                                    },
                                  )),
                              label: "${CategorySofaList[index].name}",
                              image: "${CategorySofaList[index].image}",
                              description:
                                  "${CategorySofaList[index].description}",
                              price: "${CategorySofaList[index].price}");
                        },
                      ),
                      StaggeredGridView.countBuilder(
                        physics: const BouncingScrollPhysics(),
                        staggeredTileBuilder: (int index) =>
                            const StaggeredTile.count(1, 1.8),
                        crossAxisCount: 2,
                        itemCount: CategoryDeskList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomStagGrid(
                              onPress: () =>
                                  uploadData(index, CategoryDeskList),
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return MyCategory(
                                          categoryModel:
                                              CategoryDeskList[index]);
                                    },
                                  )),
                              label: "${CategoryDeskList[index].name}",
                              image: "${CategoryDeskList[index].image}",
                              description:
                                  "${CategoryDeskList[index].description}",
                              price: "${CategoryDeskList[index].price}");
                        },
                      ),
                    ]),
              )
            ],
          )),
    );
  }
}
