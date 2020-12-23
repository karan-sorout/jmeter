@echo off
setlocal
dir
cd apache-jmeter-5.3\bin
jmeter -Jjmeter.save.saveservice.output_format=xml -n -t BlazeDemo_SearchFlight.jmx -l jmeter_result.jtl
exit /b