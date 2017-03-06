#!/bin/bash

SUFIX1="_1_sequence.txt.bz2"
SUFIX2="_2_sequence.txt.bz2"

for file1 in *$SUFIX1 ; do
	prefix=`basename $file1 $SUFIX1`
	file2="${prefix}${SUFIX2}"
  echo "Starting sbatch for ${prefix}"

  sbatch --job-name="${prefix}_align" --mail-user=carolsa --mail-type=ALL \
       -o align_${prefix}_%j.out -e align_${prefix}_%j.err \
       --ntasks=8 --mem-per-cpu=30gb --time=12:00:00 \
       --export=prefix=$prefix,file1=$file1,file2=$file2 \
       --account=ufgi --qos=ufgi-b \
       2b_STAR_align.sh
done
