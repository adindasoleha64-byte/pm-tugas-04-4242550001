import 'package:pm_tugas04_4242550001/kendaraan.dart';
import 'package:pm_tugas04_4242550001/parkiran.dart';

Future<void> main() async {
  final p = Parkiran(3);
  p.kejadian.listen((e) => print(e));

  final masuk = DateTime(2026, 11, 4, 8, 0);
  final keluar = DateTime(2026, 11, 4, 11, 0); // parkir 3 jam

  // Polimorfisme: satu List<Kendaraan>, isinya berbagai jenis
  final List<Kendaraan> antrean = [
    Motor('BK 1234 AB', masuk),
    Mobil('BK 88 UN', masuk),
    MobilMember('BK 7 MIPA', masuk),
    Becak('BK 9 XX', masuk), // kendaraan keempat: harus ditolak
  ];

  final List<Kendaraan> diDalam = [];
  for (final k in antrean) {
    try {
      await p.masuk(k);
      diDalam.add(k);
    } on ParkirPenuh catch (e) {
      print('Ditolak: $e');
    }
  }

  for (final k in diDalam) {
    await p.keluar(k.plat, keluar);
  }

  print('Pendapatan: Rp${p.pendapatan}');
  await p.tutup();
}
