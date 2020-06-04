# qiskit-pi

This contains a Dockerfile that installs IBM's [qiskit](https://qiskit.org/) Quantum Computing framework
in a docker container on a Raspberry Pi.

It's a work in progress but as of this commit I can build a container with jupyter and qiskit that runs simple examples.

It needs tidying up and much more testing but it's a good start.

Once I've done more testing I will publish the pre-built container.



## Alternatives!

You may prefer to install qiskit on the Pi in a virtual environment.

As of 1 June the installation takes under an hour and a half on an 8GB Pi 4 running Raspberry Pi OS.

It requires you to install the rust nightly build, so it takes up a fair amount of space.
I believe you can uninstall rust after pip has installed `retowrkx`.

I've saved a copy of the history of a successful installation in virtual-qiskit.txt in this repository
so you can repeat it if you prefer.

## Warning

I've had to pin an old build of pyscf (1.4.5) in both builds as the current version does not build on pywheels
and I cannot get it to install locally. This may mean that some of the packages in quiskit-aqua are broken.

