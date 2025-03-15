#!/bin/bash
OUT_FNAME=w01-21039434.pdf # `w??-yournpm`, eg `w01-21039434`
BUILD_DIR=../build
ROOT_TEX=main
OUT_DIR=../
SRC_DIR=../tex

mkdir -p $BUILD_DIR
rm -rf $BUILD_DIR/*
cat $SRC_DIR/ref/*.bib > $BUILD_DIR/main.bib
cp -Lr $SRC_DIR/* $BUILD_DIR/
cp $SRC_DIR/zsupport/*.sty $BUILD_DIR/
rm $BUILD_DIR/*.md $BUILD_DIR/*.sh

cd $BUILD_DIR # now with respect to BUILD_DIR
pdflatex $ROOT_TEX.tex
bibtex $ROOT_TEX.aux
pdflatex $ROOT_TEX.tex
pdflatex $ROOT_TEX.tex # yes, this needs to run twice for standard fwdref
pdflatex $ROOT_TEX.tex # yes, this needs to run 3 times for backref
cp $ROOT_TEX.pdf $OUT_DIR/$OUT_FNAME
