#!/bin/bash

#Renomear arquivos com o parametro $1 seguido de uma sequencia numerica e alterando a extensao informada no parametro $2

#Remover os parênteses
rename 's/[(,)]//g' *

#Substituir os espaços vazios por "_" 
rename 's/ /_/g' *

#Mudar as extensoes JPG para jpg
for file in *.JPG; do
mv $file `echo $file | sed 's/\(.*\.\)JPG/\1jpg/'`; done
#Mudar as extensoes MOV para mov
for file in *.MOV; do
mv $file `echo $file | sed 's/\(.*\.\)MOV/\1mov/'`; done
#Mudar as exetensoes AVI para avi
for file in *.AVI; do
mv $file `echo $file | sed 's/\(.*\.\)AVI/\1avi/'`; done

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
