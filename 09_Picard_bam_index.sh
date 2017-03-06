#!/bin/bash
#

cd $PBS_O_WORKDIR

module load picard/2.0.1

export _JAVA_OPTIONS="-Xms4g -Xmx8g -XX:ParallelGCThreads=8"

picard BuildBamIndex \
          I=$file \
	  VALIDATION_STRINGENCY=LENIENT

