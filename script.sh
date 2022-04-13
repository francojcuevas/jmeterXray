#!/bin/bash
csvFIle=$1
projectFile=$2
reportFIle=$3
cat $csvFIle
cat $projectName
cat $reportFile
docker run --rm -v $WORKSPACE:/workspace swethapn14/repo_perf:JmeterLatest -Jjmeterengine.stopfail.system.exit=true -Jcsvfile=/workspace/$csvFile -n -t /workspace/$projectName -l /workspace/$reportFile
java -jar jmeter-junit-xml-converter-0.0.1-SNAPSHOT-jar-with-dependencies.jar reportejenkins.jtl reportejenkinsconvertido.xml
