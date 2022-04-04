import 'package:flutter/material.dart';
import 'package:movie_app/common/extensions/size_extentions.dart';

class Logo extends StatelessWidget {
  
  final double height;

  const Logo({
    Key? key, 
    required this.height}):
        assert(height >0, 'Logo height should be greater than zero'), super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/pngs/logo.png',
    color: Colors.white,
    height: height.h,);
  }
}
