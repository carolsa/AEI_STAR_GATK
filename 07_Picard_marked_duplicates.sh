#!/bin/bash
date;hostname;pwd
[[ -d $SLURM_SUBMIT_DIR ]] && cd $SLURM_SUBMIT_DIR

 
module load picard/2.0.1
export _JAVA_OPTIONS="-Xms4g -Xmx8g -XX:ParallelGCThreads=8"


	picard MarkDuplicates \
		I=$file \
		O="${prefix}_MD.bam" \
		METRICS_FILE="${prefix}_picardmetrics.met" \
		REMOVE_DUPLICATES=true \
		CREATE_INDEX=true \
		VALIDATION_STRINGENCY=LENIENT
