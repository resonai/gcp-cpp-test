# gcp-cpp-test
open source test for compiling google-cloud-cpp with ybt, clang, libc++

# Setup:
1. install docker
2. install ybt:
```
pip install ybt
```
3. build:
```
ybt build :run_repro
```
4. test:
```
./ybt_bin/run_repro <bucket> <prefx>
```
