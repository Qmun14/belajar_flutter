import 'dart:ui';

import 'package:flutter/material.dart';

class StylingPage extends StatefulWidget {
  @override
  _StylingPageState createState() => _StylingPageState();
}

class _StylingPageState extends State<StylingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Styling Page'), titleSpacing: 0),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          ListTile(title: const Text('Opacity'), tileColor: Colors.grey[400]),
          const SizedBox(height: 8),
          Center(
            child: Opacity(
              opacity: 0.5,
              child: Container(
                color: Colors.amber,
                height: 150,
                width: 150,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            title: const Text('BackDrop Filter'),
            tileColor: Colors.grey[400],
          ),
          const SizedBox(height: 8),
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Stack(
                children: [
                  Text('0' * 500),
                  Center(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 5,
                          sigmaY: 5,
                        ),
                        child: Container(
                          height: 200,
                          width: 200,
                          // color: Colors.red[600],
                          alignment: Alignment.center,
                          child: Text('Hello World!'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
              title: const Text('Rotated Box'), tileColor: Colors.grey[400]),
          const SizedBox(height: 8),
          Center(
            child: RotatedBox(
              quarterTurns: 3,
              child: Container(
                color: Colors.amber,
                height: 30,
                width: 100,
                alignment: Alignment.center,
                child: const Text('Rotate Box'),
              ),
            ),
          ),
          const SizedBox(height: 8),
          ListTile(title: const Text('ClipRect'), tileColor: Colors.grey[400]),
          const SizedBox(height: 8),
          Center(
            child: ClipRect(
              child: Align(
                alignment: Alignment.center,
                heightFactor: 0.7,
                widthFactor: 0.5,
                child: Image.asset('asset/image/animal/burung.jpg'),
              ),
            ),
          ),
          const SizedBox(height: 8),
          ListTile(title: const Text('Clip Oval'), tileColor: Colors.grey[400]),
          const SizedBox(height: 8),
          Center(
            child: ClipOval(
              child: Align(
                alignment: Alignment.center,
                heightFactor: 0.7,
                widthFactor: 0.5,
                child: Image.asset('asset/image/animal/burung.jpg'),
              ),
            ),
          ),
          const SizedBox(height: 200),
          ListTile(title: const Text('Clip Path'), tileColor: Colors.grey[400]),
          SizedBox(
            height: 550,
            child: ClipPath(
              clipper: _CustomClipPath(),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.purple,
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;

    path.lineTo(0, height);
    path.quadraticBezierTo(0, height - 300, width, 180);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
