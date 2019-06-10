#!/bin/bash
FILE_NAMES="6sp_single_copy_orthologous_list_names.txt"
FILE_FULL_FASTA="selected_6sp_cds_single_copy.fasta"
FILE_FASTA_ORDER="selected_6sp_cds_single_copy.fasta.order"
FILESIZE=$(stat -c%s "$FILE_FULL_FASTA")

echo "Bash sorting..."
j=1
for i in `cat $FILE_NAMES`
do
    echo -ne "-- [ $j /$FILESIZE (bytes)] \r" > /dev/tty
    cat $FILE_FULL_FASTA  | sed -n "/$i/,/>/p" | sed '$ d' >> $FILE_FASTA_ORDER
    ((j++))
    
done
echo 
echo "File is sorted!"
echo "See: $FILE_FASTA_ORDER"
