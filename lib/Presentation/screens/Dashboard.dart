import 'package:bittaqwa_app/utils/color.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Widget Header() {

      return Container(
        height: 250,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/bg_header_dashboard_morning.png"),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: ColorApp.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text("Assalamualaikum",style: TextStyle(fontFamily: "PoppinsRegular"),)),
            ),
            const SizedBox(height: 16,),
            const Text
            ("Subuh", 
            style: TextStyle(
              fontFamily: "PoppinsMedium"
              ),
              ),
              const SizedBox(height: 4,),
              const Text("04:48", style: TextStyle(fontFamily: "PoppinsBold", fontSize: 36
              ),
              ),
              const SizedBox(height: 4,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on_rounded,
                  color: ColorApp.red,
                  size: 16,),
                  SizedBox(width: 4,),
                  Text("Kabupaten Karanganyar", style: TextStyle(fontFamily: "PoppinsRegular"),)
                ],
              )
          ],
        ),
      );
    }
    
    Widget CardMenus(){
      return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: ColorApp.primary
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              
              GestureDetector(
                onTap: (){
                   Navigator.pushNamed(context, '/doa');
                },
                child: Column(
                  children: [
                    Image.asset("assets/images/ic_menu_doa.png"),
                    const Text("Doa-Doa",style: TextStyle(
                      fontFamily: "PoppinsSemiBold", 
                      fontSize: 14,
                      color: ColorApp.white),)
                  ],
                ),
              ),

              const SizedBox(width: 12,),

              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, "/zakat");
                },
                child: Column(
                  children: [
                    Image.asset("assets/images/ic_menu_zakat.png"),
                    const Text("Zakat",style: TextStyle(
                      fontFamily: "PoppinsSemiBold", 
                      fontSize: 14,
                      color: ColorApp.white),)
                  ],
                ),
              ),

              const SizedBox(width: 12,),

              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/jadwal-sholat');
                },
                child: Column(
                  children: [
                    Image.asset("assets/images/ic_menu_jadwal_sholat.png"),
                    const Text("Sholat",style: TextStyle(
                      fontFamily: "PoppinsSemiBold", 
                      fontSize: 14,
                      color: ColorApp.white),)
                  ],
                ),
              ),

              const SizedBox(width: 12,),

              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/video-kajian');
                },
                child: Column(
                  children: [
                    Image.asset("assets/images/ic_menu_video_kajian.png"),
                    const Text("Video",style: TextStyle(
                      fontFamily: "PoppinsSemiBold", 
                      fontSize: 14,
                      color: ColorApp.white),)
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget Inspiration(){
      return Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Inspiration",
                style: TextStyle(
                  fontFamily: "PoppinsSemibold",
                  fontSize: 20,
                ),
              ),
            ),

            const SizedBox
            (height: 8,),

            Image.asset("assets/images/img_inspiration.png",fit: BoxFit.cover,),
            Image.asset("assets/images/img_inspiration_2.jpeg",fit: BoxFit.cover,),
            Image.asset("assets/images/img_inspiration_3.jpeg",fit: BoxFit.cover,),
            Image.asset("assets/images/img_inspiration_4.jpeg",fit: BoxFit.cover,),
            Image.asset("assets/images/img_inspiration_5.jpeg",fit: BoxFit.cover,),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: ColorApp.white,
      body: ListView(
        children: [
          Header(),
          CardMenus(),
          Inspiration()
        ],
      ),
    );
  }
}
