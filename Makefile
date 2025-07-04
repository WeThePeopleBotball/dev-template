# Defaults
user = kipr
roboter = 192.168.125.1
docker_image = wtp:cross
build_dir = build
project_dir = $(shell pwd)
name ?= main
target_bin = bin/$(name)

CMAKE_FLAGS = -DCMAKE_C_COMPILER=/usr/bin/aarch64-linux-gnu-gcc -DCMAKE_CXX_COMPILER=/usr/bin/aarch64-linux-gnu-g++

compile:
	docker run --rm -it \
		--volume $(project_dir):$(project_dir):rw \
		--workdir $(project_dir) \
		--user $$(id -u):$$(id -g) \
		$(docker_image) \
		bash -c "cmake -B $(build_dir) $(CMAKE_FLAGS) -DTARGET_NAME=$(name) && cmake --build $(build_dir) -j$$(nproc)"	

compile_commands: compile
	cp $(build_dir)/compile_commands.json ./

docs:
	docker run --rm -it \
		--volume $(project_dir):$(project_dir):rw \
		--workdir $(project_dir) \
		--user $$(id -u):$$(id -g) \
		$(docker_image) \
		doxygen Doxyfile

image:
	docker build .docker/ -t $(docker_image)

deploy: compile
	ssh $(user)@$(roboter) -t "mkdir -p ~/apps/"
	scp $(target_bin) $(user)@$(roboter):~/apps/$(name)

run: deploy
	ssh $(user)@$(roboter) -t "~/apps/$(name)"

ssh:
	ssh $(user)@$(roboter)
