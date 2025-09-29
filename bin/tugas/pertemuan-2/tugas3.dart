import 'dart:io';

void main() {
  // Input skor dari pengguna
  stdout.write("Masukkan skor (0 - 100): ");
  int? skor = int.tryParse(stdin.readLineSync()!);

  // Validasi input
  if (skor == null || skor < 0 || skor > 100) {
    print("Error: Skor tidak valid. Harus antara 0 - 100.");
    return;
  }

  // Tentukan grade berdasarkan skor
  String grade;
  if (skor >= 85) {
    grade = "A";
  } else if (skor >= 70) {
    grade = "B";
  } else if (skor >= 60) {
    grade = "C";
  } else if (skor >= 50) {
    grade = "D";
  } else {
    grade = "E";
  }

  // Output hasil
  print("Skor Anda: $skor");
  print("Grade Anda: $grade");
}
