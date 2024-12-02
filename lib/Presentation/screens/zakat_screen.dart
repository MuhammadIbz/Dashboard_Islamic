import 'package:bittaqwa_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';

class ZakatScreen extends StatefulWidget {
  ZakatScreen({super.key});

  @override
  State<ZakatScreen> createState() => _ZakatScreenState();
}

class _ZakatScreenState extends State<ZakatScreen> {
  // Membuat sebuah controller untuk menambahkan titik titik
  final MoneyMaskedTextController moneyController = MoneyMaskedTextController(
      thousandSeparator: '.', decimalSeparator: '', precision: 0);

  // Membuat variable awal untuk total harta
  double totalHarta = 0;

  double zakatdikeluarkan = 0;

  final minimumharta = 85000000;

  // Membuat variable untuk menampung format dari variable awal
  String formattedHarta = "";

  String formattedZakatDikeluarkan = "";

  // Membuat function untuk menghitung zakat
  void HitungZakat() {
    // Ambil imputan dari controller dan hilangkan titik
    String cleanValue = moneyController.text.replaceAll('.', '');
    // Parsig dari string ke double
    double inputValue = double.tryParse(cleanValue) ?? 0;

    // Membuat sebuah pengkondisian jika harta kita sama atau lebih dari minimimharta
    if (inputValue >= minimumharta) {
      // Jika inputan lebih dari minimum harta kita akan ubah valuenya
      setState(() {
        totalHarta = inputValue;
        zakatdikeluarkan = (inputValue * 2.5) / 100;

        // Kita ubang menjadi format rupiah
        formattedHarta = NumberFormat.currency(locale: 'id_ID', symbol: '')
            .format(totalHarta);
        formattedZakatDikeluarkan =
            NumberFormat.currency(locale: 'id_ID', symbol: '')
                .format(zakatdikeluarkan);
      });
    } else {
      // Jika harta kurang dari 85 juta munculkan dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("peringatan"),
          content: const Text("Harta anda tidak mencapai minimal harta"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget CardHarta() {
      return Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: ColorApp.grey),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Total Harta",
              style: TextStyle(
                  fontFamily: "PoppinsMedium", color: ColorApp.primary),
            ),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: moneyController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: ColorApp.primary)),
                label: const Text("Masukan Total Harta"),
                labelStyle: const TextStyle(color: ColorApp.text),
                prefix: const Text("Rp."),
                fillColor: ColorApp.white,
                filled: true,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorApp.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 0),
                padding: const EdgeInsets.all(16),
              ),
              onPressed: () {
                HitungZakat();
              },
              child: const Text(
                "OK",
                style: TextStyle(color: ColorApp.white),
              ),
            ),
          ],
        ),
      );
    }

    Widget CardResult() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.red[300]!),
            child: Column(
              children: [
                const Text(
                  "Total Uang",
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    color: ColorApp.white,
                  ),
                ),
                Text(
                  "Rp. ${formattedHarta}",
                  style: const TextStyle(
                    fontFamily: "PoppinsMedium",
                    color: ColorApp.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.purple[300]!),
            child: Column(
              children: [
                const Text(
                  "Zakat Dikeluarkan",
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    color: ColorApp.white,
                  ),
                ),
                Text(
                  "Rp. ${formattedZakatDikeluarkan}",
                  style: const TextStyle(
                    fontFamily: "PoppinsMedium",
                    color: ColorApp.white,
                  ),
                ),
              ],
            ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title: const Text(
          "Kalkulator Zakat",
          style: TextStyle(fontFamily: "PoppinsMedium", color: ColorApp.white),
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
      body: ListView(
        children: [
          Image.asset("assets/images/bg_header_zakat.png"),
          CardHarta(),
          CardResult(),
        ],
      ),
    );
  }
}
