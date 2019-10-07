#!/bin/bash
echo Empty Container
curl -X PUT -T empty.ttl http://linkeddata.ordina.nl/data2model/container/model
cd model
for f in *.ttl ; do echo ${f%.ttl}; curl -X POST -T $f http://linkeddata.ordina.nl/data2model/container/addmodel ; done
