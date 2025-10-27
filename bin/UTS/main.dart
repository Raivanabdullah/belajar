abstract class Transportasi {
  String id, nama;
  double _tarifDasar;
  int kapasitas;

  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);

  double get tarifDasar => _tarifDasar;
  double hitungTarif(int jmlPenumpang);
}

class Taksi extends Transportasi {
  double jarak;
  Taksi(super.id, super.nama, super._tarifDasar, super.kapasitas, this.jarak);

  @override
  double hitungTarif(int jmlPenumpang) => tarifDasar * jarak;
}

class Bus extends Transportasi {
  bool adaWifi;
  Bus(super.id, super.nama, super._tarifDasar, super.kapasitas, this.adaWifi);

  @override
  double hitungTarif(int jmlPenumpang) =>
      (tarifDasar * jmlPenumpang) + (adaWifi ? 5000 : 0);
}

class Pesawat extends Transportasi {
  String kelas;
  Pesawat(super.id, super.nama, super._tarifDasar, super.kapasitas, this.kelas);

  @override
  double hitungTarif(int jmlPenumpang) =>
      tarifDasar * jmlPenumpang * (kelas == "Bisnis" ? 1.5 : 1.0);
}

class Pemesanan {
  String id, nama;
  Transportasi t;
  int jml;
  double total;
  Pemesanan(this.id, this.nama, this.t, this.jml)
      : total = t.hitungTarif(jml);

  void cetak() {
    print("\nKode: $id | Nama: $nama | ${t.nama} | Total: Rp ${total.toStringAsFixed(2)}");
  }
}

void main() {
  var daftar = [
    Pemesanan("P001", "Kawalero", Taksi("T1", "Blue Bird", 7500, 4, 15), 2),
    Pemesanan("P002", "Budi", Bus("B1", "TransJakarta", 3000, 40, true), 5),
    Pemesanan("P003", "Citra", Pesawat("PS1", "Garuda", 1500000, 180, "Bisnis"), 2),
  ];

  print("=== DAFTAR PEMESANAN ===");
  for (var p in daftar) p.cetak();
}
