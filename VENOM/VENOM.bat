@echo off
color 2
cls
 ===============================
echo        .:+*#%%#####*++++-.
echo                :#%%*+*+-.....
echo             .=%%+++:.
 echo           .=%#++=.
echo           -%%+++.
echo      .  =%%++-          ....
echo     #%+#%++=.        .:#%%%*
echo      :#@%#+=          :*+:-*%#:
echo     .*@@#.         .-%*::-%%#.
echo        .-%@@%-.      .=%%--%%%-
echo          .:--=*+-:.:-#%%%%%%%%*.                        
echo                .:-*#%%%%%%%%%%%%%-                     
echo                  .+%%%*+*%%%%%%%%+...                 
echo                .+%@@%%%%*#%%%%%%%%%*-.              
echo                   .*%@%%%%%%%%%%%%%%%%%#-.                 
echo                   .*%%%%%%%%%%%+#%%%%%%%%%*-.        
echo                 .=%%%%%%%%%%%%@%*%%%%%####=-==
echo                   :*%%%%%%%%%%%%%%%*#%%%%#+=-==+
echo                  .+=*%#%%%%%%%%%%%%%**%%#+**+-:-
echo                .-=::*-%%%%%%%%%%%%###*-*%###+:
echo              ...:..%%%%%%%%%%%%%%#:=*+-:.
echo                    *%%%%%%%%%%%%%%%%.
echo                    :#%%%%%%%%%%%%%%%%+
echo                   .*%%%%%%%%%%%%%%%%%#.
echo                   .=%%%%%%%%%%%%%%%%%%#:
echo                  .+%%%%%%%%%%%%%%%%%%%*.
echo                    :+*#%%%@%%%%%%%%%%%%#:.
echo                      ..:==+*#%#*=-:.:-+***:.
                             
                                                                                                            
                                                                     
                                                                                                            
                                                                                                            
                                                                                                            

===============================
echo.
echo 1 - Recherche d'une adresse IP
echo 2 - Recherche d'un email
echo 3 - Recherche sur un site web
echo 4 - Recherche d'un numero de telephone
echo 5 - Recherche sur les reseaux sociaux
echo 6 - Générer une adresse IP aléatoire
echo 7 - Outil d'information sur un site web
echo 8 - Quitter
echo.
set /p choix="Entrez le numero de votre choix: "

if "%choix%"=="1" goto ip_recherche
if "%choix%"=="2" goto email_recherche
if "%choix%"=="3" goto web_recherche
if "%choix%"=="4" goto tel_recherche
if "%choix%"=="5" goto social_recherche
if "%choix%"=="6" goto generer_ip
if "%choix%"=="7" goto site_info
if "%choix%"=="8" exit

:ip_recherche
cls
set /p ip="Entrez l'adresse IP ou domaine: "
echo Recherche d'informations DNS pour %ip%...
nslookup %ip%
pause
goto menu

:email_recherche
cls
set /p email="Entrez l'adresse email à rechercher: "
echo Recherche d'informations sur %email%...
:: Ici, tu peux utiliser un service API comme Hunter.io, mais tu dois configurer l'API avec des clés.
echo (Simuler la recherche d'email avec une API...)
pause
goto menu

:web_recherche
cls
set /p url="Entrez l'URL du site à analyser: "
echo Recherche d'informations sur le site %url%...
:: Utilisation d'un outil comme curl pour obtenir des données
curl -s %url%
pause
goto menu

:tel_recherche
cls
set /p tel="Entrez le numéro de téléphone à rechercher (format international): "
echo Recherche des informations pour le numéro %tel%...
:: Simuler une recherche avec un service API (ici, ce serait un appel à une API comme NumVerify ou Twilio)
:: Exemple avec un service API : curl -X GET "https://apilayer.net/api/validate?access_key=VOTRE_CLE_API&number=%tel%"
:: Remarque : tu dois avoir une clé API valide pour utiliser le service.
echo (Simuler la recherche de numéro de téléphone via une API...)
pause
goto menu

:social_recherche
cls
set /p social="Entrez un nom, email ou pseudo à rechercher sur les réseaux sociaux: "
echo Recherche sur les réseaux sociaux pour "%social%"...

:: Recherche sur Google pour voir les profils publics (Cela ouvre simplement une recherche Google)
start https://www.google.com/search?q=%social%+site:facebook.com
start https://www.google.com/search?q=%social%+site:twitter.com
start https://www.google.com/search?q=%social%+site:linkedin.com

pause
goto menu

:generer_ip
cls
echo ================================
echo   Générateur d'adresses IP
echo ================================
echo.
echo 1 - Générer une adresse IP dans le réseau 192.168.x.x
echo 2 - Générer une adresse IP dans un autre réseau (ex. 10.x.x.x)
echo 3 - Retour au menu principal
echo.
set /p choix_ip="Entrez le numero de votre choix: "

if "%choix_ip%"=="1" goto generer_ip_192_168
if "%choix_ip%"=="2" goto generer_ip_autre
if "%choix_ip%"=="3" goto menu

:generer_ip_192_168
cls
echo Génération d'une adresse IP aléatoire dans le réseau 192.168.x.x...
:: Génère un nombre aléatoire pour chaque octet de l'adresse IP
set /a octet1=192
set /a octet2=%random% %% 256
set /a octet3=%random% %% 256
set /a octet4=%random% %% 256
echo L'adresse IP générée est : 192.%octet2%.%octet3%.%octet4%
pause
goto generer_ip

:generer_ip_autre
cls
set /p prefixe="Entrez le premier octet du réseau (ex: 10 pour 10.x.x.x) : "
echo Génération d'une adresse IP aléatoire dans le réseau %prefixe%.x.x.x...
:: Génère un nombre aléatoire pour chaque octet
set /a octet2=%random% %% 256
set /a octet3=%random% %% 256
set /a octet4=%random% %% 256
echo L'adresse IP générée est : %prefixe%.%octet2%.%octet3%.%octet4%
pause
goto generer_ip

:site_info
cls
set /p site="Entrez l'URL du site web (ex: www.example.com) : "
echo.
echo Récupération des informations pour le site : %site%
echo.

:: 1. Récupérer l'adresse IP du site avec nslookup
echo Récupération de l'adresse IP de %site%...
nslookup %site%

echo.
:: 2. Vérification du statut HTTP du site avec curl
echo Vérification du statut HTTP du site %site%...
curl -I %site% | findstr /i "HTTP"

echo.
:: 3. Récupérer les informations du serveur web
echo Récupération des informations du serveur web de %site%...
curl -I %site% | findstr /i "Server"

pause
goto menu

:menu
cls
goto start


