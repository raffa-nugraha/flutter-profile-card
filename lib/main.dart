import 'package:flutter/material.dart';
import 'profile_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // --- UBAH DATA MAHASISWA DI SINI ---
  static const String namaMahasiswa = "Raffa Nugraha";
  static const String nimMahasiswa = "20240801123"; // Masukkan NIM Anda
  static const String hobiMahasiswa = "Futsal";

  // Fungsi helper statis
  static int hitungSkorAktivitas(String nim) {
    if (nim.length < 2) return 50;
    int duaDigitTerakhir = int.tryParse(nim.substring(nim.length - 2)) ?? 0;
    return duaDigitTerakhir + 50;
  }

  static bool isDigitTerakhirGanjil(String nim) {
    if (nim.isEmpty) return false;
    int digitTerakhir = int.tryParse(nim[nim.length - 1]) ?? 0;
    return digitTerakhir % 2 != 0;
  }

  @override
  Widget build(BuildContext context) {
    final bool isGanjil = isDigitTerakhirGanjil(nimMahasiswa);
    final Color bgColor = isGanjil
        ? (Colors.tealAccent[100] ?? Colors.tealAccent)
        : (Colors.amber[100] ?? Colors.amber);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Layout Flutter',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dipanggil lewat MyApp.hitungSkorAktivitas (Sudah diperbaiki)
    final int skorAktivitas = MyApp.hitungSkorAktivitas(MyApp.nimMahasiswa);

    return Scaffold(
      body: Center(
        child: ProfileCard(
          nama: MyApp.namaMahasiswa,
          nim: MyApp.nimMahasiswa,
          hobi: MyApp.hobiMahasiswa,
          skorAktivitas: skorAktivitas,
        ),
      ),
    );
  }
}