#!/bin/bash

git remote add upstream "https://${geo_token}@github.com/ToutyRater/v2ray-SiteDAT.git"

mkdir -p h2y
cd h2y
rm -rf ./*

wget https://raw.githubusercontent.com/h2y/Shadowrocket-ADBlock-Rules/master/sr_direct_banad.conf

cat sr_direct_banad.conf | grep Reject|grep DOMAIN-SUFFIX|awk -F, '{print $2}' > ad
#cat sr_direct_banad.conf | grep Reject|grep CIDR|awk -F, '{print $2}' > ad_ip
rm -rf ./sr_direct_banad.conf
ls -al

cd ..
mkdir -p geofiles
ls -al
chmod +x ./v2sitedat
./v2sitedat -dat ./geofiles/h2ysite.dat -dir ./h2y


#git checkout -b master
git add -A
git commit -m 'update'
git push -u upstream HEAD:master 
