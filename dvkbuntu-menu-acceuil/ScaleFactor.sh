#!/bin/sh

if [ $1 -eq 1 ]
then
    kcmfontscale="96"
elif [ $1 = "1.1" ]
then
    kcmfontscale="106"
elif [ $1 = "1.2" ]
then
    kcmfontscale="115"
elif [ $1 = "1.3" ]
then
    kcmfontscale="125"
elif [ $1 = "1.4" ]
then
    kcmfontscale="134"
elif [ $1 = "1.5" ]
then
    kcmfontscale="144"
elif [ $1 = "1.6" ]
then
    kcmfontscale="154"
elif [ $1 = "1.7" ]
then
    kcmfontscale="163"
elif [ $1 = "1.8" ]
then
    kcmfontscale="173"
elif [ $1 = "1.9" ]
then
    kcmfontscale="182"
elif [ $1 -eq 2 ]
then
    kcmfontscale="192"
elif [ $1 = "2.1" ]
then
    kcmfontscale="202"
elif [ $1 = "2.2" ]
then
    kcmfontscale="211"
elif [ $1 = "2.3" ]
then
    kcmfontscale="221"
elif [ $1 = "2.4" ]
then
    kcmfontscale="230"
elif [ $1 = "2.5" ]
then
    kcmfontscale="240"
elif [ $1 = "2.6" ]
then
    kcmfontscale="250"
elif [ $1 = "2.7" ]
then
    kcmfontscale="259"
elif [ $1 = "2.8" ]
then
    kcmfontscale="269"
elif [ $1 = "2.9"chorm ]
then
    kcmfontscale="278"
elif [ $1 -eq 3 ]
then
    kcmfontscale="288"
else
    kcmfontscale="96"
fi

my_file="$HOME/.config/kdeglobals"

my_ligne1="[KScreen]"
my_ligne2="ScaleFactor"
my_ligne3="ScreenScaleFactor"

if [ ! -f "$my_file" ]; then
    cp /usr/share/kubuntu-default-settings/kf5-settings/kdeglobals "$my_file"
fi

if grep -q "$my_line1" "$my_file"; then
   if grep -q "$my_ligne3" "$my_file"; then
       sed -i "s/^ScaleFactor=.*/ScaleFactor=$1/g" "$my_file"
       sed -i "s/^ScreenScaleFactors=.*/ScreenScaleFactors=DP-1-1=$1;HDMI-1-1=$1;HDMI-1-2=$1;DP-1-2=$1;DVI-D-1=$1;HDMI-3=$1;DP-3=$1;/g" "$my_file" 
   else
       sed -i "s/^ScaleFactor=.*/ScaleFactor=$1\nScreenScaleFactors=DP-1-1=$1;HDMI-1-1=$1;HDMI-1-2=$1;DP-1-2=$1;DVI-D-1=$1;HDMI-3=$1;DP-3=$1;/g" "$my_file"
   fi
else
   echo "" >> "$my_file"
   echo "$my_ligne1" >> "$my_file"
   echo "ScaleFactor=$1" >> "$my_file"
   echo "ScreenScaleFactors=DP-1-1=$1;HDMI-1-1=$1;HDMI-1-2=$1;DP-1-2=$1;DVI-D-1=$1;HDMI-3=$1;DP-3=$1" >> "$my_file"
fi


my_file2="$HOME/.config/kcmfonts"

echo "[General]" > "$my_file2"
echo "dontChangeAASettings=true" >> "$my_file2"
echo "forceFontDPI=$kcmfontscale" >> "$my_file2"

my_file3="$HOME/.kde/share/config/kdeglobals"

sed -i -e '/^\[KScreen\]/d' "$my_file3"
sed -i -e '/^ScaleFactor/d' "$my_file3"
sed -i -e '/^ScreenScaleFactor/d' "$my_file3"
