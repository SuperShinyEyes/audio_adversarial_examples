import librosa
import sys
import numpy as np
from scipy.io import wavfile

def convert_to_wav(path):
    '''
    Requirements for Attack:
        sample rate = 16000
        data type   = np.int16
    '''
    y, sr = librosa.core.load(path, sr=16000)
    y = y * 32767
    new_path = path.split('.')[0] + '.wav'
    print("Exporting to ", new_path)
    wavfile.write('sample.wav', sr, y.astype(np.int16))

if __name__ == '__main__':
    assert len(sys.argv) > 1
    convert_to_wav(sys.argv[1])
