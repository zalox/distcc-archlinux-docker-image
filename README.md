# distcc docker image

    docker pull justroots/distcc:v3.3.3

Docker image for a debian/testing `distccd` worker node.

```
base: debian:testing-slim
packages:
- g++
- gcc
- clang
- distcc

services:
  name: distccd
  port: 3632

```
