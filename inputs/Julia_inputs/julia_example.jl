import Pkg
tempdir = mktempdir()
Pkg.activate(tempdir)
Pkg.add(["DataFrames", "DecisionTree", "DelimitedFiles", "CategoricalArrays","ArgParse","MLJ","CSV"])

import DataFrames
import Random

using DecisionTree
using DelimitedFiles
using CategoricalArrays
using DataFrames
using ArgParse
using MLJ
using CSV
using Pkg



const COERCE_IRIS = (
    :sepal_length => Continuous,
    :sepal_width  => Continuous,
    :petal_length => Continuous,
    :petal_width  => Continuous,
    :target       => Multiclass)

function parse_commandline()
    s = ArgParseSettings()

    @add_arg_table! s begin
        "--loadIris"
            help = "loads Iris data"
            action = :store_true
        "--trainModel"
            help = "Trains an Iris model"
            action = :store_true
        "outFile"
            help = "target outfile"
            arg_type = String
        "inFile"
            help = "target infile"
            arg_type = String
    end

    return parse_args(s)
end

function load_iris_data(outFile)
    println("Loading Iris to $outFile")
    CSV.write(string(outFile), load_iris())
    println("Finished loading Iris data to $outFile")
end

function train_iris_model(inFile, outFile)
    println("Training model on $inFile data")

    data_raw, data_header = readdlm(inFile, ',', header=true)
    data_table = MLJ.MLJBase.table(data_raw; names=Symbol.(vec(data_header)))

    data_features = [data_table[1] data_table[2] data_table[3] data_table[4]]
    data_labels = data_table[5]

    model = DecisionTreeClassifier(max_depth=4)

    DecisionTree.fit!(model, data_features, data_labels)
    print_tree(model, 5)
    # CSV.write(string(outFile), test)



end

function main()

    parsed_args = parse_commandline()
    println("Parsed args:")
    for (arg,val) in parsed_args
        println("  $arg  =>  $val")
    end

    if (parsed_args["loadIris"])
        if (!(parsed_args["outFile"] === nothing))
            load_iris_data(parsed_args["outFile"])
        else
            println("No out file specified")
        end
    end

    if(parsed_args["trainModel"])
        if (!(parsed_args["inFile"] === nothing) | !(parsed_args["outFile"] === nothing))
            train_iris_model(parsed_args["inFile"], parsed_args["outFile"])
        else
            print("Error in outFile and/or inFile")
        end
    end

end



main()

