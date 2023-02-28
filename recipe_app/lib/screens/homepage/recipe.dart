// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class RecipeScreen extends StatefulWidget {
//   const RecipeScreen({super.key});

//   @override
//   State<RecipeScreen> createState() => _RecipeScreenState();
// }

// class _RecipeScreenState extends State<RecipeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'app_column.dart';

class PlaceDetails extends StatefulWidget {
  const PlaceDetails({Key? key}) : super(key: key);

  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails>
    with TickerProviderStateMixin {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8; // show the 80% of original size
  double _height = 220;

  @override
  // for zooming of each container
  // method inside staful cls only
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  // dispose the pagecontroller when we leave the page
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    //using api of flutter
    //dart coding
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var _currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - _currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currentScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var _currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - _currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, _currentScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var _currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - _currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, _currentScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var _currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, _currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            Flexible(
              flex: 0,
              child: Stack(children: [
                Container(
                  height: 200,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:
                          index.isEven ? Color(0xFF69C5DF) : Color(0xFF9294CC),
                      image: const DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(""))),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 110,
                    margin: EdgeInsets.only(left: 50, right: 50, bottom: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                      // child: AppColumn(),
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(height: 50),
            Flexible(
              flex: 0,
              child: Stack(children: [
                Container(
                  height: 200,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:
                          index.isEven ? Color(0xFF69C5DF) : Color(0xFF9294CC),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(""))),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 110,
                    margin: EdgeInsets.only(left: 50, right: 50, bottom: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                      // child: AppColumn(),
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      )),
    );
  }
}
