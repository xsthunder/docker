# columns name
# test image
# 6
while test `docker image ls | wc -l` -lt 8
do
	bash cuda11.2-build-all.sh
	sleep 30
done
