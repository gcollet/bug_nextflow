#!/usr/bin/env nextflow

/* CHANNEL
 * Path to the SampleSheet as defined in nextflow.config
 */
samplesheet = Channel.fromPath( "${params.sample_sheet}" )

/* PROCESS
 * cut_samplesheet removes the first line of the SampleSheet
 * because it is not a valid csv file.
 */
process cut_samplesheet {

  input:
    file sample_file from samplesheet

  output:
    file 'tmp.csv' into tmp_csv

  shell:
  '''
  perl !{baseDir}/prep_samplesheet.pl !{sample_file} > tmp.csv
  '''
}
