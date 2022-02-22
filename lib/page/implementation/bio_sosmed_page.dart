import 'package:belajar_flutter/model/animal.dart';
import 'package:flutter/material.dart';

class BioSosmedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
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
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 180),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 5, color: Colors.white)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(120),
                              child: Image.asset(
                                'asset/image/profile.jpg',
                                width: 130,
                                height: 130,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'M Ramdhan',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Text(
                            "Hi.. I'm a Mobile Flutter Developer, my specialized on Android Development.\n Beside work as Mobile Developer I also worked as Full Stack Web developer ",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Following'),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.resolveWith(
                                    (states) => RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) =>
                                            Color.fromARGB(255, 165, 72, 219)),
                              ),
                            ),
                            const SizedBox(width: 16),
                            OutlinedButton(
                              onPressed: () {},
                              child: const Text('Message'),
                              style: ButtonStyle(
                                side: MaterialStateProperty.resolveWith(
                                    (states) =>
                                        const BorderSide(color: Colors.blue)),
                                shape: MaterialStateProperty.resolveWith(
                                    (states) => RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            builtItem('Posts', '1.5k'),
                            Container(
                                height: 40, width: 3, color: Colors.purple),
                            builtItem('Followers', '49.8k'),
                            Container(
                                height: 40, width: 3, color: Colors.purple),
                            builtItem('Following', '2.5k'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Animal animal = listAnimal[index];
                      return Container(
                        width: 130,
                        margin: EdgeInsets.fromLTRB(
                          index == 0 ? 16 : 8,
                          0,
                          index == 3 ? 16 : 8,
                          0,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            animal.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(width: 8),
                      Text('See All'),
                      SizedBox(width: 8),
                      Icon(Icons.navigate_next)
                    ],
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.resolveWith((states) =>
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text('Qmun14'),
              toolbarHeight: kToolbarHeight,
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget builtItem(String title, String data) {
    return Container(
      width: 120,
      child: Column(
        children: [
          Text(data,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontSize: 14))
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
