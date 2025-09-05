podman-build: 
	podman build -t sionna-gpu-env .

run-container-gpu:
	podman run --gpus all --rm -d -it -p 8888:8888 -v ${PWD}:/app sionna-gpu-env