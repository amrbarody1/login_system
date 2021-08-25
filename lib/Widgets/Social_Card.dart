import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialCard extends StatelessWidget {
  final String imgUrl;
  SocialCard({this.imgUrl, this.function});
  Function function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        height: 0.07.sh,
        width: 0.15.sw,
        child: InkWell(
          onTap: function,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black12, width: 1),
              borderRadius: BorderRadius.circular(13),
            ),
            child: UnconstrainedBox(
              child: Image.network(
                imgUrl,
                height: 0.033.sh,
                width: 0.05.sh,
              ),
            ),
          ),
        ),
      ),
    );
  }
}