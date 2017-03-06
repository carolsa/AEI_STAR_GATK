#!/bin/bash
SUFIX="_Read.bam"

for file in *Read.bam ; do
	prefix=`basename $file $SUFIX`
  	echo "Starting sbatch for ${prefix}"

 	 sbatch --job-name="${prefix}_MD" --mail-user=carolsa --mail-type=END,FAIL \
	 -o MD_${prefix}_%j.out -e MD_${prefix}_%j.err \
	 --nodes=1 --ntasks=8 --mem-per-cpu=8gb --time=20:00:00 \
	--export=prefix=$prefix,file=$file \
	 --account=ufgi --qos=ufgi-b 6_Picard_marked_duplicates.sh
done
