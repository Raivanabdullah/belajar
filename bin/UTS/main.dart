abstract class Transportasi {
    String id, nama;
    double _tarifDasar;
    int kapsitas;

    Transportasi(this.id, this.nama, this._tarifDasar, this.kapsitas);

    double get tarifDasar => _tarifDasar;
    double hitungTarif(int jmlPenumpang);
}

class Taksi extends Transportasi {
    double jarak;
    Taksi(super.id, super.nama, super._tarifDasar, super.kapasitas, this.jarak);

    @override
    double hitungTarif(int jmlPenumpang) =>
        tarifDasar * jarak;
}

class Bus extends Transportasi {
    bool adaWifi;
    Bus(super.id, super.nama, super._tarifDasar, super.kapasitas, this.adaWifi);

    @override
    double hitungTarif(int jmlPenumpang) =>
        (tarifDasar * jmlPenumpang) +
        (adaWifi ? 5000 : 0);
}

class Pesawat extends Transportasi {
    String kelas;
    Pesawat(super.id, super.nama, super._tarifDasar, super.kapasitas, this.kelas);

    @override
    double hitungTarif(int jmlPenumpang) =>
        tarifDasar * jmlPenumpang *
        (kelas == "Bisnis" ? 1.5 : 1.0);
}

class Pemesanan {
    String id, nama;
    Transportasi t;
    int jml;
    double total;
    Pemesanan(this.id, this.nama, this.t, this.jml)
        : total = t.hitungTarif(jml);

    void cetak(){
        print("\nkode: $id | Nama: $nama | ${t.nama} | Total: Rp ${total.toStringAsFixed(2)}");
    }
}


void main() {
    var daftar = [
        Pemesanan("P001", "Raivan", Taksi("T001", "Blue Bird", 3000, 4, 15), 2),
        Pemesanan("P002", "Abdullah", Bus("B1", "TransJakarta", 3000, 40, true), 5),
        Pemesanan("P003", "Yuli", Pesawat("PS1", "Garuda Indonesia", 1500000, 180, "Bisnis"), 2),
    ];

    print("=== DAFTAR PEMESANAN TRANSPORTASI ===");
    for (var p in daftar) p.cetak();
}
