FROM tensorflow/tensorflow:1.8.0-gpu-py3

# Solve locale issues when running Tensorboard.
# My host has language-pack-fi but I want to use
# language-pack-en in the container
RUN apt-get clean && apt-get update && apt-get install -y \
	locales \
	language-pack-fi  \
	language-pack-en && \
    export LANGUAGE=en_US.UTF-8 && \
    export LANG=en_US.UTF-8 && \
    export LC_ALL=en_US.UTF-8 && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales

RUN apt-get update && \
    apt-get install -y \
        ffmpeg \
        libav-tools \
        libav-tools && \
    pip install numpy scipy pandas jupyter python_speech_features

# For operation. Code to run after experiment.
RUN apt-get update && apt-get install -y git && \
	pip install gitpython && \
	# For plotting audio files
	apt-get install -y python3-tk

RUN pip install pyxdg pydub

RUN pip install deepspeech-gpu==0.2.0a8

# Solve Jupyter permission issue
CMD unset XDG_RUNTIME_DIR && \
    jupyter notebook --port=12220 --no-browser
