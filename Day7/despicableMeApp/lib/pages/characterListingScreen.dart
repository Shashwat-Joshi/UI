import 'package:despicableMeApp/models/characters.dart';
import 'package:despicableMeApp/styleGuide.dart';
import 'package:despicableMeApp/widgets/characterWidget.dart';
import 'package:flutter/material.dart';

class CharacterListingScreen extends StatefulWidget {
  @override
  _CharacterListingScreenState createState() => _CharacterListingScreenState();
}

class _CharacterListingScreenState extends State<CharacterListingScreen> {
  PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 1.0,
      keepPage: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 32.0, top: 8.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Despicable Me',
                      style: AppTheme.display1,
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Characters',
                      style: AppTheme.display2,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                controller: _pageController,
                physics: BouncingScrollPhysics(),
                children: [
                  for (int i = 0; i < characters.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 25.0,
                        horizontal: 25.0,
                      ),
                      child: CharacterWidget(
                        character: characters[i],
                        controller: _pageController,
                        currentPage: _currentPage,
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
}
