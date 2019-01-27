#!/bin/bash

# This is script to produce a summary of information
# about each of the fasta file

# Maggie Chen
# Spetember 21, 2018
# ychen254@dons.usfca.edu

# In order to use this script to get information about fasta files
# please unzip them, thus they are in the form of .fasta

# This will indicate the output is a log file, and  include the date
echo "Output from preliminary quality control"
echo "checks on selected fasta files"
date

# Indicate what will be included in the summary of fasta file
echo " "
echo "Output for each fasta includes:"
echo "Filename, file size, first three lines, last three lines,"
echo "the number of sequences in the file, and the"
echo "sequence identifier lines sorted alphabetically."


# Provide a seperation line and information about each fasta file
for filename in "$@"
do
	echo " "
	echo "######################################"
	echo " "
	echo "$filename"
    SIZE=$(du -h "$filename" | cut -f 1)
    # -h Provide the size of the file in human read-able form
	echo " "
	echo size:"$SIZE"
	echo " "
	echo First three lines:
	echo -----------------------
	head -n 3 "$filename"
    # Extract the first three lines of the file
	echo " "
	echo Last three lines:
	echo ----------------------
	tail -3 "$filename"
    # Extrac the last three lines of the file
	echo " "
	COUNT=$(grep -c ">" "$filename")
    # Recognize ">" as the start of the species name and count the number of it
	echo Number of sequence:"$COUNT"
	echo " "
	echo "Sequence names (sorted):"
	grep ">" "$filename" | sort
    # List the Sequence names in the alphabetical order using "sort"
done


