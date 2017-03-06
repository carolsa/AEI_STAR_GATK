#!/bin/bash
#

[[ -d $SLURM_SUBMIT_DIR ]] && cd $SLURM_SUBMIT_DIR

module load java
module load gatk/3.5.0

tmp_dir="`pwd`/${prefix}_$$_tmp"
rm -Rf $tmp_dir
mkdir $tmp_dir
export _JAVA_OPTIONS="-Xms4g -Xmx30g -XX:ParallelGCThreads=8 -Djava.io.tmpdir=${tmp_dir}"

java -Xmx4g -Xmx30g -jar $HPC_GATK_DIR/GenomeAnalysisTK.jar \
  -T PrintReads \
  -R ../../PPP1R15A/hg19.fa \
  -I $file1 \
  -BQSR $file2 \
  -o "${prefix}_baseRecal.bam"

rm -Rf $tmp_dir
