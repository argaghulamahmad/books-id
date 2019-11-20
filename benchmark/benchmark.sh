#!/usr/bin/env bash

numofconnections=10000
numofconcurency=1000

printf "[Start]: Start benchmarking vue service! \n\n"
ab -n ${numofconnections} -c ${numofconcurency} -g vue.tsv "http://books.id/"
printf "[End]: Benchmarking vue service is complete! \n\n\n"

printf "[Start]: Start benchmarking vue-admin service! \n\n"
ab -n ${numofconnections} -c ${numofconcurency} -g vue-admin.tsv "http://admin.books.id/"
printf "[End]: Benchmarking vue-admin service is complete! \n\n\n"

printf "[Start]: Start benchmarking flask service! \n\n"
ab -n ${numofconnections} -c ${numofconcurency} -g flask.tsv "http://books.id/books"
printf "[End]: Benchmarking flask service is complete! \n\n\n"

printf "[Start]: Start benchmarking flask-admin service! \n\n"
ab -n ${numofconnections} -c ${numofconcurency} -g flask-admin.tsv "http://admin.books.id/books"
printf "[End]: Benchmarking flask-admin is complete! \n\n\n"

gnuplot -p "flask-admin-benchmark.p"
gnuplot -p "flask-benchmark.p"
gnuplot -p "vue-admin-benchmark.p"
gnuplot -p "vue-benchmark.p"