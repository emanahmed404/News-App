import 'package:flutter/material.dart';

Widget defaultFormField({
required TextEditingController? controller ,
required TextInputType type ,
required String lable ,
required IconData prefix,
IconData? suffix,
bool IsObscure = false ,
Function(String)?  onSubmit,
String? Function(String?)? validate ,
VoidCallback? onPressed ,
VoidCallback? onTap ,
Function(String)? onChange ,

})=> TextFormField(
  controller: controller,
  keyboardType: type ,
  obscureText: IsObscure ,
  onFieldSubmitted: onSubmit ,
  onChanged: onChange,
  validator: validate,
  onTap: onTap,
  decoration: InputDecoration(
    // hintText: 'Password',
    labelText: lable,
    prefixIcon: Icon(prefix),
    suffixIcon: suffix!=null ? IconButton(
      icon: Icon(suffix),
      onPressed: onPressed ,
    ) : null,
    border: OutlineInputBorder(),
  ),
);