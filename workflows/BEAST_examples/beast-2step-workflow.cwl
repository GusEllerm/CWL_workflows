#!/usr/bin/env cwl-runner

cwlVersion: v1.0

class: Workflow
inputs:
  beastXML_file:
    type: File

outputs: []

steps:
  beast_analysis:
    run: beast-tool-primary.cwl
    in:
      beastXML_file: beastXML_file
    out: [logfile, statefile]

  bModelAnalyser:
    run: bModel-tool-primary.cwl
    in:
      beast_output: beast_analysis/logfile
    out: []