# Signal Analysis in Python

This document provides basic Python code snippets for performing signal analysis using popular libraries such as `numpy`, `scipy`, and `matplotlib`. These examples include signal generation, Fourier transform analysis (FFT), filtering, and spectrogram analysis.

## 1. Generating a Simple Sinusoidal Signal

The following code generates a sinusoidal signal with a given frequency and amplitude, sampled at a specific rate. It then visualizes the signal using `matplotlib`.

```python
import numpy as np
import matplotlib.pyplot as plt

# Parameters for the signal
frequency = 5  # Frequency in Hz
fs = 100  # Sampling frequency (samples per second)
t = np.linspace(0, 1, fs, endpoint=False)  # Time vector
amplitude = 1  # Signal amplitude

# Generate the sinusoidal signal
signal = amplitude * np.sin(2 * np.pi * frequency * t)

# Plot the signal
plt.plot(t, signal)
plt.title('Sinusoidal Signal')
plt.xlabel('Time [s]')
plt.ylabel('Amplitude')
plt.grid(True)
plt.show()
