#!/bin/bash

module load java
module load gatk/3.5.0
export _JAVA_OPTIONS="-Xms4g -Xmx8g -XX:ParallelGCThreads=8"

#SUFIX="_GATKflt.vcf"

#for file1 in *_GATKraw.vcf ; do
#  prefix=`basename $file1 $SUFIX1`

  java -Xmx4g -Xmx8g -jar $HPC_GATK_DIR/GenomeAnalysisTK.jar \
    -T SelectVariants \
    -R ../../PPP1R15A/hg19.fa \
    -V $file1 \
    -L ../Gene_intervals.list \
    --selectTypeToExclude INDEL \
    -o "${prefix}_selected.vcf"

