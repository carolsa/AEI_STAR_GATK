#!/bin/bash

date;hostname;pwd

[[ -d $SLURM_SUBMIT_DIR ]] && cd $SLURM_SUBMIT_DIR
 
module load java
module load picard/1.137
export _JAVA_OPTIONS="-Xms4g -Xmx8g -XX:ParallelGCThreads=8"

      picard AddOrReplaceReadGroups \
      I=$file \
      O="${prefix}_Read.bam" \
      RGID="${prefix}" \
      RGLB="${prefix}" \
      RGPL=illumina \
      RGPU="${prefix}" \
      RGSM="${prefix}" \
      VALIDATION_STRINGENCY=LENIENT \

