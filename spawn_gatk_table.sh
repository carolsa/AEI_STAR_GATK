#!/bin/bash


SUFIX="_split.bam"

for file in *split.bam ; do
        prefix=`basename $file $SUFIX`

 	 sbatch --job-name="${prefix}_table" --mail-user=carolsa --mail-type=END,FAIL \
	 -o table_${prefix}_%j.out -e table_${prefix}_%j.err \
	 --nodes=1 --ntasks=8 --mem-per-cpu=8gb --time=5:00:00 \
	--export=prefix=$prefix,file=$file \
	 --account=ufgi --qos=ufgi-b 10_GATK_pre_table.sh
done
