#!/bin/bash


arq=`ls`

if [ -f "$arq" ] ; then
a=0
for i in *; do
	echo "extensao ${i#*.} encontrada"
	let a++
done
else
	echo "Nenhum arquivo encontrado"
fi


#a=0
#for i in "*.${ext[@]}"	; do
 # novo=$(printf "$1-%04d.${ext[$a]}" "$a") #04 pad to length of 4
  #mv -v -- "$i" "$novo"
  #echo "$novo"
  #echo "$i"
  #let a=a+1
#done
