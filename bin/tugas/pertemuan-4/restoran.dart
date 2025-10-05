// restoran.dart
import 'dart:io';

void main() {
  final menu = <int, Map<String, dynamic>>{
    1: {'name': 'Nasi Goreng', 'price': 20000},
    2: {'name': 'Mie Ayam', 'price': 18000},
    3: {'name': 'Ayam Bakar', 'price': 20000},
    4: {'name': 'Es Teh', 'price': 5000},
    5: {'name': 'Jus Jeruk', 'price': 10000},
    6: {'name': 'Air Mineral', 'price': 5000},
    7: {'name': 'Jus Alpukat', 'price': 10000},
  };

  Map<int, int> cart = {}; // id menu -> quantity
  String lanjut = 'y';

  print('=== PROGRAM RESTORAN (Do-While & While) ===');

  // ORDER LOOP menggunakan do-while (sesuai permintaan dosen)
  do {
    printMenu(menu);

    int pilihan = readInt('Pilih nomor menu (0 = selesai/checkout): ');
    if (pilihan == 0) {
      // langsung ke checkout
      break;
    }

    if (!menu.containsKey(pilihan)) {
      print('Pilihan tidak ada. Coba lagi.\n');
      continue;
    }

    int jumlah = readInt('Masukkan jumlah: ');
    if (jumlah <= 0) {
      print('Jumlah harus minimal 1. Coba lagi.\n');
      continue;
    }

    cart.update(pilihan, (v) => v + jumlah, ifAbsent: () => jumlah);
    print('>> Ditambahkan: ${jumlah} x ${menu[pilihan]!['name']}\n');

    stdout.write('Ingin pesan lagi? (y = ya / n = tidak): ');
    lanjut = stdin.readLineSync() ?? 'n';
    lanjut = lanjut.trim().toLowerCase();
    if (lanjut != 'y' && lanjut != 'n') {
      // jika input aneh, anggap ingin lanjut supaya tidak memaksa user
      lanjut = 'y';
    }
  } while (lanjut == 'y');

  if (cart.isEmpty) {
    print('\nAnda tidak memesan apa-apa. Program selesai. Terima kasih!');
    return;
  }

  // HITUNG TOTAL dan buat struk
  int total = 0;
  StringBuffer struk = StringBuffer();
  struk.writeln('===== STRUK PEMBELIAN =====');
  struk.writeln('Waktu: ${DateTime.now()}');
  struk.writeln('');

  print('\n--- RINGKASAN PESANAN ---');
  cart.forEach((id, qty) {
    final item = menu[id]!;
    final sub = (item['price'] as int) * qty;
    total += sub;
    final line = '${item['name']} x $qty = ${formatRupiah(sub)}';
    print(line);
    struk.writeln(line);
  });
  struk.writeln('');
  struk.writeln('TOTAL = ${formatRupiah(total)}');
  print('\nTOTAL = ${formatRupiah(total)}');

  // PAYMENT: gunakan while untuk memaksa input sampai cukup bayar
  int bayar;
  while (true) {
    bayar = readInt('\nMasukkan uang pembayaran (ketik 0 untuk batal): Rp ');
    if (bayar >= total) break;
    if (bayar == 0) {
      print('Pembayaran dibatalkan. Pesanan dibatalkan.');
      return;
    }
    print('Uang kurang ${formatRupiah(total - bayar)}. Silakan input lagi.');
  }

  int kembalian = bayar - total;
  print('Pembayaran diterima. Kembalian: ${formatRupiah(kembalian)}');

  struk.writeln('BAYAR = ${formatRupiah(bayar)}');
  struk.writeln('KEMBALIAN = ${formatRupiah(kembalian)}');
  struk.writeln('');
  struk.writeln('Terima kasih. Selamat makan!');

  // Simpan struk ke file (opsional — bagus buat bukti tugas)
  final nowSafe = DateTime.now().toIso8601String().replaceAll(':', '-');
  final filename = 'struk_$nowSafe.txt';
  File(filename).writeAsStringSync(struk.toString());
  print('Struk disimpan ke file: $filename');

  print('=== SELESAI ===');
}

// Cetak menu rapi
void printMenu(Map<int, Map<String, dynamic>> menu) {
  print('\nDAFTAR MENU:');
  menu.forEach((id, item) {
    print('$id. ${item['name']} - ${formatRupiah(item['price'] as int)}');
  });
  print('0. Selesai / Checkout');
}

// Helper baca integer aman (mengulang sampai input valid)
int readInt(String prompt) {
  while (true) {
    stdout.write(prompt);
    final line = stdin.readLineSync();
    if (line == null) {
      print('Input kosong. Coba lagi.');
      continue;
    }
    final cleaned = line.replaceAll(RegExp(r'[^0-9-]'), '');
    final value = int.tryParse(cleaned);
    if (value == null) {
      print('Input tidak valid. Masukkan angka (mis. 10000).');
      continue;
    }
    return value;
  }
}

// Format rupiah sederhana: 100000 -> Rp 100.000
String formatRupiah(int value) {
  final s = value.toString();
  final sb = StringBuffer();
  int count = 0;
  for (int i = s.length - 1; i >= 0; i--) {
    sb.write(s[i]);
    count++;
    if (count % 3 == 0 && i != 0) sb.write('.');
  }
  return 'Rp ' + sb.toString().split('').reversed.join('');
}
