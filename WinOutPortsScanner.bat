@ECHO off 
SETLOCAL ENABLEDELAYEDEXPANSION


SET FILE="C:\PortTestResult.txt"
ECHO Port test result>%FILE%
ECHO ================>>%FILE%
ECHO.>>%FILE%
ECHO The test started at %DATE% %TIME%>>%FILE%
ECHO.>>%FILE%


ECHO The test started at %DATE% %TIME%
ECHO.


FOR /L %%P IN (1, 1, 65535) DO (

	SET /A COUNT=1
	FOR /F "tokens=* USEBACKQ" %%R IN (`curl http://portquiz.net:%%P`) DO (
		IF !COUNT! GTR 1 (
			ECHO ============================
			ECHO.
			ECHO.
		) ELSE (
			ECHO/port %%P: %%R
			ECHO/port %%P: %%R>>!FILE!
			SET /A COUNT=!COUNT!+1
		)
	)
)


ECHO.>>%FILE%
ECHO The test ended at %DATE% %TIME%>>%FILE%
ECHO The test ended at %DATE% %TIME%


ECHO.
PAUSE