#!/bin/sh

# Title: House Rental System
# Group Member:-
# Muhammad Afiq bin Mustaffa (1180447)
# Nurul Hanis binti Mohd Hashim (1180457)
# Nik Zuhayrah Amalin binti Zahari (1180472)
# Muhammad Farhan bin Abdul Rahman (1180479)
# Nur Munaya Insyirah binti Mohd Yahaya (1180495)

exit=0
houserental="db.txt"
while [ $exit -ne 1 ] 

do
printf "
	MENU
 1. Add House Details
 2. View House List
 3. Delete House
 4. Update
 5. Exit "
 printf "\nChoose Operation : \n"
 read input

if [ "$input" -eq 1 ]
then

echo "Enter House's Location : "
read location
echo "Enter Rental Price: "
read rentalprice
echo "$location: $rentalprice" >> $houserental

elif [ "$input" -eq 2 ]
then
 printf "
 1. View All House\n
 2. Enter location or rental price\n"
 printf "Choose option: \n"
 read option
 if [ "$option" -eq 1 ]
 then 
  echo "House List"
  cat $houserental
 else 
  echo "Enter location or rental price : "
  read option
  grep $option $houserental
 fi 

elif [ "$input" -eq 3 ]
then
 printf "
 1. Delete all houses\n
 2. Delete a house\n"
 printf "Choose option: \n"
 read ip
 if [ "$ip" -eq 1 ]
 then

  echo "Delete all houses\n"
  > $houserental
 else
  echo "Enter house's location to delete: "
  read location
  sed -i "/$location/d" $houserental
 fi

elif [ "$input" -eq 4 ]
then

echo "Enter house's location to update"
read location
sed -i "/$location/d" $houserental
	echo "Enter new house's location:"
	 read location
	 echo "Enter new rental price:"
	 read rentalprice
	 echo " $location: $rentalprice" >> $houserental
elif [ "$input" -eq 5 ]
then 
 exit=1
else
 echo "error"
fi
done
