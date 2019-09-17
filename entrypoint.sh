#!/usr/bin/env bash
export PATH=/opt/miniconda/bin:$PATH
eval "$(conda shell.bash hook)"
$@
