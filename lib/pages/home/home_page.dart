import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travell_app/models/PlaceModel.dart';
import 'package:travell_app/pages/detail/detail_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/images/menu.svg',
                ),
              ),
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              'assets/images/logo.svg',
            ),
          ),
          centerTitle: true,
          title: Text(
            'TravellAgency',
            style: GoogleFonts.getFont('Poppins',
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        body: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  TitleContent(
                    title: 'Popular Places',
                    icon: Icons.arrow_forward_ios_rounded,
                    angelIcon: 0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                            popularPlace.length,
                            (index) => PopularPlaces(
                                  title: popularPlace[index].title,
                                  imageResource:
                                      popularPlace[index].imageResource,
                                ))
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  TitleContent(
                    title: 'More Places',
                    icon: Icons.arrow_forward_ios_rounded,
                    angelIcon: 90,
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      ...List.generate(
                          places.length,
                          (index) => MorePlaces(
                                title: places[index].title,
                                imageResources: places[index].imageResource,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 300),
                                      reverseTransitionDuration:
                                          const Duration(milliseconds: 500),
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          FadeTransition(
                                        opacity: animation,
                                        child: DetailPage(initialPage: index),
                                      ),
                                    ),
                                  );
                                },
                              ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class MorePlaces extends StatelessWidget {
  const MorePlaces({
    Key? key,
    this.title,
    this.imageResources,
    this.onTap,
  }) : super(key: key);

  final String? title, imageResources;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(imageResources!))),
                  child: Stack(children: [
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/images/like.svg',
                                width: 18,
                              )),
                          SizedBox(width: 10),
                          Text(
                            title!,
                            style: GoogleFonts.getFont('Poppins',
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TitleContent extends StatelessWidget {
  const TitleContent({
    Key? key,
    this.title,
    this.icon,
    this.angelIcon,
  }) : super(key: key);

  final String? title;
  final IconData? icon;
  final double? angelIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: GoogleFonts.getFont('Poppins',
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        Transform.rotate(
          angle: angelIcon! * math.pi / 180,
          child: Icon(
            icon,
            size: 15,
          ),
        )
      ],
    );
  }
}

class PopularPlaces extends StatelessWidget {
  const PopularPlaces({
    Key? key,
    this.imageResource,
    this.title,
  }) : super(key: key);

  final String? imageResource, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: 100,
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(imageResource!))),
            ),
            Text(
              title!,
              style: GoogleFonts.getFont('Poppins',
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
