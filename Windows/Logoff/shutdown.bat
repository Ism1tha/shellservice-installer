FOR /F "skip=1 tokens=1-6" %%G IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
   IF "%%~L"=="" goto s_done
      set year=%%L
      set month=00%%J
      set day=00%%G
      set hour=00%%H
      set minute=00%%I
      set second=00%%K
)
:s_done
set foldername=%year%-%month%-%day%-%hour%-%minute%-%second%
cd /D P:\Windows
mkdir %USERNAME% 2> NUL
cd /D P:\Windows\%USERNAME%
mkdir %foldername%
cmd /c "xcopy /i /e %UserProfile%\Documents\fitxers P:\Windows\%USERNAME%\%foldername%\"
cd /D %UserProfile%\Documents\fitxers
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)



