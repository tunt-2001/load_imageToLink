import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ImageScreen(),
    );
  }
}
class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late String _imageLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter Image Link:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Container(
              width: 300.0,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'https://example.com/image.jpg',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _imageLink = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text('View Image'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageViewScreen(imageLink: _imageLink),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ImageViewScreen extends StatelessWidget {
  final String imageLink;

  ImageViewScreen({required this.imageLink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image View'),
      ),
      body: Center(
        child: Image.network(imageLink),
      ),
    );
  }
}
