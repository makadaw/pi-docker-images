#!/usr/bin/env bash

images=(
)

PREFIX="mypi"

function build {
	echo "Entering $1"
	echo "Building $1/Dockerfile"
	cd $1
	if [ -f "build.sh" ]; then
		# Build file exist, use it
		./build.sh "$PREFIX" 
	else 
		# Run default docker process
		TAG="$PREFIX/$1"
		docker build -t "$TAG" .
	fi
	cd ..
	echo
}

for project in "${images[@]}"
do
	build $project
done
