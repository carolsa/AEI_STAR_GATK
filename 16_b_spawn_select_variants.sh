#!/bin/bash

SUFIX="_GATKannotated.vcf"

for file1 in *_GATKannotated.vcf ; do
  prefix=`basename $file1 $SUFIX`
  echo "Starting sbatch for ${prefix}"

  sbatch --job-name="${prefix}_select" --mail-user=carolsa --mail-type=END,FAIL \
       -o select_${prefix}_%j.out -e select_${prefix}_%j.err \
       --nodes=1 --ntasks=8 --mem-per-cpu=8gb --time=5:00:00 \
       --export=prefix=$prefix,file1=$file1 \
       --account=ufgi --qos=ufgi-b \
       15_a_GATK_select_variants.sh
done
