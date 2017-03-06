#!/bin/bash

SUFIX1="_1_sequence.txt.bz2"
SUFIX2="_2_sequence.txt.bz2"

for file1 in *$SUFIX1 ; do
	prefix=`basename $file1 $SUFIX1`
	file2="${prefix}${SUFIX2}"
  echo "Starting sbatch for ${prefix}"

  sbatch --job-name="${prefix}_align" --mail-user=carolsa --mail-type=END,FAIL \
	 -o align_${prefix}_%j.out -e align_${prefix}_%j.err \
	 --nodes=1 --ntasks=8 --mem-per-cpu=12gb --time=20:00:00 \
	--export=prefix=$prefix,file1=$file1,file2=$file2 \
	 --account=ufgi --qos=ufgi-b variant_align.sh
done
