import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder: (context) {
        return MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: HomeScreen(),
      );
    });
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Widget buildPortrait() {
    var myItems = [
      {"img": "https://picsum.photos/250?image=1", "title": "Img-1"},
      {"img": "https://picsum.photos/250?image=2", "title": "Img-2"},
      {"img": "https://picsum.photos/250?image=3", "title": "Img-3"},
      {"img": "https://picsum.photos/250?image=4", "title": "Img-4"},
      {"img": "https://picsum.photos/250?image=5", "title": "Img-5"},
      {"img": "https://picsum.photos/250?image=6", "title": "Img-6"},
    ];
    return //Text('Portrait');
        Column(
      children: [
        Expanded(
            flex: 15,
            child: Container(
              //color: Colors.grey,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://googleflutter.com/sample_image.jpg'),
                    fit: BoxFit.fill),
              ),
            )),
        Expanded(
          flex: 3,
          //  child: Container(
          //color: Colors.lightGreenAccent,
          child: Text(
            'John Doe',
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
          ),
          //  )
        ),
        Expanded(
          flex: 6,
          //  child:Container(
          //color: Colors.amber,
          child: Wrap(
            alignment: WrapAlignment.start,
            children: [
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aliquet turpis eu enim tristique, in iaculis libero porttitor.',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          // )
        ),
        Expanded(
          flex: 10,
          child:
              //Container(color: Colors.pink,)
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1.sp,
                  ),
                  itemCount: myItems.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        child: Container(
                      //color: Colors.green,
                      margin: const EdgeInsets.all(3),
                      child: Image.network(myItems[index]['img']!,
                          fit: BoxFit.fill),
                    ));
                  }),
        )
      ],
    );
  }

  Widget buildLandscape() {
    var myItems = [
      {"img": "https://picsum.photos/250?image=1", "title": "Img-1"},
      {"img": "https://picsum.photos/250?image=2", "title": "Img-2"},
      {"img": "https://picsum.photos/250?image=3", "title": "Img-3"},
      {"img": "https://picsum.photos/250?image=4", "title": "Img-4"},
      {"img": "https://picsum.photos/250?image=5", "title": "Img-5"},
      {"img": "https://picsum.photos/250?image=6", "title": "Img-6"},
    ];
    //return Text('Landscape');
    return //Text('Portrait');
        Row(
      children: [
        Expanded(
            flex: 5,
            child: Container(
              //color: Colors.grey,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://googleflutter.com/sample_image.jpg'),
                    fit: BoxFit.fill),
              ),
            )),
        Expanded(
          flex: 10,
          child: Container(
            //color: Colors.lightGreenAccent,
            //child: Text('John Doe',style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),),
            child: Stack(
              children: [
                Container(
                  width: 550,
                  height: 300,
                //  color: Colors.red,
                  child: Text(
                    'John Doe',
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom : 200,
                          left : 0,
                          //children: [
                          child: Container(
                              width: 550,
                              height: 70,
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              children: [
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aliquet turpis eu enim tristique, in iaculis libero porttitor.',
                                  style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                           //   color: Colors.green,
                            )
                        //],
                        ),
                      Positioned(
                        bottom: 0, //move 15p up from bottom
                        left: 0, // move 10p right from left
                        child: Container(
                          width: 550,
                          height: 210,
                          //color: Colors.amber,
                          child:
                          //Container(color: Colors.pink,)
                          GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 1.sp,
                              ),
                              itemCount: myItems.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                    child: Container(
                                      //color: Colors.green,
                                      margin: const EdgeInsets.all(3),
                                      child: Image.network(myItems[index]['img']!,
                                          fit: BoxFit.fill),
                                    ));
                              }),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        //print(constraints.maxWidth);
        if (constraints.maxWidth > 800) {
          return const Center(child: Text('Too big screen'));
        } else {
          return Center(
            child: OrientationBuilder(
              builder: (context, orientation) =>
                  orientation == Orientation.portrait
                      ? buildPortrait()
                      : buildLandscape(),
            ),
          );
        }
      }),
    );
  }
}
