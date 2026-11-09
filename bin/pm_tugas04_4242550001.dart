import 'package:pm_tugas04_4242550001/kendaraan.dart';

void main() {
  final masuk = DateTime(2026, 11, 4, 8, 0);
  final motor = Motor('BK 1234 AB', masuk);
  final mobil = Mobil('BK 5827 CD', masuk);

  print(motor.biaya(DateTime(2026, 11, 4, 11, 0))); // 3 jam
  print(motor.biaya(DateTime(2026, 11, 4, 8, 10))); // 10 menit
  print(motor.biaya(DateTime(2026, 11, 4, 10, 1))); // 2 jam 1 menit
}
