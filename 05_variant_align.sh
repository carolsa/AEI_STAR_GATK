#!/bin/bash

[[ -d $SLURM_SUBMIT_DIR ]] && cd $SLURM_SUBMIT_DIR

module load gcc/5.2.0
module load star/2.5.2b

tmp_dir="`pwd`/${prefix}_$$_tmp"
rm -Rf $tmp_dir

STAR-bigmem --runThreadN 8 --genomeDir ./PEAR-2_variant_index --readFilesCommand bzcat \
	 --readFilesIn "$file1" "$file2" \
	 --outFileNamePrefix "${prefix}" \
	 --outSAMtype BAM SortedByCoordinate \
	 --outTmpDir $tmp_dir

date;hostname;pwd

