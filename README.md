# Dev Template
- Credits: [FrenchBakery Dev-Template](https://github.com/frenchbakery/dev_template)

## Commands
- ``copy_files``: copies all files required to build the project to a Project folder of the same name as locally (src/, include/, Makefile, env.mk)
- ``remote_build``: envokes the default make target on the target host to build the project from the (previously copied) source files
- ``remote_start``: runs the binary (run/main) on the target host (it has to be build beforehand)
- ``local_compile``: compiles the sources into objects locally. This should never be called directly unless there is a really good reason.
- ``shell``: opens an SSH session to the configured target host
- ``keygen``: invokes ssh-keygen to generate a SSH key pair (use this if you haven't already generated a pair)
- ``keycopy``: invokes ssh-copy-id to copy the default SSH key to the configured remote target. If no keys are found, use keygen to generate them
- ``start``: copies the files, builds the project and runs it on the target all in one command. This just invokes the first three make targets in a row
- ``hstart``: same as start but doing the first compile step on the dev machine (hybrid compilation). This is significantly faster
- ``build``: same as start but without running the binary
- ``hbuild``: same as hstart but without running the binary
- ``mount``: mounts the Wombat's file system in the "mount" folder in the project directory. This only works if sshfs is installed in the container (it isn't by default)
- ``unmount``: unmounts the Wombat's file system mounted using mount
- ``clean``: removes any object and binary files. This doesn't do anything in the container because these files are only created during compilation on the target

## Note for Clangd users
You may want to add the ``--header-insertion=never`` flag when calling the LSP or it will import stuff from other than `<kipr/wombat.h>`
