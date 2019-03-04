#!/bin/bash

#TODO
#- verificare che il programma prenda solo file .bam controllando la regex del file
#- creare la cartella output prima di eseguire la conversione
#- verificare che l'utente abbia inserito entrambi i path se no scrivere che c'è erroe


if [ $1 == "-h" ];
then
	printf "\n\n** PROGRAMMA PER LA CONVERSIONE DEI FILE .bam IN FILE .fastq **\n\n* FUNZIONAMENTO\nInvocare lo script e inserire come primo argomento il percorso della cartella che contiene i file .bam (senza / finale) e come secondo argomento il percorso della cartella di destinazione (senza / finale)\n\n* DIPENDENZE\nPer funzionare lo script necesssita dei seguenti programmi\n-bedtools\n\n* CREDIT\nGiuseppe Tortorelli\n\n\n"
else

	PATH_IN=$1
	PATH_OUT=$2

	cd "$PATH_IN"

	for file in *
	do
		Nfile=${file%.*} 
		bedtools bamtofastq -i "$PATH_IN"/"$file" -fq "$PATH_OUT"/"$Nfile".fastq
	done
fi
