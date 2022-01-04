import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isMonthly = true;
  TextStyle textStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Color(0xff6d708d),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f6fe),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 64,
                ),
                const Text(
                  'Our Pricing',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Annually',
                      style: textStyle,
                    ),
                    const SizedBox(width: 16),
                    CupertinoSwitch(
                      activeColor: const Color(0xff696fdd),
                      trackColor: const Color(0xff696fdd),
                      value: _isMonthly,
                      onChanged: (value) {
                        setState(() {
                          _isMonthly = value;
                        });
                      },
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Monthly',
                      style: textStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 64,
                ),
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    if (constraints.maxWidth > 1200) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Package(
                            name: 'Basic',
                            price: _isMonthly ? '19.99' : '199.99',
                            storage: '500 GB',
                            usersAllowed: '2',
                            sendUpTo: '3 GB',
                            isColored: false,
                            isBigger: false,
                          ),
                          Package(
                            name: 'Professional',
                            price: _isMonthly ? '24.99' : '249.99',
                            storage: '1 TB',
                            usersAllowed: '5',
                            sendUpTo: '10 GB',
                            isColored: true,
                            isBigger: true,
                          ),
                          Package(
                            name: 'Master',
                            price: _isMonthly ? '39.99' : '399.99',
                            storage: '2 TB',
                            usersAllowed: '10',
                            sendUpTo: '20 GB',
                            isColored: false,
                            isBigger: false,
                          )
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Package(
                            name: 'Basic',
                            price: _isMonthly ? '19.99' : '199.99',
                            storage: '500 GB',
                            usersAllowed: '2',
                            sendUpTo: '3 GB',
                            isColored: false,
                            isBigger: false,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Package(
                            name: 'Professional',
                            price: _isMonthly ? '24.99' : '249.99',
                            storage: '1 TB',
                            usersAllowed: '5',
                            sendUpTo: '10 GB',
                            isColored: true,
                            isBigger: false,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Package(
                            name: 'Master',
                            price: _isMonthly ? '39.99' : '399.99',
                            storage: '2 TB',
                            usersAllowed: '10',
                            sendUpTo: '20 GB',
                            isColored: false,
                            isBigger: false,
                          )
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Package extends StatefulWidget {
  const Package({
    Key? key,
    required this.name,
    required this.price,
    required this.storage,
    required this.usersAllowed,
    required this.sendUpTo,
    required this.isColored,
    required this.isBigger,
  }) : super(key: key);

  final String name;
  final String price;
  final String storage;
  final String usersAllowed;
  final String sendUpTo;
  final bool isColored;
  final bool isBigger;

  @override
  _PackageState createState() => _PackageState();
}

class _PackageState extends State<Package> {
  Divider divider = const Divider(
    height: 30,
    thickness: 1,
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              widget.isColored ? const Color(0xffa3a8f0) : Colors.white,
              widget.isColored ? const Color(0xff696fdd) : Colors.white,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff696fdd).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 16), // changes position of shadow
            ),
          ],
        ),
        constraints: const BoxConstraints(maxWidth: 350),
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(
              height: widget.isBigger ? 24 : 0,
            ),
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 20,
                color: widget.isColored ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$ ',
                  style: TextStyle(
                    fontSize: 32,
                    color: widget.isColored ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  widget.price,
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: widget.isColored ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            divider,
            Text(
              "${widget.storage} Storage",
              style: TextStyle(
                fontSize: 16,
                color: widget.isColored ? Colors.white : Colors.black,
              ),
            ),
            divider,
            Text(
              "${widget.usersAllowed} Users Allowed",
              style: TextStyle(
                fontSize: 16,
                color: widget.isColored ? Colors.white : Colors.black,
              ),
            ),
            divider,
            Text(
              "Send up to ${widget.sendUpTo}",
              style: TextStyle(
                fontSize: 16,
                color: widget.isColored ? Colors.white : Colors.black,
              ),
            ),
            divider,
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary:
                    widget.isColored ? const Color(0xff696fdd) : Colors.white,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
                primary:
                    widget.isColored ? Colors.white : const Color(0xff696fdd),
                minimumSize: const Size.fromHeight(45),
              ),
              onPressed: () => {},
              child: const Text('LEARN MORE'),
            ),
            SizedBox(
              height: widget.isBigger ? 24 : 0,
            ),
          ],
        ),
      ),
    );
  }
}
