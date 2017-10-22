#################################################################
# Name: getData.sh
# Purpose: Retreive data from source using APIKEY 
# 	Stay within request limit: 100 requests / 10 minutes
#	https://www.cannabisreports.com/my/api
#	Save data in json files for parsing
# Tools: 
#	curl: https://curl.haxx.se/docs/manpage.html
	APIKEY: 141986c9915bb310ff70d74f82794d76cd0275a1
#################################################################


HEADER_ACCEPT="Accept: application/json"
HEADER_API="X-API-Key: 141986c9915bb310ff70d74f82794d76cd0275a1"
HEADER_CONTENT_TYPE="Content-Type: application/json"

#Get all Strain Data
for i in {1..901}
do    
curl -X GET -H "${HEADER_ACCEPT}" -H "${HEADER_API}" -H "${HEADER_CONTENT_TYPE}" "https://www.cannabisreports.com/api/v1.0/strains?&page=$i" --output "/root/temp/strain_page$i.json" 
sleep 8s
done

#Get all Flower Data
for i in {1..1304}
do    
curl -X GET -H "${HEADER_ACCEPT}" -H "${HEADER_API}" -H "${HEADER_CONTENT_TYPE}" "https://www.cannabisreports.com/api/v1.0/flowers?&page=$i" --output "/root/temp/flower_page$i.json" 
sleep 8s
done

#Get all Extracts Data
for i in {1..1058}
do    
curl -X GET -H "${HEADER_ACCEPT}" -H "${HEADER_API}" -H "${HEADER_CONTENT_TYPE}" "https://www.cannabisreports.com/api/v1.0/extracts?&page=$i" --output "/root/temp/extracts_page$i.json" 
sleep 8s
done

#Get all edibles Data
for i in {1..764}
do    
curl -X GET -H "${HEADER_ACCEPT}" -H "${HEADER_API}" -H "${HEADER_CONTENT_TYPE}" "https://www.cannabisreports.com/api/v1.0/edibles?&page=$i" --output "/root/temp/edibles_page$i.json" 
sleep 8s
done

#Get all products Data
for i in {1..125}
do    
curl -X GET -H "${HEADER_ACCEPT}" -H "${HEADER_API}" -H "${HEADER_CONTENT_TYPE}" "https://www.cannabisreports.com/api/v1.0/products?&page=$i" --output "/root/temp/products_page$i.json" 
sleep 8s
done
