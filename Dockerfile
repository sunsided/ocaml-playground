# Use an official OCaml image as a parent image
FROM ocaml/opam:ubuntu

# Set the working directory in the container
WORKDIR /usr/src/app

# Install system dependencies (if any)
RUN sudo apt-get update && sudo apt-get install -y m4

# Install OCaml dependencies
RUN opam install dune ounit2 ocamlformat

# Copy the current directory contents into the container at /usr/src/app
ADD src src
ADD test test
ADD *.opam .
ADD dune-project .
ADD .ocamlformat .

# Lint with OCamlformat
RUN eval $(opam env) && ocamlformat --check src/*.ml src/*.ml test/*.ml

# Build the project
RUN eval $(opam env) && dune build @all

# Run tests
RUN eval $(opam env) && dune runtest

# Command to run tests
CMD ["dune", "runtest"]

