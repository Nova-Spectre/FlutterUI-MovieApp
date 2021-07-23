import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bgcontroller = PageController(initialPage: 3);
  final _cardController = PageController(initialPage: 3, viewportFraction: 0.7);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _bgPage(controller: _bgcontroller, CardContoller: _cardController),
          _cardPage(controller: _cardController, bgController: _bgcontroller)
        ],
      ),
    );
  }
}

class _bgPage extends StatelessWidget {
  final PageController controller;
  final PageController CardContoller;

  const _bgPage(
      {Key? key, required this.controller, required this.CardContoller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (page) {
        CardContoller.animateToPage(page,
            duration: const Duration(microseconds: 300),
            curve: Curves.easeInOut);
      },
      controller: controller,
      children: [
        Image.asset("assets/ic-cover.jpg", fit: BoxFit.cover),
        Image.asset("assets/dap.jpeg", fit: BoxFit.cover),
        Image.asset("assets/ps-cover.jpg", fit: BoxFit.cover),
        Image.asset("assets/bp-cover.jpg", fit: BoxFit.cover),
        Image.asset("assets/gog-cover.jpg", fit: BoxFit.cover),
        Image.asset("assets/the-shape-of-water-cover.jpg", fit: BoxFit.cover),
        Image.asset("assets/sr-cover.jpg", fit: BoxFit.cover),
        Image.asset("assets/minari_background.jpg", fit: BoxFit.cover),
      ],
    );
  }
}

class _cardPage extends StatelessWidget {
  final PageController controller;
  final PageController bgController;
  const _cardPage(
      {Key? key, required this.controller, required this.bgController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 580.0,
        child: PageView(
          controller: controller,
          onPageChanged: (page) {
            bgController.animateToPage(page,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut);
          },
          children: [
            MovieCard(image: "assets/ic-cover.jpg", name: "Inception"),
            MovieCard(image: "assets/dap.jpeg", name: "The Devil Below"),
            MovieCard(image: "assets/ps-album.jpg", name: "Parasite"),
            MovieCard(image: "assets/bp-album.jpg", name: "Black Panther"),
            MovieCard(
                image: "assets/gog-album.jpg", name: "Guardian of Galaxy"),
            MovieCard(
                image: "assets/the-shape-of-water-album.jpg",
                name: "The Shape of Water"),
            MovieCard(
                image: "assets/sr-album.jpg", name: "Shawshank Redemption"),
            MovieCard(image: "assets/minari_cover.jpg", name: "Minari"),
          ],
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String image;
  final String name;
  const MovieCard({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(55.0),
                topRight: Radius.circular(55.0))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 32.0,
                right: 32.0,
              ),
              child: Container(
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32.0),
                  child: Image.asset(image),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Center(
                child: name.length > 11
                    ? Text(
                        name,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        name,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Tag(name: "action"),
                  _Tag(name: "drama"),
                  _Tag(name: "history"),
                ],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("5.0"),
                  const SizedBox(width: 8.0),
                  Icon(Icons.star_outlined, color: Colors.yellow),
                  Icon(Icons.star_outlined, color: Colors.yellow),
                  Icon(Icons.star_outlined, color: Colors.yellow),
                  Icon(Icons.star_outlined, color: Colors.yellow),
                  Icon(Icons.star_outlined, color: Colors.yellow),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Container(
                height: 50.0,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200.0),
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    'BUY TICKET',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String name;
  const _Tag({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20.0,
              spreadRadius: 1.0),
        ],
        color: Colors.white,
      ),
      child: Text(name),
    );
  }
}
