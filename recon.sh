#!/bin/bash

if [ $# -ne 1 ]; then
  echo "usage: $(basename "$BASH_SOURCE") <sessions>"
  exit 1
fi

rev="$(mirtk info -revision)"
top="$(cd $(dirname "$BASH_SOURCE") && pwd)"
cfg="$top/config/recon-neonatal-cortex.cfg"
tmp="$top/temp/rev-$rev"
img="$top/images/rev-$rev"
out="$top/meshes/rev-$rev"

mirtk recon-neonatal-cortex -v -v -d \
    --config "$cfg" --sessions "$@" \
    --ensure-pial-is-outside-white-surface \
    --temp "$tmp" --meshes "$out" --images "$img" \
    --cerebrum --white --pial --keep-t1w-image --keep-t2w-image \
    --threads 8 --queue long
