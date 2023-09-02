## Licencia

Para ver el estado de la licencia de nuestro servidor podemos ejecutar estos dos comandos, `slmgr.vbs /dli` y `slmgr.vbs /dlv`

Para verificar la versión con la que contamos 
`dism /online /get-currentedition`

Comprobar a las versiones que podemos actualizar
`dism /online /get-targeteditions`

Cambiar a ServerStandard con el siguiente comando:
`dism /online /set-edition:ServerStandard /productkey:KEY /AcceptEula`

- [Keys](https://learn.microsoft.com/es-es/windows-server/get-started/kms-client-activation-keys)