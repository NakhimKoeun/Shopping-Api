import 'package:flutter/material.dart';

class ResponSive extends StatelessWidget {
  const ResponSive(
      {super.key,
      this.widget = 120,
      this.isResponSive,
      this.color,
      this.iconColor,
      this.height,
      required bool isResponsive});
  final double? widget;
  final bool? isResponSive;
  final Color? color;
  final Color? iconColor;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: isResponSive == true ? double.maxFinite : widget,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: color),
          child: Row(
            mainAxisAlignment: isResponSive == true
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              isResponSive == true
                  ? Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "Buy now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    )
                  : Container(),
              Image.network(
                "https://cdn-icons-png.flaticon.com/128/6701/6701368.png",
                color: iconColor,
                height: 30,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }
}
