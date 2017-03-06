#!/bin/bash
SUFIX="_baseRecal.bam"

for file1 in *_baseRecal.bam ; do
	prefix=`basename $file1 $SUFIX`
	echo "Starting sbatch for ${prefix}"

	sbatch --job-name="${prefix}_hapl" --mail-user=carolsa --mail-type=ALL \
       -o hapl_${prefix}_%j.out -e hapl_${prefix}_%j.err \
       --nodes=1 --ntasks=8 --mem-per-cpu=10gb --time=12:00:00 \
       --export=prefix=$prefix,file1=$file1 \
       --account=ufgi --qos=ufgi-b 12_b_GATK_haplotype_caller.sh

done
