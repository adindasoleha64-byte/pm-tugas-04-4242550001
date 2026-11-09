import 'kendaraan.dart';

import 'dart:async';

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

  Future<void> masuk(Kendaraan k) async {
    if (sisa <= 0) throw ParkirPenuh(kapasitas); // penuh: palang tidak dibuka
    await Future.delayed(const Duration(milliseconds: 300)); // palang naik
    _terparkir.add(k);
    _kejadian.add('MASUK ${k.jenis} ${k.plat} (sisa $sisa)');
  }

  Future<int> keluar(String plat, DateTime waktuKeluar) async {
    await Future.delayed(const Duration(milliseconds: 300)); // palang naik
    final int i = _terparkir.indexWhere((k) => k.plat == plat);
    if (i == -1) throw Exception('Kendaraan $plat tidak ditemukan.');

    final Kendaraan k = _terparkir.removeAt(i);
    final int bayar = k.biaya(waktuKeluar);
    _pendapatan += bayar;
    _kejadian.add('KELUAR ${k.jenis} ${k.plat} bayar Rp $bayar');
    return bayar;
  }

  final StreamController<String> _kejadian =
      StreamController<String>.broadcast();
  Stream<String> get kejadian => _kejadian.stream;

  Future<void> tutup() => _kejadian.close();
}
