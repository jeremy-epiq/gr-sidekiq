#! /bin/sh
# This script configures the environment to build gr-sidekiq

# If no SDK directory specified, use the default
export SIDEKIQ_SDK=${SIDEKIQ_SDK:-$HOME/sidekiq_sdk_current}

# Assuming standard path for Epiq libraries unless otherwise defined
export EPIQ_LIBS=${EPIQ_LIBS:-/usr/lib/epiq}

# Create a symbolic link to the Sidekiq library in lib/ (assuming the x86_64 BUILD_CONFIG)
LIBSKIQ=$SIDEKIQ_SDK/lib/libsidekiq__x86_64.gcc.a
if [ -e "$LIBSKIQ" ]; then
    ln -snf "$LIBSKIQ" lib/libsidekiq.a
else
    echo "cannot find required '$LIBSKIQ' file for symbolic link" >&2
fi
