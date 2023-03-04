import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextFormField buildTextFormField(
    {
      required String hintText,
      required String labelText,
      required IconData iconData,
      required TextInputType textInputType,
      bool isPassword= false,
      bool isObscure=true,
    }
    ) {
  return TextFormField(

    validator: (value){
      if (value==null||value=="")
        {
          return "$labelText can't be empty";
        }
      else
        {
          return null;
        }
    },
    obscureText: isPassword ? isObscure : false,

    decoration:  InputDecoration(
      fillColor: Colors.amberAccent,
      prefixIcon:Icon( iconData),
      hintText: hintText,
      labelText: labelText,
      suffixIcon:isPassword? IconButton(onPressed: () {
        print("********************************##suffix pressed  \n"
            "isObsecure : $isObscure \n"
            "isPassword : $isPassword \n");

        isObscure=!isObscure;

      },
          icon:const Icon (Icons.remove_red_eye_outlined)) :null ,
    ),
    keyboardType: textInputType,

  );
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
