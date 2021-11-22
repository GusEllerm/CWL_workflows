#!/usr/bin/env cwl-runner

cwlVersion: v1.0

class: CommandLineTool
baseCommand: ["beast_applauncher", "BModelAnalyser", "-file"]

inputs:
  beast_output:
    type: File
    inputBinding:
      position: 1

outputs: []
