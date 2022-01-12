#!/bin/bash

CATALINA_BASE="/home/osboxes/project/comp/petclinic"

# check if the service is running ...
SERVICE_PID=`ps -ef | grep java | grep ${CATALINA_BASE} | grep -v grep | awk '{print $2}'`
if [ -n "$SERVICE_PID" ]; then
  echo "=================================================="
  echo "The service is running. SERVICE_PID=$SERVICE_PID"
  echo "This will be stopped."
  echo ""

  ${CATALINA_BASE}/bin/shutdown.sh
  echo "=================================================="
  echo ""
  sleep 5
fi

# clean up previous package 
rm -rf ${CATALINA_BASE}/webapps/*

# release new package 
cp -v ${CATALINA_BASE}/src/target/petclinic.war ${CATALINA_BASE}/webapps/ROOT.war

# option - review release information  
mkdir -p ${CATALINA_BASE}/webapps/ROOT
cd ${CATALINA_BASE}/webapps/ROOT
jar -xvf ../ROOT.war

echo "=================================================="
echo "Release Information : "
cat ${CATALINA_BASE}/webapps/ROOT/META-INF/maven/org.springframework.samples/spring-framework-petclinic/pom.properties
echo "=================================================="
