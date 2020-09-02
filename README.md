# Minimal Linux Live with FIRESTARTER [<img align="right" src="https://travis-ci.org/tud-zih-energy/minimal-linux-FIRESTARTER.svg?branch=master">](https://travis-ci.org/tud-zih-energy/minimal-linux-FIRESTARTER)

For creating a minimal Linux distribution with integrated FIRESTARTER.

## How to build

First install the dependencies.
For example for Ubuntu:

	sudo apt install wget make gawk gcc bc bison flex xorriso libelf-dev libssl-dev

Then run the script to to built everything. It will create the ISO image.

	cd minimal-linux-FIRESTARTER/src
	./build_minimal_linux_live.sh

You will find the file `minimal_linux_live.iso` in the same directory after the build process is finished.

For further information about installing applications ('bundles'), configuring boot options or supporting development please follow the links to the project's homepage [1] or repository [2].

## Usage

If you are running your generated ISO image, simply type in

	FIRESTARTER

to create near-peak power consumption on your machine.

To see all available options, use

	FIRESTARTER -h

or visit the repository [3] of the project. For more information about FIRESTARTER you can also consider the project's homepage [4].

## Links

[1] http://minimal.idzona.com

[2] https://github.com/ivandavidov/minimal

[3] https://github.com/tud-zih-energy/FIRESTARTER/

[4] https://tu-dresden.de/zih/forschung/projekte/firestarter/
