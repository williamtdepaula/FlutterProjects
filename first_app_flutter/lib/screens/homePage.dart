import 'package:flutter/material.dart';
import 'pageOne.dart';
import 'pageTow.dart';
import 'pageThree.dart';
import '../components/Buttons/buttonDefault.dart';
import '../utils/Helper.dart';
import '../components/Drawer/DrawerDefault.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hello World'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _handleRenderBody(context),
            Container(color: Colors.yellow),
            Container(color: Colors.green)
          ],
        ),
        drawer: DrawerDefault(context),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.add),
            ),
            SizedBox(
              width: 20,
            ),
            FloatingActionButton(
              child: Icon(Icons.headset),
            ),
          ],
        ),
      ),
    );
  }

  Container _handleRenderBody(context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _handleRenderText('APP Flutter'),
          _handleRenderCarrousel(),
          _handleRenderButtons(),
        ],
      ),
    );
  }

  Container _handleRenderCarrousel() {
    return Container(
      height: 300,
      child: PageView(
        children: <Widget>[
          _handlerRenderImage('assets/imgs/dog1.png'),
          _handlerRenderImage('assets/imgs/dog2.png'),
          _handlerRenderImage('assets/imgs/dog3.png'),
          _handlerRenderImage('assets/imgs/dog4.png'),
          _handlerRenderImage('assets/imgs/dog5.png'),
        ],
      ),
    );
  }

  Builder _handleRenderButtons() {
    return Builder(builder: (BuildContext context) {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ButtonDefault(
                  'ListView', () => Helper.pushNavigatior(context, PageOne()),
                  colorButton: Colors.blue),
              ButtonDefault(
                  'Page 2', () => Helper.pushNavigatior(context, PageTwo())),
              ButtonDefault(
                  'Page 3', () => Helper.pushNavigatior(context, PageThree())),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ButtonDefault('Snack',
                  () => Helper.showSnackBar(context, 'Hello Flutter Snack')),
              ButtonDefault(
                  'Dialog', () => Helper.alert(context, 'FLUTTER DIALOG')),
              ButtonDefault('Toast', () => Helper.toast('TOASTZINHO FLUTTER')),
            ],
          ),
        ],
      );
    });
  }

  Image _handlerRenderImage(String pathImage) {
    return Image.asset(
      pathImage,
      width: 300,
      height: 300,
      fit: BoxFit.contain,
    );
  }

  Text _handleRenderText(text, {TextStyle textStyle}) {
    return Text(
      text,
      style: textStyle != null
          ? textStyle
          : TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
    );
  }
}
