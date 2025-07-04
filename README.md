# dev-template

This is a minimal robotics project template using `wtp-lib` as a submodule. It provides a CMake-based build and deploy system, intended for cross-compilation with Docker.

## Project Structure

* `src/` – Source files (must include `main.cpp`)
* `include/` – User-defined headers
* `wtp-lib/` – Git submodule with the shared robotics framework

All functionality from `wtp-lib` is accessible directly without prefixing paths (e.g. `#include <navigation/navigation.hpp>`).

## Setup

Clone with submodules:

```
git clone --recurse-submodules https://github.com/WeThePeopleBotball/dev-template
```

Update submodules:

```
git submodule update --remote --merge --recursive
```

## Make Targets

Use the provided `Makefile` to compile and deploy:

* `make compile` – Build the project using Docker and CMake
* `make compile_commands` – Generate `compile_commands.json` for tooling
* `make docs` – Build Doxygen documentation
* `make image` – Build the Docker image (`wtp:cross`)
* `make deploy` – Upload binary to the robot at `192.168.125.1`
* `make run` – Compile, deploy, and run
* `make ssh` – Open SSH session to robot

All settings (e.g. `name`, `docker_image`, `roboter`) can be overridden via environment variables.
