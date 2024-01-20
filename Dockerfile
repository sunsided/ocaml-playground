# Use an official OCaml image as a parent image
FROM ocaml/opam:ubuntu

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install system dependencies (if any)
RUN sudo apt-get update && sudo apt-get install -y m4

# Install OCaml dependencies
RUN opam install dune ounit2 ocamlformat

# Lint with OCamlformat
RUN eval $(opam env) && ocamlformat --check src/*.ml src/*.ml test/*.ml

# Build the project
RUN eval $(opam env) && dune build @all

# Run tests
RUN evail $(opam env) && done runtest

# Command to run tests
CMD ["dune", "runtest"]

