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

class Mobil extends Kendaraan {
  Mobil(super.plat, super.waktuMasuk);

  @override
  String get jenis => 'Mobil';

  @override
  int get tarifPerJam => 5000;
}

class Becak extends Kendaraan {
  Becak(super.plat, super.waktuMasuk);

  @override
  String get jenis => 'Becak';

  @override
  int get tarifPerJam => 1000;
}

mixin Berlangganan on Kendaraan {
  @override
  int biaya(DateTime keluar) {
    final int normal = super.biaya(keluar);
    return (normal * 0.5).round();
  }
}

class MobilMember extends Mobil with Berlangganan {
  MobilMember(super.plat, super.waktuMasuk);

  @override
  String get jenis => 'Mobil (member)';
}
