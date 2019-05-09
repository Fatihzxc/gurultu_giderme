import numpy as np
def add_freq(freq, amplitude, signal):
    A = amplitude
    f = freq
    T = 1/f
    fs = 1000
    Ts = 1/fs   
    t = np.arange(0, 1 , Ts)
    x = A * np.sin(2*np.pi*f*t)
    x = x / (max(x) *25)    
    return (signal + x)

