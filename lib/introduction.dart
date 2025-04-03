import 'package:flutter/material.dart';
import 'package:thrift_store/welcome.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Map<String, String>> introData = [
    {
      "image": "assets/pozz.png", // Add your local image paths here
      "title": "Explore Style",
      "description":
          "Unleash your unique fashion sense by discovering endless styles, all tailored to you, right at your fingertips with Find Style.",
    },
    {
      "image": "assets/zeii.png", // Add your local image paths here
      "title": "Do What Inspires You",
      "description":
          "Let your style reflect your passion, embracing what drives you and expressing who you truly are.",
    },
    {
      "image": "assets/black.png", // Add your local image paths here
      "title": "Find Your Outfit",
      "description":
          "Find Your Outfit with ease, explore a curated selection of styles that reflect your personality, and create the perfect look for any occasion—your wardrobe, your way.",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              itemCount: introData.length,
              itemBuilder: (context, index) => IntroContent(
                image: introData[index]["image"]!,
                title: introData[index]["title"]!,
                description: introData[index]["description"]!,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    introData.length,
                    (index) => buildDot(index: index),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage == introData.length - 1) {
                        // You can navigate to the next screen here after the last slide
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomePage()));
                      } else {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Text(
                      _currentPage == introData.length - 1
                          ? "Get Started"
                          : "Next",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: _currentPage == index ? 20 : 10,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.brown : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class IntroContent extends StatelessWidget {
  const IntroContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            width: MediaQuery.sizeOf(context).width,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
