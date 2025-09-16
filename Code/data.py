import os
import cv2
import librosa
import IPython
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from tqdm import tqdm
import tensorflow as tf
from warnings import filterwarnings
from sklearn.preprocessing import LabelEncoder
filterwarnings("ignore")


audio_data, sample_rate=librosa.load(path='C:/Users/jryan/Documents/Bird Sound Detection/Birds Sounds/House Crow1.mp3')
librosa.display.waveshow(y=audio_data, sr=sample_rate)
file_path = 'C:/Users/jryan/Documents/Bird Sound Detection/Birds Sounds/House Crow1.mp3'
y, sr = librosa.load(file_path)

# Plot the waveform
plt.figure(figsize=(15, 5))
librosa.display.waveshow(y, sr=sr)
plt.title('Waveform of House Crow')
plt.xlabel('Time (s)')
plt.ylabel('Amplitude')
plt.tight_layout()
plt.show()


