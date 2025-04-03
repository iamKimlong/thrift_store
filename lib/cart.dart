import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {"price": 11.99, "quantity": 1},
    {"price": 7.00, "quantity": 1},
    {"price": 8.00, "quantity": 1},
    {"price": 14.99, "quantity": 1},
  ];

  final List<String> cartList = [
    'assets/glamour_tops.jpg',
    'assets/blue_top.png',
    'assets/freak.png',
    'assets/fitted_tops.jpg',
  ];

  double get subtotal => cartItems.fold(
      0, (sum, item) => sum + (item["price"] * item["quantity"]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6CBBE),
      appBar: AppBar(
        backgroundColor: Color(0xFFD6CBBE),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("My Cart",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return _buildCartItem(index);
                },
              ),
            ),
            _buildDeliverySection(),
            _buildSummarySection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF9B6C42),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Image.asset(cartList[index],
              width: 50, height: 50, fit: BoxFit.cover),
          title: Text("\$${cartItems[index]["price"].toStringAsFixed(2)}",
              style: TextStyle(color: Colors.white, fontSize: 16)),
          trailing: _buildQuantityChanger(index),
        ),
      ),
    );
  } 


 

  Widget _buildQuantityChanger(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.remove, color: Colors.white),
          onPressed: () {
            setState(() {
              if (cartItems[index]["quantity"] > 1) {
                cartItems[index]["quantity"]--;
              }
            });
          },
        ),
        Text("${cartItems[index]["quantity"]}",
            style: TextStyle(color: Colors.white, fontSize: 16)),
        IconButton(
          icon: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            setState(() {
              cartItems[index]["quantity"]++;
            });
          },
        ),
      ],
    );
  }

  Widget _buildDeliverySection() {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF9B6C42),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delivery Method :",
                  style: TextStyle(color: Colors.white, fontSize: 14)),
              DropdownButton<String>(
                value: "Fast Delivery",
                dropdownColor: Colors.brown,
                icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                underline: SizedBox(),
                style: TextStyle(color: Colors.white),
                items:
                    ["Fast Delivery", "Standard Delivery"].map((String method) {
                  return DropdownMenuItem<String>(
                    value: method,
                    child: Text(method, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Apply Coupon",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
              child: Text("APPLY", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSummarySection() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF9B6C42),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildSummaryRow("SUBTOTAL :", "\$${subtotal.toStringAsFixed(2)}"),
          _buildSummaryRow("Delivery :", "\$0.00"),
          _buildSummaryRow("Coupon :", "\$0.00"),
          _buildSummaryRow("TOTAL :", "\$${subtotal.toStringAsFixed(2)}",
              isTotal: true),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: Size(double.infinity, 45),
            ),
            child: Text("Checkout Now",
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: isTotal ? 16 : 14,
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text(value,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: isTotal ? 16 : 14,
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
