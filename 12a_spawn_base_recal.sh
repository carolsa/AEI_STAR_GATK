#!/bin/bash

SUFIX1="_split.bam"
SUFIX2="_pre.table"

for file1 in *_split.bam ; do
  prefix=`basename $file1 $SUFIX1`
  file2="${prefix}${SUFIX2}"
  echo "Starting sbatch for ${prefix}"

  sbatch --job-name="${prefix}_recal" --mail-user=carolsa --mail-type=ALL \
       -o recal_${prefix}_%j.out -e recal_${prefix}_%j.err \
       --ntasks=8 --mem-per-cpu=30gb --time=12:00:00 \
       --export=prefix=$prefix,file1=$file1,file2=$file2 \
       --account=ufgi --qos=ufgi-b \
       11b_final_base_recal.sh
done
