#!/bin/bash
echo Empty Container
curl -X PUT -T empty.ttl http://localhost:8080/data2model/container/model
cd model
for f in *.ttl ; do echo ${f%.ttl}; curl -X PUT -T $f http://localhost:8080/data2model/container/addmodel ; done
