void main() {
  // Deklarasi variabel biodata
  String nama = "M. Raivan Abdullah"; // String → teks
  int umur = 20;                      // int → angka bulat
  double tinggiBadan = 163.5;         // double → desimal
  bool statusAktif = true;            // boolean → true/false

  // Tampilkan data ke layar
  print("Nama: $nama");
  print("Umur: $umur");
  print("Tinggi: $tinggiBadan");
  print("Status: ${statusAktif ? 'Aktif' : 'Tidak Aktif'}");
}
