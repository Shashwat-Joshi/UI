import 'package:WaterShop/data/costData.dart';
import 'package:WaterShop/widgets/plusminusWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BucketScreen extends StatefulWidget {
  @override
  _BucketScreenState createState() => _BucketScreenState();
}

class _BucketScreenState extends State<BucketScreen> {
  bucketItems(int index) {
    return Container(
      height: 130.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100],
            offset: Offset(0.0, 1.0),
            blurRadius: 20.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Image(
              height: 130.0,
              width: 105.0,
              image: AssetImage(imageLocation[index]),
              fit: BoxFit.fill,
            ),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                width: 180.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      title[index],
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Text(
                      subTitle[index],
                      style: GoogleFonts.dmSans(
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${cost[index]}',
                            style: GoogleFonts.dmSans(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                            ),
                          ),
                          plusMinus,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 5.0),
            child: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xff363E52),
                  size: 22.0,
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              elevation: 0.0,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                'Basket',
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff363E52),
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: title.length,
            itemBuilder: (BuildContext context, int index) =>
                bucketItems(index),
          ),
        ),
        bottomNavigationBar: Container(
          height: 110.0,
          decoration: BoxDecoration(
            color: Color(0xffF17D9F),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45.0),
              topRight: Radius.circular(45.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 35.0),
                child: Text(
                  '\$$totalCost',
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 27.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 35.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                  elevation: 0.0,
                  focusElevation: 0.0,
                  highlightElevation: 0.0,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  color: Color(0xff2AA7C4),
                  onPressed: () {},
                  child: Text(
                    'Pay',
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
