#! /bin/bash

IFS=$'\n'
PACKAGES=($(find ../ -name "pubspec.yaml" | sed -e 's/\/pubspec.yaml//g' | sed -e 's/\.\///g'))
unset IFS

BASEDIR=$(pwd)
echo "$BASEDIR"

pids=( )
for package in ${PACKAGES[@]}; do
  echo "#### INSTALLING: $package ####"
  cd "$BASEDIR/$package"
  flutter pub get & pids+=( $! )
done

num_failures=0
for pid in "${pids[@]}"; do
  wait "$pid" || (( ++num_failures ))
done

if (( num_failures > 0 )); then
  echo "Warning: $num_failures background processes (out of ${#pids[@]} total) failed" >&2
fi
