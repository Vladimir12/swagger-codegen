set executable=.\modules\swagger-codegen-cli\target\swagger-codegen-cli.jar

If Not Exist %executable% (
  mvn clean package
)

REM set JAVA_OPTS=%JAVA_OPTS% -Xmx1024M -DloggerPath=conf/log4j.properties
set ags=generate -i modules\swagger-codegen\src\test\resources\2_0\petstore.yaml -l go-server -o samples\server\petstore\go-api-server -DpackageName=petstoreserver  -Dservice

java %JAVA_OPTS% -jar %executable% %ags%
