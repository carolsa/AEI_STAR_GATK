#!/bin/bash
SUFIX="_GATKraw.vcf"

for file in *_GATKraw.vcf ; do
  	prefix=`basename $file $SUFIX`
	echo "Starting sbatch for ${prefix}"

        sbatch --job-name="${prefix}_filt" --mail-user=carolsa --mail-type=ALL \
       -o filt_${prefix}_%j.out -e filt_${prefix}_%j.err \
       --nodes=1 --ntasks=8 --mem-per-cpu=8gb --time=8:00:00 \
       --export=prefix=$prefix,file=$file \
       --account=ufgi --qos=ufgi-b 13_b_GATK_filtering_variants.sh
done
