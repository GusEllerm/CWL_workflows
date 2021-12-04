#!/usr/bin/env cwl-runner

cwlVersion: v1.0

class: CommandLineTool
baseCommand: ["beast", "-threads", "8"]

inputs:
  beastXML_file:
    type: File
    inputBinding:
      position: 1

outputs:
  logfile:
    type: File
    outputBinding:
      glob: '*.log'

  statefile:
    type: File
    outputBinding:
      glob: '*.state'


