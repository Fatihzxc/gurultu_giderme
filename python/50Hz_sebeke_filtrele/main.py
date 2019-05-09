import sebeke # Benim olusturdugum, sebeke frekansi icin kutuphane
import matplotlib.pyplot as plt
import numpy as np
from scipy.io.wavfile import read
import scipy
from scipy.signal import *

def filter_50(signal):
    fs = 1000.0  # Sample frequency (Hz)
    f0 = 50.0  # Frequency to be removed from signal (Hz)
    w0 = f0 / (fs / 2)  # Normalized Frequency
    Q= 30
    b, a = iirnotch(w0, Q)
    signal = scipy.signal.filtfilt(b, a, signal)
    return(signal)

def main():
    # .wav Ses Dosyasini Okuma 
    input_data = read("emg2.wav")
    audio = input_data[1]/max(input_data[1])
   
    plt.figure()
    plt.plot(audio)  
    plt.title('Emg Sinyali')

    # Ham emg sinyaline 50 Hz Sebeke Sinyali Ekleme    
    audio = sebeke.add_freq(50.0, 1, audio)
        
    # PLOT
    plt.figure()
    plt.plot(audio)  
    plt.title('Sebekeli Emg Sinyali')
    
    # Frekans Spektrumuna Cevrim
    p = 20 * np.log10(np.abs(np.fft.rfft(audio)))
    f = np.linspace(0, 1024 / 2, len(p))

    # Sebekli Emg Spektrumunu grafige bastir
    plt.figure()
    plt.plot(f, p) 
    plt.title('Sebekeli Emg Sinyali Spektrumu')
    
    # Sebeke Eklemis Emg Sinyalden 50 Hz Temizleme Islemi
    audio = filter_50(audio)
    plt.figure()
    plt.plot(audio)
    plt.title("Filterelenmis Emg Sinyal")
    
    # Frekans Spektrumuna Cevrim
    p = 20 * np.log10(np.abs(np.fft.rfft(audio)))
    f = np.linspace(0, 1024 / 2, len(p))
    
    plt.figure()
    plt.plot(f, p)
    plt.title("Filterelenmis Emg Sinyal Spektrumu")
    
    plt.show()

if __name__ == '__main__':
    main()
