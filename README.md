# dockepos

Docker container with the complete EPOS toolchain

### Building
```
git clone git@github.com:caiopo/dockepos.git
cd dockepos
docker build . -t caiopo/dockepos
```

### Running
Copy `dockepos` to the root of your EPOS project.

Example:
```
./dockepos make all
```
