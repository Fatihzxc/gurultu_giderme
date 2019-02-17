
%%% Emg Sinyalini .mat dosyasýndan alma iþlemi
Emg_Sinyali = emg_sinyali_al('sentetik_veri.mat');
Emg_Sinyali(1001:2000, 1) =  Emg_Sinyali(1:1000, 1);
Emg_Sinyali(2001:4000, 1) =  Emg_Sinyali(1:2000, 1);
Emg_Sinyali(4001:8000, 1) =  Emg_Sinyali(1:4000, 1);
Emg_Sinyali(8001:16000, 1) =  Emg_Sinyali(1:8000, 1);

%%% Plot
plot_ciz(Emg_Sinyali, 1, 1, 'Emg Sinyali', 'Genlik', 'Zaman(s)');



%%% Gaus Gurultusu eklenmis emg sinyali
%%% 5dB
Ga_Gurultulu_Emg_5db = awgn(Emg_Sinyali,5,'measured');
plot_ciz(Ga_Gurultulu_Emg_5db, 2, 1, 'Gaus 5db SNR', 'Genlik', 'Zaman(s)');
%%% 0dB
Ga_Gurultulu_Emg_0db = awgn(Emg_Sinyali,0,'measured');
plot_ciz(Ga_Gurultulu_Emg_0db, 3, 1, 'Gaus 0db SNR', 'Genlik', 'Zaman(s)');
%%% -10 dB
Ga_Gurultulu_Emg_eksi10db = awgn(Emg_Sinyali,-10,'measured');
plot_ciz(Ga_Gurultulu_Emg_eksi10db, 4, 0, 'Gaus -10db SNR', 'Genlik', 'Zaman(s)');
%%% -20 dB
Ga_Gurultulu_Emg_eksi20db = awgn(Emg_Sinyali,-20,'measured');
plot_ciz(Ga_Gurultulu_Emg_eksi20db, 5, 0, 'Gaus -20db SNR', 'Genlik', 'Zaman(s)');



%%% Sesi Oynatma Islemi
Fs = 8192;
Fs2 = 44100;
%sound(Audio_Bird1 , Fs);
audiowrite('emg_gaus_0db.wav', Ga_Gurultulu_Emg_0db, Fs, 'BitsPerSample',16, 'Comment','Emg');
audiowrite('emg_gaus_5db.wav', Ga_Gurultulu_Emg_5db, Fs, 'BitsPerSample',16, 'Comment','Emg');
audiowrite('emg_gaus_eksi10db.wav', Ga_Gurultulu_Emg_eksi10db, Fs, 'BitsPerSample',16, 'Comment','Emg');
audiowrite('emg_gaus_eksi20db.wav', Ga_Gurultulu_Emg_eksi20db, Fs, 'BitsPerSample',16, 'Comment','Emg');

Audio_Bird1 = audioplayer(Ga_Gurultulu_Emg_eksi20db, Fs, 16);
audiowrite('EMG1.wav', Ga_Gurultulu_Emg_eksi20db, Fs, 'BitsPerSample',16, 'Comment','Emg');
audiowrite('EMG2.wav', Ga_Gurultulu_Emg_eksi20db, Fs2, 'BitsPerSample',16, 'Comment','Emg');
play(Audio_Bird1)   

function plot_ciz(sinyal, figure_no, a, baslik, x_label, y_label)

figure(figure_no);
plot(sinyal);
if a == 1
    axis([0 1000 -5 5]);
end
title(baslik);
xlabel(x_label);
ylabel(y_label);

end

function emg = emg_sinyali_al(isim)

veri = load(isim);
emg=sin(veri.emgsyn1000);

end



%{
audiowrite('emg_ses.wav', Emg_Sinyali, Fs,'BitsPerSample',32);
audiowrite('emg_gaus_5db.wav', Ga_Gurultulu_Emg_5db, Fs);
audiowrite('emg_gaus_0db.wav', Ga_Gurultulu_Emg_0db, Fs);
audiowrite('emg_gaus_eksi10db.wav', Ga_Gurultulu_Emg_eksi10db, Fs);
audiowrite('emg_gaus_eksi20db.wav', Ga_Gurultulu_Emg_eksi20db, Fs);
%}