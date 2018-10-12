#!/bin/bash


imageName=$1
tag=$2

if [ -e /l/.singularity/$imageName-$tag.simg ]
then
		echo "Delete!"
		rm /l/.singularity/$imageName-$tag.simg
fi

docker build -t shinyeyes/$imageName:$tag . && docker push shinyeyes/$imageName:$tag && singularity pull docker://shinyeyes/$imageName:$tag
singularity-u-net $imageName-$tag

singularity shell -s /bin/bash --nv -B /l/parks1/audio_adversarial_examples:/project ${SINGULARITY_PULLFOLDER}/$imageName-$tag.simg

