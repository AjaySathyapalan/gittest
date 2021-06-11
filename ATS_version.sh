#!/bin/bash

#read path
path=("$@");
search="assembly: AssemblyVersion";
OldVersion=$(awk "/$search/{print}" $path/AssemblyInfo.cs | cut -d '"' -f 2 |sed -n '2 p');
echo Old Version : $OldVersion;
var1=$(echo $OldVersion | cut -d '.' -f 1);
var3=$(echo $OldVersion | cut -d '.' -f 2);
var5=$(echo $OldVersion | cut -d '.' -f 3);
var7=$(echo $OldVersion | cut -d '.' -f 4);
check=9;
typeset -i var1 var3 var5 var7 check

if [ $var7 -le $check ]
then
  var7=$var7+1;
elif [ $var5 -le $check ]
then
  var5=$var5+1;
  var7=0;
elif [ $var3 -le $check ]
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

NewVersion=$var1.$var3.$var5.$var7;
typeset -i NewVersion
echo New Version : $NewVersion;
sed -zi "s/$OldVersion/$NewVersion/1" $path/AssemblyInfo.cs;

