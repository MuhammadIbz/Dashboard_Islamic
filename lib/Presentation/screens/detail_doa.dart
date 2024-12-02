import 'package:bittaqwa_app/utils/color.dart';
import 'package:flutter/material.dart';

class DetailDoa extends StatelessWidget {
  final String title;
  final String arabictext;
  final String translation;
  final String referance;

  const DetailDoa({
    super.key,
    required this.title,
    required this.arabictext,
    required this.translation,
    required this.referance,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title: Text(
          title,
          style: const TextStyle(fontFamily: "PoppinsMedium", color: ColorApp.white),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: ColorApp.white,
            )),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg_detail_doa.png"),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(33),
            padding: const EdgeInsets.all(23),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorApp.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[200]!, spreadRadius: 5, blurRadius: 5)
                ]),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontFamily: "PoppinsBold",
                      fontSize: 24,
                      color: ColorApp.text),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  textAlign: TextAlign.center,
                  arabictext,
                  style: const TextStyle(
                    fontFamily: "PoppinsRegular",
                    fontSize: 24,
                    color: ColorApp.text,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  textAlign: TextAlign.center,
                  translation,
                  style: const TextStyle(
                      fontFamily: "PoppinsRegular",
                      fontSize: 16,
                      color: ColorApp.text),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  referance,
                  style: TextStyle(
                    fontFamily: "PoppinsRegular",
                    fontSize: 16,
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
