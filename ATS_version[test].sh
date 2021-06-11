#!/bin/bash

search="assembly: AssemblyVersion";
#echo $(awk "/$search/{print}" ~/Desktop/AssemblyInfo.cs | cut -d '"' -f 1 |sed -n '2 p') > version.txt;
#var=$(cat version.txt)

var=$(awk "/$search/{print}" AssemblyInfo.cs | cut -d '"' -f 2 |sed -n '2 p')
echo "Old Version : "$var;
var1=$(echo $var | cut -d '.' -f 1);
var3=$(echo $var | cut -d '.' -f 2);
var5=$(echo $var | cut -d '.' -f 3);
var7=$(echo $var | cut -d '.' -f 4);
typeset -i var1 var3 var5 var7

if [ $var7 -le 9 ]
then
  var7=$var7+1;
elif [ $var5 -le 9 ]
then
  var5=$var5+1;
  var7=0;
elif [ $var3 -le 9 ]
then
  var3=$var3+1;
  var5=0;
  var7=0;
else
  var1=$var1+1;
  var3=0;
  var5=0;
  var7=0;
fi

version=$var1.$var3.$var5.$var7;
typeset -i version
echo $version;

sed -i "s/$var/$version/" AssemblyInfo.cs

#sed -i "s/$var1/$var2/" ~/Desktop/1.txt

