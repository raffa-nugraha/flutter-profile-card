import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String nama;
  final String nim;
  final String hobi;
  final int skorAktivitas;

  const ProfileCard({
    super.key,
    required this.nama,
    required this.nim,
    required this.hobi,
    required this.skorAktivitas,
  });

  // Fungsi helper untuk mengambil digit NIM dari belakang
  int _getDigitFromEnd(int indexFromEnd) {
    if (nim.isEmpty || nim.length < indexFromEnd) return 0;
    return int.tryParse(nim[nim.length - indexFromEnd]) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    // --- KALKULASI RUMUS BERBASIS DIGIT NIM (BAGIAN III) ---
    final int digitKe2Belakang = _getDigitFromEnd(2);
    final int digitTerakhir = _getDigitFromEnd(1);

    final double lebarKartu = 320.0 + (digitKe2Belakang * 5.0);
    final double sudutMelengkung = 12.0 + (digitTerakhir * 1.5);
    final double ukuranLogo = 60.0 + (digitTerakhir * 2.0);
    final double jarakPemisah = 15.0 + digitTerakhir.toDouble();

    return Container(
      width: lebarKartu,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(sudutMelengkung),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Kartu (Horizontal - Row)
          Row(
            children: [
              // Sisi Kiri: FlutterLogo berbingkai
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(sudutMelengkung),
                  color: Colors.grey[100],
                ),
                padding: const EdgeInsets.all(8.0),
                child: FlutterLogo(
                  size: ukuranLogo,
                ),
              ),

              SizedBox(width: jarakPemisah),

              // Sisi Kanan: Column dengan CrossAxisAlignment.start
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kartu Praktikan',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      nama,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Pemisah (Sudah diperbaiki)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Divider(thickness: 1.5),
          ),

          // Bagian Detail Identitas (Vertikal - Column)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NIM : $nim',
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6.0),
              Text(
                'Hobi : $hobi',
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6.0),
              Text(
                'Skor Aktivitas : $skorAktivitas',
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}