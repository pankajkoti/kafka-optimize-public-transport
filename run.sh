docker-compose down
ulimit -n 4096
echo "docker off"
source ~/commonenv/bin/activate
docker-compose up &
sleep 120
echo
cd producers && /Users/pankaj.koti/commonenv/bin/python simulation.py &
sleep 10
cd consumers/ &&  faust -A faust_stream worker -l info &
sleep 10
cd consumers/ && /Users/pankaj.koti/commonenv/bin/python ksql.py
cd consumers/ && /Users/pankaj.koti/commonenv/bin/python server.py
