//Roles y usuario admin
INSERT INTO roles (ROL) VALUES ('ROLE_ADMIN');
INSERT INTO roles (ROL) VALUES ('ROLE_ENTRY');
INSERT INTO roles (ROL) VALUES ('ROLE_ENTRY2');
INSERT INTO roles (ROL) VALUES ('ROLE_CAMBIO_CONTRASENA');
INSERT INTO usuarios_sistema (NOMBRE_USUARIO, CUENTA_SINEXPIRAR, CUENTA_SINBLOQUEAR, CAMBIAR_CONTRASENA_ALLOGIN, DESCRIPCION, FECHA_REGISTRO, USUARIO_REGISTRO, CREDENCIAL_SINEXPIRAR, CORREO_ELECTRONICO, HABILITADO, FECHA_ULTACC, FECHA_ULTMODCRED, FECHA_ULTMOD, USUARIO_ULTMOD, CONTRASENA) VALUES ('admin', b'1', b'1', b'0', 'Administrador del Sistema', '2018-11-08 00:00:00', 'admin', b'1', 'waviles@icsnicaragua.org', b'1', '2018-11-08 00:00:00', '2018-11-08 00:00:00', '2018-11-08 00:00:00', 'admin', '6c36dc262b0e44be5811c2296669fc65643aec9dcaa4a76501e0a9508b633fd01ee59a207f8c6d68');
INSERT INTO usuarios_roles (ROL, NOMBRE_USUARIO, IDENTIFICADOR_EQUIPO, ESTADO, PASIVO, FECHA_REGISTRO, USUARIO_REGISTRO) VALUES ('ROLE_ADMIN', 'admin', 'admin', '2', '0', '2018-11-08 00:00:00', 'admin');
INSERT INTO usuarios_roles (ROL, NOMBRE_USUARIO, IDENTIFICADOR_EQUIPO, ESTADO, PASIVO, FECHA_REGISTRO, USUARIO_REGISTRO) VALUES ('ROLE_CAMBIO_CONTRASENA', 'admin', 'admin', '2', '0', '2018-11-08 00:00:00', 'admin');
INSERT INTO usuarios_roles (ROL, NOMBRE_USUARIO, IDENTIFICADOR_EQUIPO, ESTADO, PASIVO, FECHA_REGISTRO, USUARIO_REGISTRO) VALUES ('ROLE_ENTRY', 'admin', 'admin', '2', '0', '2018-11-08 00:00:00', 'admin');
INSERT INTO usuarios_roles (ROL, NOMBRE_USUARIO, IDENTIFICADOR_EQUIPO, ESTADO, PASIVO, FECHA_REGISTRO, USUARIO_REGISTRO) VALUES ('ROLE_ENTRY2', 'admin', 'admin', '2', '0', '2018-11-08 00:00:00', 'admin');
/*Plantilla*/
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'heading', 'Ingreso de Resultados de HAI','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'title', 'HAI','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'footer', '2018 Umich','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'welcome', 'Bienvenido ','0','0',0);
/*login page*/
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'login', 'Ingresar','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'login.accountExpired', 'Cuenta de usuario ha expirado!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'login.accountLocked', 'Cuenta de usuario está bloqueada!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'login.accountNotLocked', 'Cuenta de usuario está desbloqueada!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'login.badCredentials', 'Nombre de usuario o contraseña incorrectos!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'login.credentialsExpired', 'Credenciales de usuario han expirado!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'login.maxSessionsOut', 'Tiene una sesión activa! No puede crear otra!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'login.message', 'Por favor ingresar su nombre de usuario y contraseña','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'login.username', 'Nombre de usuario','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'login.password', 'Contraseña','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'login.forgot.password', 'Olvidó contraseña?','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'login.userEnabled', 'Usuario esta activo!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'login.userDisabled', 'Usuario esta inactivo!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'ask.chgpass', 'Exigir cambio de contraseña','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'seconds', 'segundos','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'session.expiring', 'Su sesión está a punto de expirar!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'session.expiring.confirm', 'Quiere continuar con su sesión?','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'session.expiring.time', 'Su sesión se cerrará en','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'session.keep', 'Mantener sesión','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'not', 'Notificación','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'resetPassword', 'Enviar nueva contraseña por correo','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'backLogin', 'Regresar a página de ingreso','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'invalidToken', 'El token es inválido','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'expiredToken', 'El token ha expirado','0','0',0);
/*Menu*/
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'home', 'Inicio','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'searchResult', 'Buscar resultado','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'newResult', 'Nuevo resultado','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'secondEntry', 'Segunda entrada','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'admin', 'Administración','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'users', 'Usuarios','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'translation', 'Traducción','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'seccatalogs', 'Respuestas','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'logout', 'Salir','0','0',0);
/*Resultados */
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'result', 'Resultado HAI','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'idResult', 'Identificador','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'sampleId', 'Codigo muestra','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'sampleType', 'Tipo muestra','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'sampleDate', 'Fecha muestra','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'resultDate', 'Fecha resultado','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'fluType', 'Influenza','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'antigen', 'Antígeno','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'res', 'Resultado','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'antigenAdditional', 'Adic Antígeno','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'file', 'Archivo','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'resultLab', 'Laboratorio','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'usrResult', 'Usuario','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'obs', 'Observaciones','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'status', 'Estado','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'dataEntryFinished', 'Marcar como finalizado','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'dataEntry1FinishedAlert', 'Si marca el registro como finalizado pasará a segunda digitación y ya no podrá ser editado.','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'dataEntry2FinishedAlert', 'Si marca el registro como finalizado se guardará como la versión oficial y solo puede ser editado por administradores.','0','0',0);
/*Usuarios*/
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'username', 'Usuario','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'userdesc', 'Descripción','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'useremail', 'Correo','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'userlock', 'Bloqueado','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'usercred', 'Contraseña vencida','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'userexp', 'Cuenta vencida','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'userroles', 'Roles','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'user.updated', 'Usuario actualizado','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'user.created', 'Usuario creado','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'profile', 'Perfil','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'rolEnabled', 'Rol esta activo!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'rolDisabled', 'Rol esta inactivo!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'rolAdded', 'Rol agregado!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'rolAll', 'Todos los roles ya están agregados!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'usuarioEnabled', 'Usuario está activo!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'usuarioDisabled', 'Usuario está inactivo!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'usuarioAdded', 'Usuario agregado!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'usuarioAll', 'Todos los usuarios ya están agregados!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'class edu.umich.hai.users.model.UserSistema', 'Usuario','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'class edu.umich.hai.users.model.Authority', 'Rol de Usuario','0','0',0);
/*Cambio contrasenia*/
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'changepass', 'Cambiar contraseña..','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'credentials.expired', 'Su contraseña ha caducado','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'pass.updated', 'Su contraseña ha sido actualizada','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'password.repeat', 'Repita la contraseña','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'Pattern.password.format', 'Al menos 8 caracteres combinando mayúsculas, minúsculas, numeros y caracteres especiales','0','0',0);
/*Accesos*/
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'access', 'Accesos de usuario','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'lastAccess', 'Ultimo acceso','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'dateCredentials', 'Ultimo cambio de contrasena','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'session', 'Id de sesion','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'ipaddress', 'Direccion IP','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'logindate', 'Fecha ingreso','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'logoutdate', 'Fecha salida','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'logouturl', 'URL salida','0','0',0);
/*Audit trail*/
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'audittrail', 'Bitacora de cambios','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'entityClass', 'Clase','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'entityName', 'Nombre','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'entityProperty', 'Propiedad','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'entityPropertyOldValue', 'Valor anterior','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'entityPropertyNewValue', 'Nuevo valor','0','0',0);
/*Roles*/
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'ROLE_ADMIN', 'Administrador','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'ROLE_CAMBIO_CONTRASENA', 'Cambio de contraseña','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'ROLE_ENTRY', 'Ingresar resultados','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'ROLE_ENTRY2', 'Doble digitación','0','0',0);
/*Metadata*/
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'createdBy', 'Creado por','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'dateCreated', 'Fecha creacion','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'modifiedBy', 'Modificado por','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'dateModified', 'Fecha de modificación','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'active', 'Activo','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'pasivo', 'Anulado','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'addedBy', 'Agregado por','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'dateAdded', 'Fecha','0','0',0);
/*Acciones, todas las paginas*/
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'actions', 'Acciones','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'add', 'Agregar','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'save', 'Guardar','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'edit', 'Editar','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'back', 'Regresar','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'cancel', 'Cancelar','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'choose', 'Elegir','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'change', 'Cambiar','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'disable', 'Deshabilitar','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'enable', 'Habilitar','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'end', 'Finalizar','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'unlock', 'Desbloquear','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'lock', 'Bloquear','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'export', 'Exportar','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'ok', 'Aceptar','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'search', 'Buscar','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'confirm', 'Confirmar','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'select', 'Seleccionar','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'please.enter', 'Favor ingresar','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ('delete', 'Eliminar', '0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ('generate', 'Generar', '0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ('parameter', 'Parámetro', '0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ('language', 'Idioma/Language', '0','0',0);
/*Mensajes generales, todas las paginas*/
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'enabled', 'Habilitado','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'locked', 'Bloqueado','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'notenabled', 'Deshabilitado','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'notlocked', 'Desbloqueado','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'process.errors', 'Han ocurrido errores en el proceso!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'process.success', 'El proceso se ha completado exitosamente!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'process.wait', 'Por favor espere..','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'noResults', 'No hay registros!','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'all', 'Todos','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'options', 'Opciones','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'category', 'Categoría','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'value', 'Valor','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'denied', 'Acceso denegado','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'deniedmessage', 'Lo sentimos, la página que solicitó no esta disponible con sus credenciales.','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'notfound', 'No encontrado','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'notfoundmessage', 'Lo sentimos, la página que solicitó no pudo ser encontrada.','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'empty', 'En blanco','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ('selected', 'Seleccionados', '0','0',0);
/*Formularios Relacionado a Traducción */
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'translations', 'Traducción de mensajes','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'messageKey', 'Código mensaje','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'spanish', 'Español','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'english', 'Inglés','0','0',0);
/*Formularios Relacionado a Catalogos */
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'seccatalogsform', 'Gestión de respuestas','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'ident', 'Identificador','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'catKey', 'Valor de la respuesta','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'catRoot', 'Catálogo Padre','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'pasive', 'De baja','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'order', 'Ordenamiento','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'opcionesCatalogo', 'Respuestas en este catálogo','0','0',0);
/*Catalogos*/
/*Si No*/
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_SINO', NULL, NULL, NULL, '1', 0, '0', 'Catalogo Si No');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_SINO_SI','1','CAT_SINO',NULL,'0',1,'0','Si');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_SINO_NO','0','CAT_SINO',NULL,'0',2,'0','No');
/*Laboratorios*/
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_LAB', NULL, NULL, NULL, '1', 0, '0', 'Catalogo de laboratorios');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_LAB_1','MICHIGAN','CAT_LAB',NULL,'0',1,'0','Michigan');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_LAB_2','NICARAGUA','CAT_LAB',NULL,'0',2,'0','Nicaragua');
/*Tipos de muestra*/
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_SMP', NULL, NULL, NULL, '1', 0, '0', 'Catalogo de tipos de muestra');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_SMP_1','SER','CAT_SMP',NULL,'0',1,'0','Suero');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_SMP_2','PLA','CAT_SMP',NULL,'0',2,'0','Plasma');
/*Tipos de influenza*/
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_FLU', NULL, NULL, NULL, '1', 0, '0', 'Catalogo de tipos de influenza');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_FLU_1','H1N1','CAT_FLU',NULL,'0',1,'0','Inf A H1N1');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_FLU_2','H3N2','CAT_FLU',NULL,'0',2,'0','Inf A H3N2');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_FLU_3','B','CAT_FLU',NULL,'0',3,'0','Inf B');
/*Antigenos H1N1*/
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_H1N1', NULL, NULL, NULL, '1', 0, '0', 'Catalogo de antigenos de H1N1');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_H1N1_1','H1N1pdm_CA09','CAT_H1N1',NULL,'0',1,'0','H1N1pdm_CA09');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_H1N1_2','H1N1pdm_MI15','CAT_H1N1',NULL,'0',2,'0','H1N1pdm_MI15');
/*Antigenos H1N1*/
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_H3N2', NULL, NULL, NULL, '1', 0, '0', 'Catalogo de antigenos de H3N2');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_H3N2_1','H3N2_TX12','CAT_H3N2',NULL,'0',1,'0','H3N2_TX12');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_H3N2_2','H3N2_SW13','CAT_H3N2',NULL,'0',2,'0','H3N2_SW13');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_H3N2_3','H3N2_HK14','CAT_H3N2',NULL,'0',3,'0','H3N2_HK14');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_H3N2_4','Nica_H3N2','CAT_H3N2',NULL,'0',4,'0','Nica_H3N2');
/*Antigenos B*/
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_INFB', NULL, NULL, NULL, '1', 0, '0', 'Catalogo de antigenos de Influenza B');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_INFB_1','B_PH13','CAT_INFB',NULL,'0',1,'0','B_PH13');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_INFB_2','B_BR08','CAT_INFB',NULL,'0',2,'0','B_BR08');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_INFB_3','Nica_B','CAT_INFB',NULL,'0',3,'0','Nica_B');
/*Titulos*/
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_TIT', NULL, NULL, NULL, '1', 0, '0', 'Catalogo de titulos');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_TIT_1','0','CAT_TIT',NULL,'0',1,'0','0');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_TIT_2','2','CAT_TIT',NULL,'0',2,'0','2');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_TIT_3','10','CAT_TIT',NULL,'0',3,'0','10');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_TIT_4','20','CAT_TIT',NULL,'0',4,'0','20');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_TIT_5','40','CAT_TIT',NULL,'0',5,'0','40');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_TIT_6','80','CAT_TIT',NULL,'0',6,'0','80');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_TIT_7','160','CAT_TIT',NULL,'0',7,'0','160');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_TIT_8','320','CAT_TIT',NULL,'0',8,'0','320');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_TIT_9','640','CAT_TIT',NULL,'0',9,'0','640');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_TIT_10','1280','CAT_TIT',NULL,'0',10,'0','1280');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_TIT_11','2560','CAT_TIT',NULL,'0',11,'0','2560');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_TIT_12','5120','CAT_TIT',NULL,'0',12,'0','5120');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_TIT_13','10240','CAT_TIT',NULL,'0',13,'0','10240');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_TIT_14','20480','CAT_TIT',NULL,'0',14,'0','20480');
/*Estados*/
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_STA', NULL, NULL, NULL, '1', 0, '0', 'Catalogo Si No');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_STA_1','0','CAT_STA',NULL,'0',1,'0','Primera Digitación Iniciada');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_STA_2','1','CAT_STA',NULL,'0',2,'0','Primera Digitación Completa');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_STA_3','2','CAT_STA',NULL,'0',3,'0','Segunda Digitación Iniciada');
INSERT INTO mensajes (messageKey, catKey, catRoot, en, isCat, orden, catPasive, es) VALUES ('CAT_STA_4','3','CAT_STA',NULL,'0',4,'0','Completo');
/*Doble entrada de datos*/
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'select1entry', 'Seleccionar primera entrada','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'select2entry', 'Seleccionar segunda entrada','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'diffentry', 'Existe diferencia entre las dos entradas de datos','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'entry1', 'Primera entrada','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'entry2', 'Segunda entrada','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'selectedentry2', 'Segunda entrada fue seleccionada','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'selectedentry1', 'Primera entrada fue seleccionada','0','0',0);
INSERT INTO mensajes (messageKey, es, catPasive, isCat, orden) VALUES ( 'difentrycorrected', 'Favor intente guardar nuevamente!','0','0',0);




