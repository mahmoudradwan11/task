import 'package:flutter/material.dart';
import 'package:task/models/gellary_model/gellary.dart';

class HomeAppScreen extends StatelessWidget {
  HomeAppScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 800,
            ),
            const Positioned(
                top: 350,
                left: -50,
                child:CircleAvatar(
                  radius:100,
                  backgroundImage:AssetImage('images/circle_pink.png'),)),
            const Positioned(
              top: -25,
              left: -10,
              child: CircleAvatar(
                radius: 300,
                backgroundImage: AssetImage('images/circle_pup.png'),
              ),
            ),
            Positioned(
              right: 0,
              child: ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  height: 150,
                  width: 200,
                  color: Colors.purple.withOpacity(0.3),
                ),
              ),
            ),
            const Positioned(
              right: 30,
              top: 10,
              child: CircleAvatar(
                radius:50,
                backgroundImage:AssetImage('images/man.png'),
              ),
            ),
            Positioned(
              top:40,
              left: 40,
                child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:const[
                Text('Welcome',style: TextStyle(fontSize: 30,fontFamily: 'Brush'),),
                Text('Mina',style: TextStyle(fontSize: 30,fontFamily: 'Brush'),),
              ],
            )
            ),
            Positioned(
              top: 150,
              left: 70,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                width: 120,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children:[
                      const Image(image:AssetImage('images/Vector.png')),
                      const SizedBox(width: 10,),
                      Text('log out',style: TextStyle(color: Colors.grey[500]),)
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 150,
              right: 50,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                width: 120,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children:[
                      const Image(image:AssetImage('images/Vector20.png')),
                      const SizedBox(width: 10,),
                      Text('Upload',style: TextStyle(color: Colors.grey[500]),)
                    ],
                  ),
                ),
              ),
            ),
            const Positioned(top:160,
                left: 80,
                child: Icon(Icons.arrow_back,color: Colors.white,)),
             Positioned(top:160,
                right:135,
                child: InkWell(onTap:(){
                  showDialog(context:context, builder:(context){
                    return AlertDialog(
                      backgroundColor: Colors.transparent,
                      content:Container(
                        color: Colors.white.withOpacity(0.3),
                        height:140,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Row(children:const [
                                Image(image: AssetImage('images/c.png')),
                                Text('Camera',style: TextStyle(color: Colors.white),)
                              ],),
                              Row(children:const [
                                SizedBox(width: 10,),
                                Image(image: AssetImage('images/gallery.png')),
                                Text('      Gallery',style: TextStyle(color: Colors.white),)
                              ],)
                            ],
                          ),
                        ),
                      ),
                    );
                  });
                },
                    child: const Icon(Icons.upload,color: Colors.white,))),
            const Positioned(
                top: 450,
                left: -10,
                child:CircleAvatar(
                  radius:100,
                  backgroundImage:AssetImage('images/circle_yellow.png'),)),
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Container(
                  color: Colors.transparent,
                  child: GridView.count(
                    childAspectRatio: 1.1 / 1,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children: List.generate(galleryImages.length, (index) =>
                        buildGalleryImage(galleryImages[index])),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
  List<Gallery> galleryImages = [
    Gallery('images/im1.png'),
    Gallery('images/2.png'),
    Gallery('images/3.png'),
    Gallery('images/4.png'),
    Gallery('images/5.png'),
    Gallery('images/6.png'),
    Gallery('images/7.png'),
    Gallery('images/8.png'),
    Gallery('images/9.png'),
    Gallery('images/4.png'),
    Gallery('images/5.png'),
    Gallery('images/6.png'),
    Gallery('images/7.png'),
    Gallery('images/8.png'),
    Gallery('images/9.png'),
  ];
  Widget buildGalleryImage(Gallery model)=>Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    child: Image(image:AssetImage(model.image!),),
  );
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    //path.lineTo(0,size.height / 2);
    path.cubicTo(size.width / 4, 3 * (size.height / 2), 3 * (size.width / 4),
        size.height / 2, size.width, size.height * 0.9);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

