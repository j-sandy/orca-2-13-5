@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  orca startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and ORCA_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="-Djava.security.egd=file:/dev/./urandom" "-Dspring.config.additional-location=/opt/spinnaker/config/"

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\config;%APP_HOME%\lib\orca-web.jar;%APP_HOME%\lib\orca-applications.jar;%APP_HOME%\lib\orca-echo.jar;%APP_HOME%\lib\orca-keel.jar;%APP_HOME%\lib\orca-igor.jar;%APP_HOME%\lib\orca-integrations-cloudfoundry.jar;%APP_HOME%\lib\orca-kayenta.jar;%APP_HOME%\lib\orca-mine.jar;%APP_HOME%\lib\orca-pipelinetemplate.jar;%APP_HOME%\lib\orca-clouddriver.jar;%APP_HOME%\lib\orca-bakery.jar;%APP_HOME%\lib\orca-deploymentmonitor.jar;%APP_HOME%\lib\orca-dry-run.jar;%APP_HOME%\lib\orca-eureka.jar;%APP_HOME%\lib\orca-flex.jar;%APP_HOME%\lib\orca-migration.jar;%APP_HOME%\lib\orca-qos.jar;%APP_HOME%\lib\orca-queue-redis.jar;%APP_HOME%\lib\orca-redis.jar;%APP_HOME%\lib\orca-front50.jar;%APP_HOME%\lib\orca-integrations-gremlin.jar;%APP_HOME%\lib\orca-queue-sql.jar;%APP_HOME%\lib\orca-sql-mysql.jar;%APP_HOME%\lib\orca-sql.jar;%APP_HOME%\lib\orca-interlink.jar;%APP_HOME%\lib\orca-peering.jar;%APP_HOME%\lib\orca-queue.jar;%APP_HOME%\lib\orca-webhook.jar;%APP_HOME%\lib\orca-retrofit.jar;%APP_HOME%\lib\orca-kotlin.jar;%APP_HOME%\lib\orca-core.jar;%APP_HOME%\lib\orca-api.jar;%APP_HOME%\lib\fiat-api-1.14.0.jar;%APP_HOME%\lib\fiat-core-1.14.0.jar;%APP_HOME%\lib\client-java-5.0.0.jar;%APP_HOME%\lib\keiko-redis-spring-3.5.0.jar;%APP_HOME%\lib\keiko-spring-3.5.0.jar;%APP_HOME%\lib\keiko-sql-3.5.0.jar;%APP_HOME%\lib\keiko-redis-3.5.0.jar;%APP_HOME%\lib\keiko-core-3.5.0.jar;%APP_HOME%\lib\kork-plugins-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-web-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-sql-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-security-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-jedis-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-pubsub-aws-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-pubsub-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-core-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-stackdriver-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-secrets-gcp-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-secrets-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\spectator-web-spring-0.75.0.jar;%APP_HOME%\lib\kork-telemetry-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\spectator-ext-gc-0.75.0.jar;%APP_HOME%\lib\spectator-ext-jvm-0.75.0.jar;%APP_HOME%\lib\kork-aws-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\spectator-ext-aws-0.75.0.jar;%APP_HOME%\lib\spectator-api-0.75.0.jar;%APP_HOME%\lib\kork-artifacts-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\jinjava-2.2.3.jar;%APP_HOME%\lib\kork-expressions-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-plugins-spring-api-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-plugins-api-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\pf4j-update-2.3.0.jar;%APP_HOME%\lib\pf4j-3.2.0.jar;%APP_HOME%\lib\json-path-2.4.0.jar;%APP_HOME%\lib\liquibase-core-3.8.9.jar;%APP_HOME%\lib\HikariCP-3.4.3.jar;%APP_HOME%\lib\resilience4j-spring-boot2-1.0.0.jar;%APP_HOME%\lib\resilience4j-spring-boot-common-1.0.0.jar;%APP_HOME%\lib\resilience4j-spring-1.0.0.jar;%APP_HOME%\lib\resilience4j-annotations-1.0.0.jar;%APP_HOME%\lib\resilience4j-framework-common-1.0.0.jar;%APP_HOME%\lib\resilience4j-retry-1.0.0.jar;%APP_HOME%\lib\eureka-client-1.9.18.jar;%APP_HOME%\lib\netflix-eventbus-0.3.0.jar;%APP_HOME%\lib\archaius-core-0.7.6.jar;%APP_HOME%\lib\resilience4j-consumer-1.0.0.jar;%APP_HOME%\lib\resilience4j-ratelimiter-1.0.0.jar;%APP_HOME%\lib\resilience4j-bulkhead-1.0.0.jar;%APP_HOME%\lib\resilience4j-circuitbreaker-1.0.0.jar;%APP_HOME%\lib\resilience4j-core-1.0.0.jar;%APP_HOME%\lib\resilience4j-micrometer-1.0.0.jar;%APP_HOME%\lib\netflix-infix-0.3.0.jar;%APP_HOME%\lib\servo-core-0.12.21.jar;%APP_HOME%\lib\jcl-over-slf4j-1.7.30.jar;%APP_HOME%\lib\spring-boot-starter-web-2.2.7.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-json-2.2.7.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-validation-2.2.7.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-aop-2.2.7.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-security-2.2.7.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-2.2.7.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-logging-2.2.7.RELEASE.jar;%APP_HOME%\lib\logback-classic-1.2.3.jar;%APP_HOME%\lib\jedis-3.1.0.jar;%APP_HOME%\lib\log4j-to-slf4j-2.12.1.jar;%APP_HOME%\lib\jul-to-slf4j-1.7.30.jar;%APP_HOME%\lib\resilience4j-circularbuffer-1.0.0.jar;%APP_HOME%\lib\slf4j-api-1.7.30.jar;%APP_HOME%\lib\spring-boot-starter-actuator-2.2.7.RELEASE.jar;%APP_HOME%\lib\logstash-logback-encoder-4.11.jar;%APP_HOME%\lib\kork-exceptions-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-secrets-aws-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\jetty-servlets-9.4.28.v20200408.jar;%APP_HOME%\lib\kotlin-stdlib-jdk8-1.3.70.jar;%APP_HOME%\lib\jackson-module-kotlin-2.10.4.jar;%APP_HOME%\lib\kotlin-reflect-1.3.70.jar;%APP_HOME%\lib\funktionale-partials-1.2.jar;%APP_HOME%\lib\kotlin-stdlib-jdk7-1.3.70.jar;%APP_HOME%\lib\kotlin-stdlib-1.3.70.jar;%APP_HOME%\lib\kotlin-stdlib-common-1.3.70.jar;%APP_HOME%\lib\groovy-test-junit5-2.5.11.jar;%APP_HOME%\lib\junit-jupiter-engine-5.6.0.jar;%APP_HOME%\lib\junit-jupiter-api-5.6.0.jar;%APP_HOME%\lib\junit-platform-launcher-1.6.0.jar;%APP_HOME%\lib\junit-platform-engine-1.6.0.jar;%APP_HOME%\lib\junit-platform-commons-1.6.0.jar;%APP_HOME%\lib\jackson-dataformat-yaml-2.10.4.jar;%APP_HOME%\lib\jackson-datatype-guava-2.10.2.jar;%APP_HOME%\lib\converter-jackson-1.9.0.jar;%APP_HOME%\lib\spring-boot-actuator-autoconfigure-2.2.7.RELEASE.jar;%APP_HOME%\lib\converter-jackson-2.7.1.jar;%APP_HOME%\lib\jackson-dataformat-properties-2.10.4.jar;%APP_HOME%\lib\spring-boot-actuator-2.2.7.RELEASE.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.10.4.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.10.4.jar;%APP_HOME%\lib\aws-java-sdk-secretsmanager-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-sns-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-sqs-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-s3-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-kms-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-core-1.11.723.jar;%APP_HOME%\lib\jmespath-java-1.11.723.jar;%APP_HOME%\lib\jackson-module-parameter-names-2.10.4.jar;%APP_HOME%\lib\jackson-databind-2.10.4.jar;%APP_HOME%\lib\jackson-annotations-2.10.4.jar;%APP_HOME%\lib\groovy-test-2.5.11.jar;%APP_HOME%\lib\junit-4.12.jar;%APP_HOME%\lib\google-auth-library-oauth2-http-0.18.0.jar;%APP_HOME%\lib\google-api-services-monitoring-v3-rev477-1.25.0.jar;%APP_HOME%\lib\google-api-services-storage-v1-rev141-1.25.0.jar;%APP_HOME%\lib\google-api-client-1.28.0.jar;%APP_HOME%\lib\google-http-client-jackson2-1.32.1.jar;%APP_HOME%\lib\jackson-dataformat-cbor-2.10.2.jar;%APP_HOME%\lib\jackson-core-2.10.4.jar;%APP_HOME%\lib\micrometer-core-1.3.8.jar;%APP_HOME%\lib\jooq-3.12.4.jar;%APP_HOME%\lib\reactive-streams-1.0.3.jar;%APP_HOME%\lib\log4j-api-2.12.1.jar;%APP_HOME%\lib\jetty-continuation-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-http-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-io-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-util-9.4.28.v20200408.jar;%APP_HOME%\lib\spring-security-web-5.2.4.RELEASE.jar;%APP_HOME%\lib\spring-security-config-5.2.4.RELEASE.jar;%APP_HOME%\lib\spring-security-core-5.2.4.RELEASE.jar;%APP_HOME%\lib\spring-webmvc-5.2.6.RELEASE.jar;%APP_HOME%\lib\spring-boot-autoconfigure-2.2.7.RELEASE.jar;%APP_HOME%\lib\spring-boot-properties-migrator-2.2.7.RELEASE.jar;%APP_HOME%\lib\spring-boot-2.2.7.RELEASE.jar;%APP_HOME%\lib\spring-context-5.2.6.RELEASE.jar;%APP_HOME%\lib\spring-aop-5.2.6.RELEASE.jar;%APP_HOME%\lib\spring-jdbc-5.2.6.RELEASE.jar;%APP_HOME%\lib\spring-tx-5.2.6.RELEASE.jar;%APP_HOME%\lib\spring-beans-5.2.6.RELEASE.jar;%APP_HOME%\lib\spring-expression-5.2.6.RELEASE.jar;%APP_HOME%\lib\spring-core-5.2.6.RELEASE.jar;%APP_HOME%\lib\spring-jcl-5.2.6.RELEASE.jar;%APP_HOME%\lib\spring-web-5.2.6.RELEASE.jar;%APP_HOME%\lib\spring-boot-configuration-metadata-2.2.7.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-tomcat-2.2.7.RELEASE.jar;%APP_HOME%\lib\antlr-runtime-3.4.jar;%APP_HOME%\lib\stringtemplate-3.2.1.jar;%APP_HOME%\lib\antlr-2.7.7.jar;%APP_HOME%\lib\logback-core-1.2.3.jar;%APP_HOME%\lib\hibernate-validator-6.0.19.Final.jar;%APP_HOME%\lib\classmate-1.5.1.jar;%APP_HOME%\lib\guava-2.8.2.jar;%APP_HOME%\lib\caffeine-2.8.2.jar;%APP_HOME%\lib\retrofit1-okhttp3-client-1.1.0.jar;%APP_HOME%\lib\retrofit-1.9.0.jar;%APP_HOME%\lib\client-java-api-5.0.0.jar;%APP_HOME%\lib\gson-2.8.6.jar;%APP_HOME%\lib\retrofit-2.7.1.jar;%APP_HOME%\lib\okhttp-3.14.8.jar;%APP_HOME%\lib\google-oauth-client-1.28.0.jar;%APP_HOME%\lib\google-http-client-apache-2.0.0.jar;%APP_HOME%\lib\google-http-client-1.32.1.jar;%APP_HOME%\lib\jersey-apache-client4-1.19.1.jar;%APP_HOME%\lib\httpclient-4.5.12.jar;%APP_HOME%\lib\commons-codec-1.13.jar;%APP_HOME%\lib\rxjava-1.3.8.jar;%APP_HOME%\lib\jakarta.annotation-api-1.3.5.jar;%APP_HOME%\lib\jakarta.validation-api-2.0.2.jar;%APP_HOME%\lib\jaxb-api-2.3.1.jar;%APP_HOME%\lib\javax.activation-api-1.2.0.jar;%APP_HOME%\lib\javax.annotation-api-1.3.2.jar;%APP_HOME%\lib\javax.servlet-api-4.0.1.jar;%APP_HOME%\lib\validation-api-2.0.1.Final.jar;%APP_HOME%\lib\joda-time-2.10.6.jar;%APP_HOME%\lib\mysql-connector-java-8.0.16.jar;%APP_HOME%\lib\jsch.agentproxy.connector-factory-0.0.9.jar;%APP_HOME%\lib\jsch.agentproxy.usocket-jna-0.0.9.jar;%APP_HOME%\lib\jsch.agentproxy.pageant-0.0.9.jar;%APP_HOME%\lib\jna-platform-4.5.2.jar;%APP_HOME%\lib\jna-4.5.2.jar;%APP_HOME%\lib\commons-lang3-3.9.jar;%APP_HOME%\lib\commons-pool2-2.7.0.jar;%APP_HOME%\lib\httpcore-4.4.13.jar;%APP_HOME%\lib\tomcat-embed-websocket-9.0.34.jar;%APP_HOME%\lib\tomcat-embed-core-9.0.34.jar;%APP_HOME%\lib\tomcat-annotations-api-9.0.34.jar;%APP_HOME%\lib\tomcat-embed-el-9.0.34.jar;%APP_HOME%\lib\aspectjweaver-1.9.5.jar;%APP_HOME%\lib\groovy-ant-2.5.11.jar;%APP_HOME%\lib\groovy-cli-commons-2.5.11.jar;%APP_HOME%\lib\groovy-groovysh-2.5.11.jar;%APP_HOME%\lib\groovy-console-2.5.11.jar;%APP_HOME%\lib\groovy-groovydoc-2.5.11.jar;%APP_HOME%\lib\groovy-docgenerator-2.5.11.jar;%APP_HOME%\lib\groovy-cli-picocli-2.5.11.jar;%APP_HOME%\lib\groovy-datetime-2.5.11.jar;%APP_HOME%\lib\groovy-jmx-2.5.11.jar;%APP_HOME%\lib\groovy-json-2.5.11.jar;%APP_HOME%\lib\groovy-jsr223-2.5.11.jar;%APP_HOME%\lib\groovy-macro-2.5.11.jar;%APP_HOME%\lib\groovy-nio-2.5.11.jar;%APP_HOME%\lib\groovy-servlet-2.5.11.jar;%APP_HOME%\lib\groovy-sql-2.5.11.jar;%APP_HOME%\lib\groovy-swing-2.5.11.jar;%APP_HOME%\lib\groovy-templates-2.5.11.jar;%APP_HOME%\lib\groovy-testng-2.5.11.jar;%APP_HOME%\lib\groovy-xml-2.5.11.jar;%APP_HOME%\lib\groovy-2.5.11.jar;%APP_HOME%\lib\hamcrest-core-2.1.jar;%APP_HOME%\lib\hamcrest-2.1.jar;%APP_HOME%\lib\jboss-logging-3.4.1.Final.jar;%APP_HOME%\lib\snakeyaml-1.26.jar;%APP_HOME%\lib\jersey-client-1.19.1.jar;%APP_HOME%\lib\jersey-core-1.19.1.jar;%APP_HOME%\lib\xstream-1.4.11.1.jar;%APP_HOME%\lib\jsch.agentproxy.jsch-0.0.9.jar;%APP_HOME%\lib\jsch-0.1.54.jar;%APP_HOME%\lib\kork-annotations-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\guice-4.1.0.jar;%APP_HOME%\lib\opencensus-contrib-http-util-0.24.0.jar;%APP_HOME%\lib\guava-29.0-jre.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\client-java-proto-5.0.0.jar;%APP_HOME%\lib\protobuf-java-3.9.1.jar;%APP_HOME%\lib\cglib-nodep-3.2.0.jar;%APP_HOME%\lib\moniker-0.3.3.jar;%APP_HOME%\lib\frigga-0.24.0.jar;%APP_HOME%\lib\okhttp-apache-2.7.0.jar;%APP_HOME%\lib\okhttp-urlconnection-2.7.0.jar;%APP_HOME%\lib\okhttp-ws-2.7.5.jar;%APP_HOME%\lib\logging-interceptor-2.7.5.jar;%APP_HOME%\lib\okhttp-2.7.5.jar;%APP_HOME%\lib\commons-configuration-1.8.jar;%APP_HOME%\lib\de.huxhorn.sulky.ulid-8.2.0.jar;%APP_HOME%\lib\bcpkix-jdk15on-1.61.jar;%APP_HOME%\lib\bcprov-jdk15on-1.61.jar;%APP_HOME%\lib\annotations-17.0.0.jar;%APP_HOME%\lib\threeten-extra-1.0.jar;%APP_HOME%\lib\jsr311-api-1.1.1.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\commons-compress-1.18.jar;%APP_HOME%\lib\bcprov-ext-jdk15on-1.61.jar;%APP_HOME%\lib\jettison-1.3.7.jar;%APP_HOME%\lib\compactmap-1.2.1.jar;%APP_HOME%\lib\checker-qual-3.3.0.jar;%APP_HOME%\lib\error_prone_annotations-2.3.4.jar;%APP_HOME%\lib\okio-1.17.2.jar;%APP_HOME%\lib\javassist-3.19.0-GA.jar;%APP_HOME%\lib\jsoup-1.8.1.jar;%APP_HOME%\lib\annotations-3.0.0.jar;%APP_HOME%\lib\java-semver-0.9.0.jar;%APP_HOME%\lib\json-smart-2.3.jar;%APP_HOME%\lib\HdrHistogram-2.1.11.jar;%APP_HOME%\lib\LatencyUtils-2.0.3.jar;%APP_HOME%\lib\ant-junit-1.9.13.jar;%APP_HOME%\lib\ant-1.9.13.jar;%APP_HOME%\lib\ant-launcher-1.9.13.jar;%APP_HOME%\lib\ant-antlr-1.9.13.jar;%APP_HOME%\lib\commons-cli-1.4.jar;%APP_HOME%\lib\picocli-4.0.1.jar;%APP_HOME%\lib\qdox-1.12.1.jar;%APP_HOME%\lib\jline-2.14.6.jar;%APP_HOME%\lib\testng-6.13.1.jar;%APP_HOME%\lib\vavr-0.10.0.jar;%APP_HOME%\lib\commons-math-2.2.jar;%APP_HOME%\lib\commons-lang-2.6.jar;%APP_HOME%\lib\commons-logging-1.1.1.jar;%APP_HOME%\lib\config-1.3.3.jar;%APP_HOME%\lib\failureaccess-1.0.1.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\j2objc-annotations-1.3.jar;%APP_HOME%\lib\auto-value-annotations-1.6.6.jar;%APP_HOME%\lib\google-auth-library-credentials-0.18.0.jar;%APP_HOME%\lib\builder-annotations-0.18.0.jar;%APP_HOME%\lib\swagger-annotations-1.5.12.jar;%APP_HOME%\lib\joda-convert-1.2.jar;%APP_HOME%\lib\stax-api-1.0.1.jar;%APP_HOME%\lib\aopalliance-1.0.jar;%APP_HOME%\lib\dexx-collections-0.2.jar;%APP_HOME%\lib\accessors-smart-1.2.jar;%APP_HOME%\lib\jcommander-1.72.jar;%APP_HOME%\lib\vavr-match-0.10.0.jar;%APP_HOME%\lib\commons-jxpath-1.3.jar;%APP_HOME%\lib\ion-java-1.0.2.jar;%APP_HOME%\lib\opencensus-api-0.24.0.jar;%APP_HOME%\lib\sundr-core-0.18.0.jar;%APP_HOME%\lib\sundr-codegen-0.18.0.jar;%APP_HOME%\lib\resourcecify-annotations-0.18.0.jar;%APP_HOME%\lib\xmlpull-1.1.3.1.jar;%APP_HOME%\lib\xpp3_min-1.1.4c.jar;%APP_HOME%\lib\android-json-0.0.20131108.vaadin1.jar;%APP_HOME%\lib\apiguardian-api-1.1.0.jar;%APP_HOME%\lib\asm-5.0.4.jar;%APP_HOME%\lib\grpc-context-1.22.1.jar;%APP_HOME%\lib\jsch.agentproxy.usocket-nc-0.0.9.jar;%APP_HOME%\lib\jsch.agentproxy.sshagent-0.0.9.jar;%APP_HOME%\lib\jsch.agentproxy.core-0.0.9.jar;%APP_HOME%\lib\opentest4j-1.2.0.jar

@rem Execute orca
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %ORCA_OPTS%  -classpath "%CLASSPATH%" com.netflix.spinnaker.orca.Main %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable ORCA_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%ORCA_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
