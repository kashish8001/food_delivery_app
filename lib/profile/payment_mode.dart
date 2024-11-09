import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Payment Modes',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: PaymentModesScreen(),
  ));
}

class PaymentModesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Modes'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to previous screen
          },
        ),
      ),
      body: ListView(
        children: [
          PaymentModeTile(
            paymentMode: 'Credit/Debit Card',
            onTap: () {
              // Handle Credit/Debit Card selection
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CardPaymentScreen()),
              );
            },
          ),
          PaymentModeTile(
            paymentMode: 'Net Banking',
            onTap: () {
              // Handle Net Banking selection
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NetBankingScreen()),
              );
            },
          ),
          PaymentModeTile(
            paymentMode: 'UPI (Google Pay, PhonePe, etc.)',
            onTap: () {
              // Handle UPI selection
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpiPaymentScreen()),
              );
            },
          ),
          PaymentModeTile(
            paymentMode: 'Cash on Delivery',
            onTap: () {
              // Handle Cash on Delivery selection
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CashOnDeliveryScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PaymentModeTile extends StatelessWidget {
  final String paymentMode;
  final VoidCallback onTap;

  const PaymentModeTile({Key? key, required this.paymentMode, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(paymentMode),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

// Sample screen for Credit/Debit Card Payment
class CardPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credit/Debit Card Payment'),
      ),
      body: Center(
        child: Text('Credit/Debit Card payment details go here.'),
      ),
    );
  }
}

// Sample screen for Net Banking
class NetBankingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Net Banking Payment'),
      ),
      body: Center(
        child: Text('Net Banking details go here.'),
      ),
    );
  }
}

// Sample screen for UPI Payment (e.g., Google Pay, PhonePe)
class UpiPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPI Payment'),
      ),
      body: Center(
        child: Text('UPI payment details go here.'),
      ),
    );
  }
}

// Sample screen for Cash on Delivery
class CashOnDeliveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cash on Delivery'),
      ),
      body: Center(
        child: Text('Cash on Delivery details go here.'),
      ),
    );
  }
}
