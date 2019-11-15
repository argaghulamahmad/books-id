#!/usr/bin/env bash

numofconnections=10000
numofconcurency=1000

for url in $(cat urls.txt) ; do
        printf "[Start]: Start benchmarking %s service! \n\n" ${url}
        ab -n ${numofconnections} -c ${numofconcurency} ${url}
        printf "[End]: Benchmarking %s service is complete! \n\n\n" ${url}
done