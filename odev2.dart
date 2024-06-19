// 2. madde
/*

double dikdortgenAlani(double uzunKenar, double kisaKenar) {
  return uzunKenar*kisaKenar;
}

void main() {
  double uzunKenar = 9.54;
  double kisaKenar = 4.76;

  double alan = dikdortgenAlani(uzunKenar, kisaKenar);
  print("Dikdörtgenin alanı: $alan");
}

*/



// 3. madde
/*

int carp(int a, int b) {
  int multiplyByTwo(int x) {
    return x * 2;
  }

  int result = a;

  for (int i = 1; i < b; i++) {
    result = multiplyByTwo(result);
  }

  return result;
}

void main() {
  int a = 5;
  int b = 3;

  int sonuc = carp(a, b);
  print("Sonuç: $sonuc");
}

*/



// 4. madde
/*

void veriyiSil(List<dynamic> liste, dynamic veri) {
  liste.remove(veri);
}

void main() {
  List<String> aylar = ['ocak', 'şubat', 'mart', 'nisan'];
  String silinecekVeri = 'şubat';

  print("Liste: $aylar");

  veriyiSil(aylar, silinecekVeri);

  print("Güncellenmiş Liste: $aylar");
}

*/



// 5. madde
/*

class Sekil {
  String isim;
  int kenarSayisi;

  Sekil(this.isim, this.kenarSayisi);

  void bilgiGoster() {
    print("Şekil: $isim, Kenar Sayısı: $kenarSayisi");
  }
}

void main() {
  Sekil kare = Sekil("Kare", 4);
  Sekil besgen = Sekil("Beşgen", 5);
  Sekil ucgen = Sekil("Üçgen", 3);
  Sekil paralelkenar = Sekil("Paralelkenar", 4);
  Sekil daire = Sekil("Daire", 0);

  kare.bilgiGoster();
  besgen.bilgiGoster();
  ucgen.bilgiGoster();
  paralelkenar.bilgiGoster();
  daire.bilgiGoster();
}

*/