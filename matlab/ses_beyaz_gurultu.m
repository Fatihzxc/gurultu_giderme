[ses ,Fs] = audioread('kayit.wav');

beyaz_gurultu_eklenmis = awgn(ses, 40);

sound(beyaz_gurultu_eklenmis , Fs);

figure(4);
plot(ses);
figure(5);
plot(beyaz_gurultu_eklenmis);

audiowrite('ses_gurultu.wav', beyaz_gurultu_eklenmis, Fs)