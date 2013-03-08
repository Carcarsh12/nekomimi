#! /bin/bash
uag="Mozilla/5.0 (Windows; U; Windows NT 5.1; ru; rv:1.9.1.1) Gecko/20090715 Firefox/3.5.1 (.NET CLR 3.5.30729)"
tag=$1
pref=$2
cd $tag
if [ -a skip.flag ] 
then
exit
fi
if [ -a "$2.lastpost.txt" ] 
then
lastpost=$(cat "$pref.lastpost.txt")
if [ ! -z $lastpost ]
then
echo -e ">>>\E[32m���� ���������� ����� ������\E[37m"
echo -e ">>>\E[36mID ���������� �����: \E[37m$lastpost"
exit
fi
fi 
lastpost=0
echo -e ">>>\E[31mID ���������� ����� �� ������\E[37m"
#������ �������� ������ ���������� ������ �����
#�� ����� ������ ���� 01asd165asd0343asd13a2s1d3.jpg
#while read LINE; do
#url=`echo $LINE | sed -r -e 's/ [0-9]+//g'`
#curfile=`basename $url`
#id=`echo $LINE | grep -E -o -e ' [^\n]+' |sed -e 's/ //g'`
#if [ -a $curfile ]
#then
#if [ $id -gt $lastpost ]
#then
#let "lastpost=id"
#break
#fi
#fi
#done < UrlsIds.txt
ls "$pref*.*" > files.txt
sed -i -r -e "s/[^0-9\n]+//" -e "/^$/d" files.txt
while read LINE; do
if [ $lastpost -lt $LINE ]
then
let "lastpost=LINE"
fi
done < files.txt
rm files.txt
echo -e ">>>\E[32m������ ID ���������� �����: \E[37m$lastpost"
if [ $lastpost -gt 0 ]
then
echo $lastpost > "$pref.lastpost.txt"
else
echo "0" > "$pref.lastpost.txt"
fi
