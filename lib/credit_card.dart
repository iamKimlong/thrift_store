import 'package:flutter/material.dart';

class CreditCardScreen extends StatefulWidget {
  @override
  _CreditCardScreenState createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  bool saveCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6CBBE), // Beige background
      appBar: AppBar(
        backgroundColor: Color(0xFFD6CBBE),
        elevation: 0,
        title: Text(
          "Credit Card/Debit Card",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField("Card Number"),
            Row(
              children: [
                Expanded(child: _buildTextField("Expired Date")),
                SizedBox(width: 10),
                Expanded(child: _buildTextFieldWithIcon("CVV", Icons.help_outline)),
              ],
            ),
            _buildTextFieldWithIcon("Name on card", Icons.help_outline),
            SizedBox(height: 20),

            // Save Card Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Save Card", style: TextStyle(fontSize: 16)),
                Switch(
                  value: saveCard,
                  activeColor: Colors.brown,
                  onChanged: (value) {
                    setState(() {
                      saveCard = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),

            // Confirm Selection Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Confirm Selection"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.brown,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white70),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildTextFieldWithIcon(String hint, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.brown,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white70),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          suffixIcon: Icon(icon, color: Colors.white),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
