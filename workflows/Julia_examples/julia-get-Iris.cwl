#!/usr/bin/env cwl-runner

cwlVersion: v1.0

class: CommandLineTool
baseCommand: ["julia"]

inputs:
  julia_file:
    type: File
    inputBinding:
      position: 1

  command:
    type: string
    inputBinding:
      position: 2

  outfile:
    type: string
    inputBinding:
      position: 3

outputs:
  data:
    type: File
    outputBinding:
      glob: '*.data'



