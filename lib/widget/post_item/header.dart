import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HearderPostBuilder extends StatefulWidget {
  const HearderPostBuilder({
    Key? key,
  });
  @override
  _HearderPostBuilderState createState() => _HearderPostBuilderState();
}

class _HearderPostBuilderState extends State<HearderPostBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
      child: Row(
        children: [
          /// avartar
          const CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage("assets/images/demo.png"),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nguyen Van Khoa",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Can Tho, Viet Nam",
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      textAlign: TextAlign.left,
                    ))
              ],
            ),
          )),
        ],
      ),
    );
  }
}
