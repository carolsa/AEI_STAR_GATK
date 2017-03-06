#!/bin/bash
#SBATCH --job-name=whites_sort
#SBATCH --mail-user=carolsa
#SBATCH --mail-type=ALL
#SBATCH --output=ALL_sort_%j.out
#SBATCH --error=ALL_sort_%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem-per-cpu=10gb
#SBATCH --time=20:00:00
date;hostname;pwd
cd $SLURM_SUBMIT_DIR 

module load picard/2.0.1
export _JAVA_OPTIONS="-Xms4g -Xmx10g -XX:ParallelGCThreads=8"

SUFIX="_MD.bam"

for file in *MD.bam ; do
	prefix=`basename $file $SUFIX`
	tmp_dir="`pwd`/${prefix}_$$_tmp"
	rm -Rf $tmp_dir
	mkdir $tmp_dir 
	
	picard SortSam \
		I=$file \
		O="${prefix}_sort.bam" \
		SORT_ORDER=coordinate \
		VALIDATION_STRINGENCY=LENIENT \
        	TMP_DIR=$tmp_dir

	rm -Rf $tmp_dir
done
