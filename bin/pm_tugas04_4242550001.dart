import 'package:pm_tugas04_4242550001/kendaraan.dart';
import 'package:pm_tugas04_4242550001/parkiran.dart';

void main() {
  final p = Parkiran(3);
  final masuk = DateTime(2026, 11, 4, 8, 0);

  // 1. tiga kendaraan masuk sampai penuh
  p.masuk(Motor('BK 1234 AB', masuk));
  p.masuk(Mobil('BK 5827 CD', masuk));
  p.masuk(Becak('BK 9999 FR', masuk));
  print('Sisa: ${p.sisa}'); // 0

  // 2. kendaraan keempat harus ditolak
  try {
    p.masuk(Becak('BK 9 XX', masuk));
  } on ParkirPenuh catch (e) {
    print('Ditolak: $e'); // Parkiran penuh (kapasitas 3)
  }

  // 3. ketiganya keluar setelah 3 jam
  final keluar = DateTime(2026, 11, 4, 11, 0);
  print(p.keluar('BK 1234 AB', keluar)); // 6000
  print(p.keluar('BK 5827 CD', keluar)); // 15000
  print(p.keluar('BK 9999 FR', keluar)); // 3000
  print('Pendapatan: Rp${p.pendapatan}'); // Rp24000
}
