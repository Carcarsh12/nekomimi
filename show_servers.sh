#! /bin/bash
echo ">>>������ ��������"
if [ -a servers.txt ]; then
while read LINE; do
#echo $LINE
pref=`echo $LINE | grep -E -o -e "pref=\"[^\"]+" | sed -e "s/pref=\"//"`
name=`echo $LINE | grep -E -o -e "name=\"[^\"]+" | sed -e "s/name=\"//"`
echo ">>>$pref - $name"
done < servers.txt
else
echo ">>>������ �������� ����"
echo ">>>������� ���� �� 1 ������ � ���� servers.txt"
#echo "pref=\" \" name=\" \" api_url=\" \" lim=\" \" page=\" \"" > servers.txt
exit
fi
