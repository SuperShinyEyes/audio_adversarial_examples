import librosa
import sys

def convert_to_wav(path):
	y, sr = librosa.core.load(path, sr=16000)
	new_path = path.split('.')[0] + '.wav'
	print("Exporting to ", new_path)
	librosa.output.write_wav(new_path, y, sr)

if __name__ == '__main__':
	assert len(sys.argv) > 1
	convert_to_wav(sys.argv[1])
