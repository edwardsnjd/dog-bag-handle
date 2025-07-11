
SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

%.stl: %.scad
	openscad -o $@ $<

%.png: %.scad
	openscad -o $@ $<
