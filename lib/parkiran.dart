import 'kendaraan.dart';

class ParkirPenuh implements Exception {
  final int kapasitas;
  ParkirPenuh(this.kapasitas);

  @override
  String toString() => 'Parkiran penuh (kapasitas $kapasitas)';
}

class Parkiran {
  final int kapasitas;
  final List<Kendaraan> _terparkir = [];
  int _pendapatan = 0;

  Parkiran(this.kapasitas);

  int get sisa => kapasitas - _terparkir.length;
  int get pendapatan => _pendapatan;

  void masuk(Kendaraan k) {
    if (sisa <= 0) throw ParkirPenuh(kapasitas);
    _terparkir.add(k);
  }

  int keluar(String plat, DateTime waktuKeluar) {
    final int i = _terparkir.indexWhere((k) => k.plat == plat);
    if (i == -1) throw Exception('Kendaraan $plat tidak ditemukan.');

    final Kendaraan k = _terparkir.removeAt(i);
    final int bayar = k.biaya(waktuKeluar);
    _pendapatan += bayar;
    return bayar;
  }
}
