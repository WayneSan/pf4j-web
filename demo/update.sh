#!/bin/sh
cd ../pf4j-web/
mvn clean install -DskipTests
cd -

#Build
mvn -pl org.pf4j.web.demo:pf4j-web-demo,pf4j-web-demo-api clean install -DskipTests
mvn -pl pf4j-web-demo-csv-plugin,pf4j-web-demo-json-plugin,pf4j-web-demo-xml-plugin clean package -DskipTests

# create the plugins folder
rm -rf plugins
mkdir plugins

# copy artifacts to plugins folder
cp ./pf4j-web-demo-csv-plugin/target/*.zip plugins/
cp ./pf4j-web-demo-json-plugin/target/*.zip plugins/
cp ./pf4j-web-demo-xml-plugin/target/*.zip plugins/

mvn -pl pf4j-web-demo-app clean jetty:run
