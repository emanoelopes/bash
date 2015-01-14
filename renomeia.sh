#!/bin/bash

#Renomear arquivos com o parametro $1 seguido de uma sequencia numerica e alterando a extensao informada no parametro $2


function renomear() {
a=1
for i in *."$2"; do
  novo=$(printf "$1-%04d.$ext" "$a") #04 pad to length of 4
  mv -v -- "$i" "$novo"
  let a=a+1
  echo "Arquivo existente"
done
}

case $2 in 
	[Jj][Pp][Gg])
		ext="jpg"	
		renomear
		;;
	[Mm][Oo][Vv])
		ext="mov"
		renomear
		;;
	[Aa][Vv][Ii])
		ext="avi"
		renomear
		;;
esac

