#!/bin/bash

for file in *sort.bam ; do
        prefix=`basename $file _sort.bam`
  	echo "Starting sbatch for ${prefix}"

 	sbatch --job-name="${prefix}" --mail-user=carolsa --mail-type=END,FAIL \
	-o split_${prefix}_%j.out -e split_${prefix}_%j.err \
	--nodes=1 --ntasks=8 --mem-per-cpu=8gb --time=10:00:00 \
        --export=prefix=$prefix,file=$file \
	--qos=johnson-b 9_GATK_split.sh
done
