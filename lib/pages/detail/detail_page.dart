import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travell_app/animation/FadeAnimation.dart';
import 'package:travell_app/models/PlaceModel.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.initialPage}) : super(key: key);

  final int initialPage;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  PageController? _pageController;
  void onScroll() {
    print("Scroll");
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
    )..addListener(onScroll);
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white10,
        body: PageView(
          controller: _pageController,
          children: [
            ...List.generate(
                places.length,
                (index) => ItemPage(
                      page: index + 1,
                      title: places[index].title,
                      description: places[index].description,
                      imageResource: places[index].imageResource,
                    ))
          ],
        ));
  }
}

class ItemPage extends StatelessWidget {
  const ItemPage(
      {Key? key, this.title, this.description, this.imageResource, this.page})
      : super(key: key);

  final String? title, description, imageResource;
  final int? page;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage(imageResource!)),
      ),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
          0.3,
          0.9
        ], colors: [
          Colors.black.withOpacity(0.60),
          Colors.black.withOpacity(.2),
        ])),
        child: Padding(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        FadeAnimation(
                            delay: 1,
                            child: Text(
                              page.toString(),
                              style: GoogleFonts.getFont('Poppins',
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            )),
                        Text(
                          '/' + places.length.toString(),
                          style: GoogleFonts.getFont('Poppins',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        delay: 2,
                        child: Row(
                          children: [
                            Text(
                              title!,
                              style: GoogleFonts.getFont('Poppins',
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/images/best.svg',
                              width: 20,
                            )
                          ],
                        )),
                    SizedBox(height: 10),
                    FadeAnimation(
                      delay: 2.5,
                      child: Text(
                        description!,
                        style: GoogleFonts.getFont('Poppins',
                            color: Colors.white,
                            fontSize: 14,
                            height: 1.5,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(height: 10),
                    FadeAnimation(
                        delay: 3,
                        child: Text(
                          'REED MORE >',
                          style: GoogleFonts.getFont('Poppins',
                              color: Color(0xFFDDF001),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ))
              ],
            ),
            padding: EdgeInsets.all(20)),
      ),
    );
  }
}
