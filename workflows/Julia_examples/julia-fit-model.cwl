#!/usr/bin/env cwl-runner

cwlVersion: v1.0

class: CommandLineTool
baseCommand: ["julia"]

inputs:

  julia_file:
    type: File
    inputBinding:
      position: 1

  model:
    type: string
    inputBinding:
      position: 2

  outFile:
    type: string
    inputBinding:
      position: 3

  inFile:
    type: File
    inputBinding:
      position: 4

outputs: []


