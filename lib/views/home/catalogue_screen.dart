import 'package:balenciaga_ecommerce/views/home/components/appbar.dart';
import 'package:balenciaga_ecommerce/views/home/components/bottom_navbar.dart';
import 'package:balenciaga_ecommerce/views/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  int _selectedIndex = 0;
  
  final List<Widget> _widgetOptions = [
    // TODO: menampilkan list dari widget yang akan ditampilkan di bottom navbar
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0 ? CatalogueAppBar() : null,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFF69170),
                      Color(0xFF7D96E6),
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 16.0, left: 16.0),
                          child: Text(
                            "Hi! You Can Ask Me",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text(
                            "Anything",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 16.0, bottom: 16.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/chat');
                            },
                            style: ButtonStyle(
                              // ignore: deprecated_member_use
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              // ignore: deprecated_member_use
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child:
                               GradientText(
                                text: "Ask Now!",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold
                              ),
                              gradient:  LinearGradient(
                                colors: [
                      Color(0xFFF69170),
                      Color(0xFF7D96E6),
                    ],
                               
                              ),
                              ), 
                              
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 16.0),
            child: DecoratedBox(decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/icon.png")
               ),
          
            ),
            child: SizedBox(height: 150, width: 150),
            ),
            )
          ],
        ),
        
      ),
      bottomNavigationBar: BottomNavbar(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped) 
    );
  }
}