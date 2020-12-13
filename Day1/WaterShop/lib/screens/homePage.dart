import 'package:WaterShop/screens/mainPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 1;
  Container bottomNavItem(var icon, Size size, int index) {
    return Container(
      width: size.width / 4,
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Center(
          child: Icon(
            icon,
            size: index == _selectedIndex ? 30.0 : 28.0,
            color:
                index == _selectedIndex ? Color(0xff363E52) : Colors.grey[400],
          ),
        ),
      ),
    );
  }

  Container bodyWidgets(Size size, BuildContext context) {
    switch (_selectedIndex) {
      case 0:
        return Container(
          child: Center(
            child: Text('Screen 1'),
          ),
        );
        break;
      case 1:
        return mainPage(size, context);
        break;
      case 2:
        return Container(
          child: Center(
            child: Text('Screen 2'),
          ),
        );
        break;
      case 3:
        return Container(
          child: Center(
            child: Text('Screen 3'),
          ),
        );
        break;
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Icon(
                Icons.shopping_cart_sharp,
                color: Color(0xff363E52),
                size: 30.0,
              ),
            ),
          ],
        ),
        body: bodyWidgets(size, context),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: 13.0),
          height: 70.0,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bottomNavItem(Icons.view_agenda_outlined, size, 0),
              bottomNavItem(Icons.apps, size, 1),
              bottomNavItem(Icons.favorite_border_outlined, size, 2),
              bottomNavItem(Icons.person_outline_rounded, size, 3),
            ],
          ),
        ),
      ),
    );
  }
}
