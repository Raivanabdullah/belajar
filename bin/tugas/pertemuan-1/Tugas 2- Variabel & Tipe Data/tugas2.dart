void main() {
  String nama = "M. Raivan Abdullah";
  int umur = 19;
  double tinggi = 163.5;
  bool mahasiswa = true;

  var jurusan = "Informatika";
  var semester = 5;

  dynamic nilai = 85;
  nilai = "Delapan Puluh Lima";

  print("===== BIODATA MAHASISWA =====");
  print("Nama       : $nama");
  print("Umur       : $umur tahun");
  print("Tinggi     : $tinggi cm");
  print("Mahasiswa  : $mahasiswa");
  print("Jurusan    : $jurusan");
  print("Semester   : $semester");
  print("Nilai      : $nilai");

  int tahunLahir = 2025 - umur;
  print("Tahun Lahir: $tahunLahir");
}
