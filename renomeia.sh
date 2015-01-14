#!/bin/bash

#Renomear arquivos com o parametro $1 seguido de uma sequencia numerica e alterando a extensao informada no parametro $2

function renomear {
a=1
for i in *."$opt"; do
  novo=$(printf "$nome-%04d.$ext" "$a") #04 pad to length of 4
  mv -v -- "$i" "$novo"
  let a=a+1
  echo $novo
done
}

nome=$1 #primeiro parametro será o nome comum a todos os arquivos.
#o segundo parametro é a extensao, se nao for passado sera adotada a jpg/JPG
if [ $2 ];then 
opt=$2 
else
opt="jpg"
fi

echo $opt

case $opt in
	jpg|JPG)
		echo "Renomeando imagens $opt"
		ext="jpg"
		renomear $nome $ext
		;;
	mov|MOV)
		echo "Renomeando videos $opt"
		ext="mov"
		renomear $nome $ext
		;;
	avi|AVI)
		echo "Renomeando videos $opt"
		ext="avi"
		renomear $nome $ext
		;;
	*)
		echo "Nao foi informada uma extensao"
		;;
esac

for f in *.JPG; do
[ -e "*.JPG" ] && echo "existe $f" || echo "nao existe JPG!"

done
