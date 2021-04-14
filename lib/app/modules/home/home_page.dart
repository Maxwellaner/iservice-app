import 'package:app/app/modules/maindrawer/maindrawer_page.dart';
import 'package:app/app/shared/models/category_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
    controller.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iService'),
      ),
      body: Container(
        child: Observer(builder: (BuildContext context) {
          return (controller.categories == null)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : AnimationLimiter(
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(10),
                    addAutomaticKeepAlives: true,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        columnCount: 2,
                        child: ScaleAnimation(
                          child: GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Container(
                                child: Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 3, left: 15),
                                        child: CachedNetworkImage(
                                          height: 120,
                                          width: 150,
                                          placeholder: (context, url) =>
                                              new Container(
                                            color: Colors.transparent,
                                          ),
                                          imageUrl:
                                              'https://picsum.photos/200/200',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        controller.categories[index].name,
                                        style: TextStyle(
                                            fontFamily: 'Google',
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: index % 2 == 0
                                        ? Border.all(
                                            style: BorderStyle.solid,
                                            width: 10,
                                            color:
                                                Theme.of(context).primaryColor)
                                        : Border.all(
                                            width: 10,
                                            color:
                                                Theme.of(context).accentColor)),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
        }),
      ),
      drawer: MaindrawerPage(),
    );
  }
}
