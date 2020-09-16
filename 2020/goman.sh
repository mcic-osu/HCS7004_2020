# OSC:
ls /fs/ess/PAS1752/HCS7004_Files
ls /fs/scratch/PAS1752/jelmer
ls /fs/ess/PAS1752/HCS7004_Files/Lab3/fastqc_files

## Test container
cd ~/Dropbox/mcic/teaching/gen-an/2020/2020-09-16_containers/cont
sudo singularity build --sandbox multiQC/ docker://ubuntu:20.04
sudo singularity shell --writable multiQC/

cd /fs/scratch/PAS1752/jelmer
singularity exec -B /fs/ess/PAS1752/HCS7004_Files/Lab3/fastqc_files multiqc.sif multiqc /fs/ess/PAS1752/HCS7004_Files/Lab3/fastqc_files