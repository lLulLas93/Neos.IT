#!/bin/bash

nb_carte=$(snmpget -v1 -c public 127.0.0.1 ifNumber.0 | cut -d " " -f4)

echo -e "Nombre de carte(s) reseau : "$nb_carte"\n";

i=2;

ping=$(ping -c 1 google.com | tail -1| awk '{print $4}' | cut -d '/' -f 2)
name=$(snmpget -v1 -c public 127.0.0.1 ifName.$i | cut -d " " -f4)
statu=$(snmpget -v1 -c public 127.0.0.1 ifOperStatus.$i | cut -d " " -f4)
ad_p=$(snmpget -v1 -c public 127.0.0.1 ifPhysAddress.$i | cut -d " " -f4)
mtu=$(snmpget -v1 -c public 127.0.0.1 ifMtu.$i | cut -d " " -f4)
ip=$(hostname -i)

echo "Ping : "$ping;
echo "Nom de la carte reseau : "$name;
echo "Statut : "$statu;
echo "Addresse Physique : "$ad_p;
echo "MTU : "$mtu;
echo "IP : "$ip;

#Nom
reqname="db.super_infos.update({\"_id\": ObjectId(\"591187d24cb031aedf78b9ae\")}, { \"name\" : \"$name\" })";
echo $reqname | mongo super_infos
echo "Requete ping : "$reqping
#PING
reqping="db.super_infos.update({\"_id\": ObjectId(\"591187d2edd1c297d6557de4\")}, { \"ping\" : \"$ping\" })";
echo $reqping | mongo super_infos
echo "Requete ping : "$reqping
#Statut
reqstat="db.super_infos.update({\"_id\": ObjectId(\"591187d20c29ce1305773583\")}, { \"statut\" : \"$statu\" })";
echo $reqstat | mongo super_infos
#Phys addr
reqphys="db.super_infos.update({\"_id\": ObjectId(\"591187d22727f3c8646130ac\")}, { \"adresse_physique\" : \"$ad_p\" })";
echo $reqphys | mongo super_infos
#MTU
reqmtu="db.super_infos.update({\"_id\": ObjectId(\"591187d212b978a5a5ab580b\")}, { \"mtu\" : \"$mtu\" })";
echo $reqmtu | mongo super_infos
#IP
reqip="db.super_infos.update({\"_id\": ObjectId(\"591187d2cd10ca7bb3e2147d\")}, { \"ip\" : \"$ip\" })";
echo $reqip | mongo super_infos

