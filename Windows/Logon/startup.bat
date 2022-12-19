cmd /c "net use P: \\192.168.1.24\mnt\fitxers"
cd %UserProfile%\Documents
mkdir fitxers 2> NUL
cmd /c "mklink /D %UserProfile%\Desktop\Fitxers %UserProfile%\Documents\fitxers"
START cmd /c "ECHO NFS AIA Server disk mounted (P:). && PAUSE"