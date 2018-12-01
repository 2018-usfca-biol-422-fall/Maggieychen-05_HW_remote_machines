A summary for the output of fasta_QC_checks.sh script. 

The script runs fine, but with several issues. One is the QC script can't identify the blank line at the end of the file.
Thus, the last three line will show as empty or none sequence output.

The second issue is that when counting the number of sequences using grep ">" and count the number of ">",
will include lines that contain ">", but not a sequence name, this will result in a wrong number of sequences. 
The same issue will affect the sequence name list as well, the line with ">", but not a sequence name will
be included in the list as well. 

Lastly, the species name is contained in the sequence name, when sorted, it not sorted in the alphabetical
order of species name rather in the sequence name. This might also bring difficulties to read the species names. 
Overall, all the issues are meant to be discovered by the QC file and use as a guide to fix the fasta file. 
