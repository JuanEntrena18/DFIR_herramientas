# DFIR_herramientas
Uso de herramiendas DFIR y SCIPTS

## DFIR_info -> Información completa del sistema. 
Este script para Windows crea los siguientes archivos:
- systeminfo  > systeminfo.txt
- netstat -a  > netstat.txt
- ipconfig    > ipconfig.txt
- tasklist /V > tasklist_completo.txt
- netstat -an |find /i "listening" > open_ports.txt
- net user    > usuarios.txt
- gpresult /r > gpo_usuarios.txt
- query user  > usuarios_conectados.txt
- tracert www.google.com > tracert.txt
