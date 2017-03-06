#!/bin/bash

[[ -d $SLURM_SUBMIT_DIR ]] && cd $SLURM_SUBMIT_DIR

module load gcc/5.2.0
module load star/2.5.2b


STAR-bigmem --runThreadN 8 --genomeDir ../Prepare_reference --readFilesCommand bzcat --readFilesIn "$file1" "$file2" --outFileNamePrefix "${prefix}" --outSAMtype BAM SortedByCoordinate

