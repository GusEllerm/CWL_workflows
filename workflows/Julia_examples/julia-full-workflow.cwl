#!/usr/bin/env cwl-runner

cwlVersion: v1.0

class: Workflow

inputs:

  # Shared arguments
  julia_file:
    type: File

  # Step one argument
  gen_command:
    type: string
  data_out:
    type: string

  # Step two argument
  model_command:
    type: string
  model_out:
    type: string

outputs: []

steps:
  generate_data:
    run: julia-get-Iris.cwl
    in:
      julia_file: julia_file
      command: gen_command
      outfile: data_out
    out: [data]

  fit_model:
    run: julia-fit-model.cwl
    in:
      julia_file: julia_file
      model: model_command
      outFile: model_out
      inFile: generate_data/data
    out: []