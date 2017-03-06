#!/bin/bash
#
#SBATCH --job-name=Variant_index
#SBATCH --mail-user=carolsa
#SBATCH --mail-type=ALL
#SBATCH --output Variant_index_%j.out
#SBATCH --error Variant_index_%j.err
#SBATCH --ntasks=8
#SBATCH --mem-per-cpu=50gb
#SBATCH --time=4:00:00
#SBATCH --account=ufgi
#SBATCH --qos=ufgi-b

[[ -d $SLURM_SUBMIT_DIR ]] && cd $SLURM_SUBMIT_DIR

module load gcc/5.2.0
module load star/2.5.2b

STAR-bigmem --runMode genomeGenerate --runThreadN 8 \
            --genomeDir ./PEAR-2_variant_index \
            --genomeFastaFiles switched_genome.fasta \
            --sjdbFileChrStartEnd ./*out.tab \
            --sjdbOverhang 99 \
	    --limitSjdbInsertNsj 1443295


