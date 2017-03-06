#!/bin/bash
#
#SBATCH --job-name=PEAR2_INDEX
#SBATCH --mail-user=carolsa
#SBATCH --mail-type=ALL
#SBATCH -o pear2_index_%j.out
#SBATCH -e pear2_index_%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem-per-cpu=12gb
#SBATCH --time=12:00:00

[[ -d $SLURM_SUBMIT_DIR ]] && cd $SLURM_SUBMIT_DIR 

module load gcc/5.2.0 
module load star/2.5.2b 
#before running mkdir PEAR2_index **requeired**
STAR-bigmem --runMode genomeGenerate --runThreadN 8 \
	--genomeDir ./PEAR2_index \
	--genomeFastaFiles ../Prepare_reference/hg19.fa \
	--sjdbFileChrStartEnd ./*SJ.out.tab \
	--sjdbOverhang 99 --limitSjdbInsertNsj 1443500 
