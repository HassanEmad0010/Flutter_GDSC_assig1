
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color constantColor= Colors.purple;
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
             // clipper: WaveClipperTwo(flip: true),
              clipper: CurveClipper(),
              child: Container(
                height: 280,
                width: double.infinity,
                color:constantColor,
                child:const Center(
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.black12,
                    child: buildTextFormField(
                      labelText: "Full Name",
                      hintText: "Enter your name",
                      iconData: Icons.person,
                      textInputType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(height: 13,),

                  Container(
                    color: Colors.black12,
                    child: buildTextFormField(
                      labelText: "Phone Number",
                      hintText: "Enter your Phone Number",
                      iconData: Icons.phone,
                      textInputType: TextInputType.phone,
                    ),
                  ),
                  const SizedBox(height: 13,),

                  Container(
                    color: Colors.black12,
                    child: buildTextFormField(
                      labelText: "Email",
                      hintText: "Enter your email",
                      iconData: Icons.mail_outline_outlined,
                      textInputType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(height: 13,),
                  Container(
                    color: Colors.black12,
                    child:
                    buildTextFormField(
                      labelText: "Password",
                      hintText: " Enter your password",
                      iconData: Icons.lock_outline,
                      textInputType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),

                  ),
                  const SizedBox(height: 13,),
                  Container(
                    color: Colors.black12,
                    child:
                    buildTextFormField(
                      labelText: "Confirm Password",
                      hintText: " Enter your password again",
                      iconData: Icons.lock_outline,
                      textInputType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),

                  ),

                  const SizedBox(height: 10,),

                 GestureDetector(
                   onTap: (){
                     print("Register pressed");
                   },
                   child:
                   Container(
                     decoration: BoxDecoration(
                       borderRadius:const BorderRadius.all(Radius.circular(15)),
                       color: constantColor,
                     ),
                     width: double.infinity,
                     height: 50,


                     child: const Center(child: Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.white),)),
                   ),
                 ),

                  const SizedBox(height: 10,),

                  GestureDetector(
                    onTap: (){
                      print("sign up pressed");
                    },
                    child:
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),

                      border: Border.all(color: Colors.grey ,width: 2),
                      ),
                      width: double.infinity,
                      height: 50,
                      child:  Center(child: Text("Log in",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: constantColor),)),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildTextFormField(
  {
    required String hintText,
    required String labelText,
    required IconData iconData,
    required TextInputType textInputType,
    bool isPassword= false,
}
      ) {
    return TextFormField(
      obscureText: isPassword,
                      decoration:  InputDecoration(
                        fillColor: Colors.amberAccent,
                        prefixIcon:Icon( iconData),
                        hintText: hintText,
                        labelText: labelText,
                        suffixIcon:isPassword? IconButton(onPressed: () {},
                            icon:const Icon (Icons.remove_red_eye_outlined)) :null ,
                      ),
                      keyboardType: textInputType,

                    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    var path = Path();

    path.lineTo(0.0, size.height - 55);
    var firstControlPoint = Offset(size.width / 3.25, size.height - 65);
    var firstEndPoint = Offset(size.width / 1.75, size.height - 20);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondCP = Offset(size.width / 1.25, size.height);
    var secondEP = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(
        secondCP.dx, secondCP.dy, secondEP.dx, secondEP.dy);

    path.lineTo(size.width, size.height - 25);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CurveClipper oldClipper) => false;
}
