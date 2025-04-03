import 'package:flutter/material.dart';

class MyFavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6CBBE),
      appBar: AppBar(
        backgroundColor: Color(0xFFD6CBBE),
        elevation: 0,
        title: Text(
          "Favorite",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            FavItem(imagePath: 'assets/glamour_tops.jpg', price: "\$11.99"),
            FavItem(imagePath: 'assets/freak.png', price: "\$8.00"),
            FavItem(imagePath: 'assets/blue_top.png', price: "\$7.00"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text("Buy Now"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}

class FavItem extends StatelessWidget {
  final String imagePath;
  final String price;

  const FavItem({required this.imagePath, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.brown[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Text(
                "Image Not Found",
                style: TextStyle(color: Colors.red),
              );
            },
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                price,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Row(
                children: [
                  DropdownButton<String>(
                    value: "Blue",
                    onChanged: (String? newValue) {},
                    items: ["Blue", "Red", "Black"]
                        .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ))
                        .toList(),
                  ),
                  SizedBox(width: 10),
                  DropdownButton<String>(
                    value: "S",
                    onChanged: (String? newValue) {},
                    items: ["S", "M", "L"]
                        .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ))
                        .toList(),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
