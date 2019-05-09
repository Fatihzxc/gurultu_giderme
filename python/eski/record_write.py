import sounddevice as sd
import numpy as np
import scipy.io.wavfile as wav

fs=44100
duration = 5 # seconds
myrecording = sd.rec(duration * fs, samplerate=fs, channels=2,dtype='float64')
print("Ses Kayit Baslamistir") # Recording Audio
sd.wait()
print("Ses Kaydetme Islemi Bitmistir, Ses oynatimi basliyor") # Audio recording complete , Play Audio
sd.play(myrecording, fs)
sd.wait()
print("Ses oynatimi basarili")  # Play Audio Complete
wav.write("deneme.wav", fs, myrecording)
print("Yazma Basarili")
