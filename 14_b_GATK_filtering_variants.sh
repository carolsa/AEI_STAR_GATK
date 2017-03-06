#!/bin/bash

[[ -d $SLURM_SUBMIT_DIR ]] && cd $SLURM_SUBMIT_DIR

module load java
module load gatk/3.5.0
tmp_dir="`pwd`/${prefix}_$$_tmp"
rm -Rf $tmp_dir
mkdir $tmp_dir
export _JAVA_OPTIONS="-Xms4g -Xmx8g -XX:ParallelGCThreads=8 -Djava.io.tmpdir=${tmp_dir}"
  java -Xmx4g -Xmx8g -jar $HPC_GATK_DIR/GenomeAnalysisTK.jar \
    -T VariantFiltration \
    -R ../../PPP1R15A/hg19.fa \
    -V $file \
    -window 35 \
    -cluster 3 \
    -filterName FS \
    -filter "FS > 30.0" \
    -filterName QD \
    -filter "QD < 2.0" \
    -o "${prefix}_GATKflt.vcf"
rm -Rf $tmp_dir
