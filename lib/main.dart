import 'package:flutter/material.dart';

void main() {
  runApp(LightControlApp());
}

class LightControlApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SenseTech',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFF6495ED),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xFFFDFEFE),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "SenseTech",
            style: TextStyle(
              fontFamily: 'Times New Roman',
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Color(0xFF6495ED),
        elevation: 0,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LampSelectionScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
          ),
          child: Text(
            'Вибір лампочки',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class LampSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вибір лампочки'),
        backgroundColor: Color(0xFF6495ED),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Оберіть лампочку:',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LightControlScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
              ),
              child: Text(
                'Лампочка 1',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LightControlScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
              ),
              child: Text(
                'Лампочка 2',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LightControlScreen extends StatefulWidget {
  @override
  _LightControlScreenState createState() => _LightControlScreenState();
}

class _LightControlScreenState extends State<LightControlScreen> {
  int _brightness = 50;
  bool _isAutoControlEnabled = false;

  void _increaseBrightness() {
    setState(() {
      if (_brightness < 100) _brightness += 10;
    });
  }

  void _decreaseBrightness() {
    setState(() {
      if (_brightness > 0) _brightness -= 10;
    });
  }

  void _toggleAutoControl() {
    setState(() {
      _isAutoControlEnabled = !_isAutoControlEnabled;
      if (_isAutoControlEnabled) {
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Регулятор світла'),
        backgroundColor: Color(0xFF6495ED),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isAutoControlEnabled)
              Column(
                children: [
                  Icon(
                    Icons.lightbulb,
                    size: 100,
                    color: Colors.yellow.withOpacity(_brightness / 100),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Зараз ви в автоматичному режимі',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              )
            else
              Column(
                children: [
                  Icon(
                    Icons.lightbulb,
                    size: 100,
                    color: Colors.yellow.withOpacity(_brightness / 100),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Яскравість: $_brightness%',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _decreaseBrightness,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                        ),
                        child: Text('-'),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: _increaseBrightness,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                        ),
                        child: Text('+'),
                      ),
                    ],
                  ),
                ],
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleAutoControl,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: Text(_isAutoControlEnabled
                  ? 'Вимкнути автоматичне регулювання'
                  : 'Увімкнути автоматичне регулювання'),
            ),
          ],
        ),
      ),
    );
  }
}
