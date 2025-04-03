import 'package:flutter/material.dart';

class AddAddressScreen extends StatefulWidget {
  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  bool isShippingDefault = true;
  bool isBillingDefault = true;
  String addressType = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6CBBE), // Beige background
      appBar: AppBar(
        backgroundColor: Color(0xFFD6CBBE),
        elevation: 0,
        title: Text(
          "Add Shipping Address",
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
            _buildTextField("First Name"),
            _buildTextField("Last Name"),
            _buildTextField("Email Address"),
            _buildTextField("Street Address"),
            Row(
              children: [
                Expanded(child: _buildTextField("Country")),
                SizedBox(width: 10),
                Expanded(child: _buildTextField("City/Province")),
              ],
            ),
            _buildTextField("Enter your Phone Number"),
            SizedBox(height: 20),

            // Address Type Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Address Type"),
                Row(
                  children: [
                    _buildRadioButton("Home"),
                    _buildRadioButton("Office"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),

            // Default Shipping Address Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Default Shipping Address"),
                Row(
                  children: [
                    _buildSwitch("On", isShippingDefault, (value) {
                      setState(() {
                        isShippingDefault = value;
                      });
                    }),
                    _buildSwitch("Off", !isShippingDefault, (value) {
                      setState(() {
                        isShippingDefault = !value;
                      });
                    }),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),

            // Default Billing Address Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Default Billing Address"),
                Row(
                  children: [
                    _buildSwitch("On", isBillingDefault, (value) {
                      setState(() {
                        isBillingDefault = value;
                      });
                    }),
                    _buildSwitch("Off", !isBillingDefault, (value) {
                      setState(() {
                        isBillingDefault = !value;
                      });
                    }),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Save Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Save"),
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

  Widget _buildRadioButton(String title) {
    return Row(
      children: [
        Radio(
          value: title,
          groupValue: addressType,
          activeColor: Colors.brown,
          onChanged: (value) {
            setState(() {
              addressType = value.toString();
            });
          },
        ),
        Text(title),
      ],
    );
  }

  Widget _buildSwitch(String title, bool value, Function(bool) onChanged) {
    return Row(
      children: [
        Text(title),
        Switch(
          value: value,
          activeColor: Colors.brown,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
