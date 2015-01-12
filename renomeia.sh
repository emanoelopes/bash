#!/bin/bash

#Renomear arquivos com o parametro $1 seguido de uma sequencia numerica.

echo "digite a extensao de entrada"
read ext1
echo "digite a extensao de saida"
read ext2
a=0
for i in *."$ext1"; do
  novo=$(printf "$1-%04d.$ext2" "$a") #04 pad to length of 4
	echo "$i"
	echo "$novo"
  mv -v -- "$i" "$novo"
  let a=a+1
done
