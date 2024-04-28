import 'package:flutter/material.dart';
import 'package:roblox_master/res/common/media_query.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Setting",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 20),
          child: ListView.separated(
            itemBuilder: (context, index) => Container(
                child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 3, // changes the spread of the shadow
                      offset: Offset(0, 2), // changes position of shadow
                      spreadRadius: 0, // changes how "thick" the shadow is
                    ),
                  ],
                  border: Border.all(color: Colors.blueGrey.withOpacity(0.2)),
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: height(context) * 0.03),
                child: Center(
                  child: titletext(
                      text: index == 0
                          ? "Privacy Policy"
                          : index == 1
                              ? "Contact Us"
                              : index == 2
                                  ? "Share App"
                                  : "Rateus"),
                ),
              ),
            )),
            separatorBuilder: (context, index) => SizedBox(
              height: 15,
            ),
            itemCount: 4,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
          ),
        ));
  }

  Widget titletext({required String text}) {
    return Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.w700, fontSize: 26, color: Colors.black),
    );
  }
}
