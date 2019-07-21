#!/usr/bin/env bash

images=(
  "zigbee2mqtt"
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

if [ ! -z $1 ] 
then 
	build $1
else
	for project in "${images[@]}"
	do
		build $project
	done
fi

