#!/bin/bash

INPUT=./charts
OUTPUT=./docs

# For each folder create archive
for DIRECTORY in ${INPUT}/*; do
    if [ -d "${DIRECTORY}" ]; then
        helm package ${DIRECTORY} -d ${OUTPUT}
    fi
done

# Generate index
helm repo index ${OUTPUT} --url https://needpc.github.io/kubernetes-helm/