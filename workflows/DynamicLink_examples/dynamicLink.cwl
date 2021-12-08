#!/usr/bin/env cwl-runner

cwlVersion: v1.0

class: CommandLineTool
baseCommand: ["echo"]

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.dataDir)

inputs:
  dataDir:
    type: Directory

  file:
    type: File
    inputBinding:
      position: 1

outputs: []

