#Rotina de backup banco Garagem
echo off
echo
echo====Gerando Backup unimed - Banco de dados==========
echo
echo
mysqldump -uroot -prpmt123 -hlocalhost --single-transaction -v garagem > c:\projetos\estacionamento\garagemserver.sql
echo
echo