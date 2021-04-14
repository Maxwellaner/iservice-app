import 'package:app/app/shared/stores/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'maindrawer_controller.dart';

class MaindrawerPage extends StatefulWidget {
  final String title;

  const MaindrawerPage({Key key, this.title = "Maindrawer"}) : super(key: key);

  @override
  _MaindrawerPageState createState() => _MaindrawerPageState();
}

class _MaindrawerPageState
    extends ModularState<MaindrawerPage, MaindrawerController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 30, bottom: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
                            NetworkImage(controller.authStore.client.photoUrl),
                        fit: BoxFit.fill),
                  ),
                ),
                Observer(builder: (_) {
                  return Text('${controller.authStore.client.name}');
                }),
                Observer(builder: (_) {
                  return Text(
                    '${controller.authStore.client.email}',
                    style: TextStyle(color: Colors.amber[50]),
                  );
                }),
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text(
            'Perfil',
            style: TextStyle(fontSize: 18),
          ),
          onTap: null,
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            'Configurações',
            style: TextStyle(fontSize: 18),
          ),
          onTap: null,
        ),
        ListTile(
          leading: Icon(Icons.arrow_back),
          title: Text(
            'Logout',
            style: TextStyle(fontSize: 18),
          ),
          onTap: null,
        ),
      ]),
    );
  }
}
