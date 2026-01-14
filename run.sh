#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"

# Extract natives if needed
if [ ! -d "$DIR/natives" ]; then
  echo "Extracting LWJGL natives..."
  unzip -q lwjgl-natives-linux.zip -d natives
fi

JAVA_OPTS="-Djava.library.path=$DIR/natives"

java $JAVA_OPTS \
  -cp "$DIR/rubydung.jar:$DIR/libs/lwjgl-2.9.3.jar:$DIR/libs/lwjgl_util-2.9.3.jar" \
  com.mojang.rubydung.RubyDung
