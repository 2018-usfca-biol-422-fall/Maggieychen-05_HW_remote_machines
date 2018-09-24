#!/bin/bash

# This is script to produce a summary of information
# about each of the fasta file

# Maggie Chen
# Spetember 21, 2018
# ychen254@dons.usfca.edu

# In order to use this script to get information about fasta files
# please unzip them, thus they are in the form of .fasta

# This will indicate the output is a log file, and  include the date
echo "Output from preliminary quality control checks on selected fasta files"
date

# Indicate what will be included in the summary of fasta file
echo "Output for each fasta includes:
Filename, file size, first three lines, last three lines,
the number of sequences in the file, and the
sequence identifier lines sorted alphabetically."

# Provide a seperation line and information about each fasta file
for filename in "$@"
do
	echo ######################################
	FILENAME=$filename
	echo output for "$FILENAME"
	SIZE=$(du -k $filename |cut -f 1)
	echo ###########
	echo size:"$SIZE"k
	echo ###########
	echo First three lines:
	echo -----------------------
	head -n 3 $filename
	echo ###########
	echo Last three lines:
	echo ----------------------
	awk NF $filename | tail -3
done



