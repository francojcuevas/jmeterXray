#!/bin/bash
csvFile=$1
projectName=$2
reportFile=$3
var_date=$(date +%c)
rm $reportFile
docker run --rm -v $WORKSPACE:/workspace swethapn14/repo_perf:JmeterLatest -Jjmeterengine.stopfail.system.exit=true -Jcsvfile=/workspace/$csvFile -n -t /workspace/$projectName -l /workspace/$reportFile
rm jenkinsconvertido.xml
java -jar $WORKSPACE/jmeter-junit-xml-converter-0.0.1-SNAPSHOT-jar-with-dependencies.jar jenkins.jtl jenkinsconvertido.xml
if grep "false" $reportFile > resultadoemail.txt && echo "Nombre de proyecto:" $JOB_NAME >> resultadoemail.txt && echo "Fecha y hora de ejecucion:" $var_date >> resultadoemail.txt && echo "El test de Performance fallo"
then
echo El test fallo
exit 1
else grep "true" $WORKSPACE/$reportFile > resultadoemail.txt && echo "Nombre de proyecto:" $JOB_NAME >> resultadoemail.txt && echo "Fecha y hora de ejecucion:" $var_date >> resultadoemail.txt && echo "El test de Performance ha finalizado correctamente"
echo El test finalizo correctamente
exit 0
fi
