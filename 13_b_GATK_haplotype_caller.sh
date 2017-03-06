#!/bin/bash

[[ -d $SLURM_SUBMIT_DIR ]] && cd $SLURM_SUBMIT_DIR

module load java
module load gatk/3.5.0
tmp_dir="`pwd`/${prefix}_$$_tmp"
rm -Rf $tmp_dir
mkdir $tmp_dir
export _JAVA_OPTIONS="-Xms4g -Xmx10g -XX:ParallelGCThreads=8 -Djava.io.tmpdir=${tmp_dir}"

#SUFIX="_baseRecal.bam"

#for file1 in *_baseRecal.bam ; do
#  prefix=`basename $file1 $SUFIX1`

java -Xmx4g -Xmx10g -jar $HPC_GATK_DIR/GenomeAnalysisTK.jar \
    -T HaplotypeCaller \
    -R ../../PPP1R15A/hg19.fa \
    -I $file1 \
    -dontUseSoftClippedBases \
    -stand_call_conf 20.0 \
    -stand_emit_conf 20.0 \
    -o "${prefix}_GATKraw.vcf"
rm -Rf $tmp_dir
