import 'package:cars_flutter/utils/Api.dart';
import 'package:cars_flutter/widgets/Drawer/DrawerDefault.dart';
import 'package:cars_flutter/widgets/List/ListCars.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {//Listener toda vez que mudar o estado do TabController
      print(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros Flutter'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Carros'),
            Tab(text: 'Esportivos'),
            Tab(text: 'Luxo'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListCars(TypeCar.classics),
          ListCars(TypeCar.sporting),
          ListCars(TypeCar.lux),
        ],
      ),
      drawer: DrawerDefault(),
    );
  }
}
