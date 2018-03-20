This package provides the Packer executable and cached plugins as a Calamari package.

The Packer executable is updated by overwriting the `packer.exe` file.

Terraform plugins can be saved in the `plugins` directory. These plugins will be used instead of the downloads from the Terraform 
website if they match the versions being requested.

How to update this project:

1. Download the 32 bit version of the Packer exe from https://www.packer.io/downloads.html and overwrite packer.exe.
2. The packer.nuspec file version x.y.z matches the Packer version. The final component of the packer.nuspec version (the release version) 
can be incremented to reflect internal releases.