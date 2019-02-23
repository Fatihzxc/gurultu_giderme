# Gercek Zamanli Ses Isleme
 
**Amaç : EMG Sinyallerindeki gürültüyü Raspberry pi kullanarak yok etmek.**

### Yapilanlar
- Matlab ile .mat uzantili sentetik emg verisi okundu.
- Matlab ile sentetik veri ve Gaussian gürültülü halleri grafiğe basıldı.
- Matlab ile veriler ses dosyasına yazıldı(Normalizasyon islemi yapildi).
- Python ile ses verisi grafiğe basıldı ve grafik doğrulandı.

### Yapilacaklar:
- Gercek Zamanli olarak ses mikrofondan okunacak ve grafiğe bastırılacak.
- Bastırılmış olan ses grafiğine benzer bir grafik elde edilmeye çalışılacak.
- Gürültü giderme teknikleriyle sinyalden gürültü giderilecek.

### Kullanılanlar
- Raspberry Pi
- Python
- Matlab



# Duzeltilecek Alan

## Python Dizini
> - video.mp4 = Demo
> - kayit.wav = Kaydedilen Ses
> - realtime_rec.py = Gerçek Zamanlı Kayıt ve Oynatma
> - record_write.py = Gerçek Zamanlı Kayıt, Oynatma ve Dosyaya Yazma 

## Matlab Dizini
> - kayit.wav = Kaydedilen ses
> - ses_gurultu_wav = Gürültü eklenmiş ses
> - ses_beyaz_gurultu.m = Matlab sese beyaz gürültü ekleme
