#!/bin/bash

CC=$(which clang)

BUILDTYPE=${BUILDTYPE:-Debug}

NUB_DIR=nub
NUB_BUILD=${NUB_DIR}/out/${BUILDTYPE}
NUB_IDIR=${NUB_DIR}/include

UV_DIR=${NUB_DIR}/deps/uv
UV_BUILD=${NUB_BUILD}
UV_IDIR=${UV_DIR}/include

CFLAGS="-fno-omit-frame-pointer -Wall -g -fstrict-aliasing"

if [ ${BUILDTYPE} == Release ]
then
  CFLAGS+=" -O3"
  OUTFILE="tcp-echo"
else
  CFLAGS+=" -O0"
  OUTFILE="tcp-echo_g"
fi

DEPS=${NUB_BUILD}/libnub.a
DEPS+=\ ${UV_BUILD}/libuv.a

BUILDFILES=./tcp-echo.c

INCLUDES=-I${NUB_IDIR}\ -I${UV_IDIR}

${CC} ${CFLAGS} -o ${OUTFILE} ${BUILDFILES} ${INCLUDES}