#!/bin/bash

SUFIX="_sort.bam"

for file in /ufrc/johnson/carolsa/PEAR2_RNASeq/whites/*sort.bam ; do
	prefix=`basename $file $SUFIX`
  	echo "Starting sbatch for ${prefix}"

 	 sbatch --job-name="${prefix}_index" --mail-user=carolsa --mail-type=END,FAIL \
	 -o index_${prefix}_%j.out -e index_${prefix}_%j.err \
	 --nodes=1 --ntasks=8 --mem-per-cpu=8gb --time=5:00:00 \
	--export=prefix=$prefix,file=$file \
	 --account=ufgi --qos=ufgi-b 8_Picard_bam_index.sh
done
