# dockepos

Docker container with the complete EPOS toolchain

### Building
```
git clone git@github.com:caiopo/dockepos.git
cd dockepos
docker build . -t <image-tag>
```

### Running
Copy `dockepos` to the root of your EPOS project.

Example:
```
./dockepos <image-tag> make all
```
