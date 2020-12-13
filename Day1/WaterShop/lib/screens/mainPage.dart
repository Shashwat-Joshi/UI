import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'allCatalogs.dart';

Container catalog(Color left, Color right, String text) {
  return Container(
    margin: EdgeInsets.only(right: 20.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.topRight,
        colors: [left, right],
      ),
    ),
    height: 165.0,
    width: 165.0,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: GoogleFonts.dmSans(
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          width: 120.0,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 0.0,
            color: Colors.white,
            onPressed: () {},
            child: Text(
              'Show all',
              style: GoogleFonts.dmSans(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Color(0xff363E52),
              ),
            ),
            highlightElevation: 0.0,
            focusElevation: 0.0,
            disabledElevation: 0.0,
            hoverElevation: 0.0,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
        )
      ],
    ),
  );
}

Container mainPage(Size size, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              'Water Shop',
              style: GoogleFonts.dmSans(
                fontSize: 32.0,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                color: Color(0xff363E52),
              ),
            ),
          ),
          Container(
            height: 57.0,
            decoration: BoxDecoration(
              color: Color(0xffECEDEF),
              borderRadius: BorderRadius.circular(25.0),
            ),
            margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
            child: TextFormField(
              cursorColor: Colors.pink[300],
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xff363E52),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
            child: Card(
              margin: EdgeInsets.all(0.0),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Container(
                height: size.height > size.width
                    ? size.height / 3.7
                    : size.width / 3.7,
                width: size.height > size.width ? size.width : size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/mainImage.PNG'),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Catalog',
                  style: GoogleFonts.dmSans(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff363E52),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => AllCatalogs()));
                  },
                  child: Text(
                    'see all >',
                    style: GoogleFonts.dmSans(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(),
            margin: EdgeInsets.only(top: 25.0),
            child: Stack(
              children: [
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: catalog(
                            Colors.lightBlue, Colors.lightBlue[200], 'Bottles'),
                      ),
                      catalog(Colors.pink, Colors.pink[200], 'Coolers'),
                      catalog(Colors.orange, Colors.orange[200], 'Ice Creams'),
                    ],
                  ),
                ),
                Positioned(
                  left: 0.0,
                  child: Container(
                    width: 20.0,
                    height: 175.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.white.withOpacity(0.9),
                          Colors.white.withOpacity(0.05)
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0.0,
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: 20.0,
                    height: 175.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.white.withOpacity(0.001),
                          Colors.white.withOpacity(0.9)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
