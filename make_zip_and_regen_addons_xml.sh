#!/bin/sh
#
# make zip file, when version chane
#
change=0
for d in repository.adulthideout plugin.video.adulthideout;  do
    version=`grep version=  $d/addon.xml  | tail -n 1 | egrep -o 'version="[0-9.]+"' |awk -F'"' '{print $2}'`
    test -e zips/$d/$d-$version.zip  && echo "zips/$d/$d-$version.zip exist!" && continue
    test -e zips/$d/$d-$version.zip  ||  zip -r zips/$d/$d-$version.zip $d/  >>/dev/null
    echo "zips/$d/$d-$version.zip done"
    change=1
done

[[ $change -eq 1 ]] && python2 addons_xml_generator.py
