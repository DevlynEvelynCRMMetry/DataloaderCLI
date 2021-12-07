
:run
set EXE_PATH=%~dp0
set DATALOADER_VERSION=52.0.0

set PROCESS_OPTION=process.name=accountInsert


IF "%JAVA_HOME%" == "" (
    for /f "tokens=*" %%i in ('dataloader-%DATALOADER_VERSION%-java-home.exe') do (
        IF EXIST "%%i" (
            set JAVA_HOME=%%i
        ) ELSE (
            echo %%i
        )
    )
)

IF "%JAVA_HOME%" == "" (
    echo To run process.bat, set the JAVA_HOME environment variable to the directory where the Java Runtime Environment ^(JRE^) is installed.
) ELSE (
    IF NOT EXIST "%JAVA_HOME%" (
        echo We couldn't find the Java Runtime Environment ^(JRE^) in directory "%JAVA_HOME%". To run process.bat, set the JAVA_HOME environment variable to the directory where the JRE is installed.
    ) ELSE (
        "%JAVA_HOME%\bin\java" -cp "%EXE_PATH%\..\dataloader-%DATALOADER_VERSION%-uber.jar" com.salesforce.dataloader.process.DataLoaderRunner salesforce.config.dir="C:\Users\denzy\dataloader\v52.0.0\samples\conf" run.mode=batch %PROCESS_OPTION%
    )
)

:end
exit /b %errorlevel%
