ENV["PYTHON"]=""
using Pkg
Pkg.add("IJulia")
Pkg.build("IJulia")
Pkg.add("Plots")
Pkg.build("Plots")
