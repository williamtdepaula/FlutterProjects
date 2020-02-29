import 'package:cars_flutter/utils/Api.dart';
import 'package:cars_flutter/utils/Prefs.dart';
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
    //Não pode ser as
    super.initState();

    _initTabs();
  }

  Future _initTabs() async {
    int lastIndex = await Prefs.getInt('tabIndex');

    //Após ter o index, cria a TabController, pois ela era nula
    _tabController = TabController(length: 3, vsync: this);

    setState(() {//Manda atualizar a tela e coloca qual indice deve iniciar
      _tabController.index = lastIndex;//ESTÁ LINHA N PRECISA ESTAR AQUI, PODE ESTAR ANTES DO SETSTATE, POIS O SETSTATE SÓ FAZ A TELA DESENHAR NOVAMENTE
    });

    _tabController.addListener(() {
      //Listener toda vez que mudar o estado do TabController
      Prefs.setInt('tabIndex', _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        bottom: _tabController == null
            ? null
            : TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                    text: "Clássicos",
                  ),
                  Tab(
                    text: "Esportivos",
                  ),
                  Tab(
                    text: "Luxo",
                  )
                ],
              ),
      ),
      body: _tabController == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : TabBarView(
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
