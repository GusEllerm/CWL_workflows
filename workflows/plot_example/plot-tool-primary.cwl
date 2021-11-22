#!/usr/bin/env cwl-runner

cwlVersion: v1.0

class: CommandLineTool
baseCommand: ["gnuplot"]

arguments: ["-e",
            "set terminal png size 400,300;
            set output 'figureOut.png';
            set autoscale;
            unset log;
            unset label;
            set xtic auto;
            set ytic auto;
            set title 'Force Deflection Data for a Beam and a Column';
            set xlabel 'Deflection (meters)';
            set ylabel 'Force (kN)';
            set label 'Yield Point' at 0.003,260;
            set arrow from 0.0028,250 to 0.003,280;
            set xr [0.0:0.022];
            set yr [0:325];
            plot '$(inputs.data.path)' using 1:2 title 'Column' with linespoints, '$(inputs.data.path)' using 1:3 title 'Beam' with points"]

requirements:
  InlineJavascriptRequirement: {}




inputs:
  data:
    type: File

outputs:
  figure:
    type: File
    outputBinding:
      glob: figureOut.png

