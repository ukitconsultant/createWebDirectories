#! /bin/bash

echo "Enter the FULL path for the website: "
read -r websitePath

if [[ -d "$websitePath" && -z "$(ls -A $websitePath)" ]]; then

	echo "Creating initial directories."
	mkdir "$websitePath/public_html"
	echo -n "."
	mkdir "$websitePath/logs"
	echo -n "."
	mkdir "$websitePath/logs/http"
	echo -n "."
	mkdir "$websitePath/logs/https"
	echo -n "."
	mkdir "$websitePath/backup"
	echo -n "."
	mkdir "$websitePath/backup/current"
	echo -n "."
	mkdir "$websitePath/backup/historic"
	echo -n "."
	mkdir "$websitePath/system"
	echo -n "."
	mkdir "$websitePath/ssl"
	echo -n "."
	mkdir "$websitePath/ssl/key"
	echo -n "."
	mkdir "$websitePath/ssl/bundle"
	echo "Initial directories created."

	echo -n "Would you like to add subdirectories?: "
	read subdirectories

	if [[ "$subdirectories" == "Y" || "$subdirectories" == "yes" || "$subdirectories" == "Yes" || "$subdirectories" == "YEs" || "$subdirectories" == "YES" || "$subdirectories" == "y" ]]; then

		createDirectories () {

		        if [[ "$1" == "Y" || "$1" == "yes" || "$1" == "Yes" || "$1" == "YEs" || "$1" == "YES" || "$1" == "y" ]]; then

		                mkdir "$3/subdomains/$2"
		                mkdir "$3/subdomains/$2/public_html"
		                mkdir "$3/subdomains/$2/logs"
		                mkdir "$3/subdomains/$2/logs/http"
		                mkdir "$3/subdomains/$2/logs/https"
		                mkdir "$3/subdomains/$2/$2_app"
				echo "Directories added"
			else
				echo "Directories not added"
		        fi

			echo "";

		}


		mkdir "$websitePath/subdomains"
		mkdir "$websitePath/main_app"

		echo "Please type Y or N to each of the following subdirectories.: "

		echo -n "Assets Subdirectory: "
		read answer0
		createDirectories "$answer0"  "assets"  "$websitePath"
		unset answer0

		echo -n "Clients Subdirectory: "
		read answer1
		createDirectories "$answer1" "clients" "$websitePath"
		unset answer1

		echo -n "Staff Subdirectory: "
		read answer2
		createDirectories "$answer2" "staff" "$websitePath"
		unset answer2

		echo -n "API Subdirectory: "
		read answer3
		createDirectories "$answer3" "api" "$websitePath"
		unset answer3

		echo -n "Downloads Subdirectory: "
		read answer4
		createDirectories "$answer4" "downloads" "$websitePath"
		unset answer4

		echo -n "Suppliers Subdirectory: "
		read answer5
		createDirectories "$answer5" "suppliers" "$websitePath"
		unset answer5

		echo -n "Admin Subdirectory: "
		read answer6
		createDirectories "$answer6" "admin" "$websitePath"
		unset answer6

		echo -n "SMTP Subdirectory: "
		read answer7
		createDirectories "$answer7" "smtp" "$websitePath"
		unset answer7

		echo -n "Status Subdirectory: "
		read answer8
		createDirectories "$answer8" "status" "$websitePath"
		unset answer8

		echo -n "CNAME Subdirectory: "
		read answer9
		createDirectories "$answer9" "cname" "$websitePath"
		unset answer9

	else
		echo "";
		echo "No subdirectories will be created"
		mkdir "$websitePath/app"
	fi
	echo "";
	echo "All of the directories for this website have been created.";
	echo "Have a good day!";
	echo "";
	echo "";
	echo "";
else
echo "";
echo "The directory you supplied doesn't exist or isn't empty.";
echo "Goodbye!";
echo "";
echo "";
fi
