#!/bin/bash
#SBATCH --job-name=reference_maker
#SBATCH --mail-user=carolsa
#SBATCH --mail-type=ALL
#SBATCH --output=switched_%j.out
#SBATCH --error=swithced_%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem-per-cpu=8gb
#SBATCH --time=20:00:00
date;hostname;pwd
[[ -d $SLURM_SUBMIT_DIR ]] && cd $SLURM_SUBMIT_DIR
 
module load java
module load gatk/3.5.0
export _JAVA_OPTIONS="-Xms4g -Xmx8g"

java -Xmx4g -Xmx8g -jar $HPC_GATK_DIR/GenomeAnalysisTK.jar \
	 -T FastaAlternateReferenceMaker \
	 -U ALLOW_SEQ_DICT_INCOMPATIBILITY \
	 -R ../Prepare_reference/hg19.fa -o switched_genome.fasta -V sorted_selected_SNPs_DE_genes.vcf

