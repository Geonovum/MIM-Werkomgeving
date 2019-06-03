#!/bin/bash
echo Empty Container
curl -X PUT -T empty.ttl http://localhost:8080/bp4mc2/container/mim
cd model
for f in *.ttl ; do echo ${f%.ttl}; curl -X POST -T $f http://localhost:8080/bp4mc2/container/mim ; done
