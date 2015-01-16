#!/bin/bash

#Renomear arquivos com o parametro $1 seguido de uma sequencia numerica e alterando a extensao informada no parametro $2

#Remove os arquivos gerados pelo iPhoto
rm *_face*

#Remove os colchetes
rename 's/[\[,\]]//g' *

#Remover os parênteses
rename 's/[(,)]//g' *

#Substituir os espaços vazios por "_" 
rename 's/ /_/g' *

#Remover arquivos ocultos
rm .*

#Mudar as extensoes JPG para jpg
for files_jpg in *.JPG; do
mv $files_jpg `echo $files_jpg | sed 's/\(.*\.\)JPG/\1jpg/'`; done
#Mudar as extensoes MOV para mov
for files_mov in *.MOV; do
mv $files_mov `echo $files_mov | sed 's/\(.*\.\)MOV/\1mov/'`; done
#Mudar as exetensoes AVI para avi
for files_avi in *.AVI; do
mv $files_mov `echo $files_mov | sed 's/\(.*\.\)AVI/\1avi/'`; done

#Remove acentos dos arquivos
for com_a in *;
do
sem_a=`echo "$com_a" | iconv -t 'ascii//TRANSLIT'`
mv -v "$com_a" "$sem_a"
done

#Funcao que adiciona um texto comum a todos e acresenta uma sequencia numerica.
function renomear {
a=1
for i in *."$opt"; do
  novo=$(printf "$nome-%04d.$ext" "$a") #Sequencia numérica de 4 dígitos.
  mv -v -- "$i" "$novo"
  let a=a+1
  echo $novo
done
}



nome=$1 #primeiro parametro será a parte comum a todos os arquivos.

#o segundo parametro é a extensao, se nao for passado sera adotada a jpg/JPG
[ $2 ] && opt=$2 || opt="jpg"

case $opt in
	jpg|JPG)
		ext="jpg"
		if [ -e "*.$opt" ]; then
			renomear $nome $ext
		else
			echo "Nao existe arquivo $opt para ser renomeado."
		fi
		;;
	mov|MOV)
		ext="mov"
		[ -e "*.$opt" ] && renomear $nome $ext || echo "Nao existe arquivo $opt para ser renomeado."
		;;
	avi|AVI)
		ext="avi"
		[ -e "*.$opt" ] && renomear $nome $ext || echo "Nao existe arquivo $opt para ser renomeado."
		;;
esac
