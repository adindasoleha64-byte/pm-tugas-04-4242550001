import 'package:pm_tugas04_4242550001/kendaraan.dart';
import 'package:pm_tugas04_4242550001/parkiran.dart';

Future<void> main() async {
  final p = Parkiran(3);
  final masuk = DateTime(2026, 11, 4, 8, 0);

  await p.masuk(Motor('BK 1234 AB', masuk));
  await p.masuk(Mobil('BK 5827 CD', masuk));
  await p.masuk(Becak('BK 9999 FR', masuk));
  print('Sisa: ${p.sisa}'); // 0

  try {
    await p.masuk(Becak('BK 9 XX', masuk)); // await di dalam try
  } on ParkirPenuh catch (e) {
    print('Ditolak: $e');
  }

  final keluar = DateTime(2026, 11, 4, 11, 0);
  print(await p.keluar('BK 1234 AB', keluar)); // 6000
  print(await p.keluar('BK 5827 CD', keluar)); // 15000
  print(await p.keluar('BK 9999 FR', keluar)); // 3000
  print('Pendapatan: Rp${p.pendapatan}'); // Rp24000
}
