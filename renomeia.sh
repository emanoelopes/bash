#!/bin/bash

#Renomear arquivos com o parametro $1 seguido de uma sequencia numerica.

#arq=`ls`

#if [ ! -d "$arq" ] ; then
#a=0
#for i in "$arq"; do
#	echo "extensao ${i#*.} encontrada"
#	let a++
#done
#else
#	echo "Nenhum arquivo encontrado"
#fi

ext="AVI"

a=0
for i in *."$ext"; do
  novo=$(printf "$1-%04d.avi" "$a") #04 pad to length of 4
	echo "$i"
	echo "$novo"
  mv -v -- "$i" "$novo"
  let a=a+1
done
