abstract class Kendaraan {
  final String plat;
  final DateTime waktuMasuk;

  Kendaraan(this.plat, this.waktuMasuk);

  String get jenis;
  int get tarifPerJam;

  int biaya(DateTime keluar) {
    final int menit = keluar.difference(waktuMasuk).inMinutes;
    final int jam = (menit / 60).ceil();
    final int jamTagih = jam < 1 ? 1 : jam;
    return jamTagih * tarifPerJam;
  }
}

class Motor extends Kendaraan {
  Motor(super.plat, super.waktuMasuk);

  @override
  String get jenis => 'Motor';

  @override
  int get tarifPerJam => 2000;
}
