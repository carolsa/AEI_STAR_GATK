#!/bin/bash

SUFIX1="_baseRecal.bam"
SUFIX2="_GATKflt.vcf"

for file1 in *_baseRecal.bam ; do
  prefix=`basename $file1 $SUFIX1`
  file2="${prefix}${SUFIX2}"
  echo "Starting sbatch for ${prefix}"

sbatch --job-name="${prefix}_annot" --mail-user=carolsa --mail-type=ALL \
       -o annot_${prefix}_%j.out -e annot_${prefix}_%j.err \
       --ntasks=8 --mem-per-cpu=8gb --time=12:00:00 \
       --export=prefix=$prefix,file1=$file1,file2=$file2 \
       --account=ufgi --qos=ufgi-b \
       14_a_GATK_variant_annotator.sh
done
