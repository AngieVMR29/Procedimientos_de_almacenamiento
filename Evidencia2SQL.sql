use votaciones2557861;

/*Registrar una elección*/

 delimiter //
create procedure InsertEleccion(in NewFechaE date, in NewanioE year, in newEstadoE boolean)

begin

Insert into eleccion (fechaEleccion,anioEleccion,estadoEL)
values (NewFechaE, NewanioE, newEstadoE);

End;
//
call InsertEleccion('2002-05-26','2002',True);

select * from eleccion;



/*Actualizar la fecha de una elección*/
/*drop procedure UpdateEstadoE*/
 delimiter //
create procedure UpdateFechaE(in idE int, in NewFechaE date)

begin

Update eleccion 
set fechaEleccion = NewFechaE
where idEleccion = idE;

End;
//
call UpdateFechaE(5,'2017-04-12');

select * from eleccion;

/*Cambiar de estado una elección*/

 delimiter //
create procedure UpdateEstadoE(in idE int, in newEstadoE Boolean)

begin

Update eleccion 
set estadoEL = newEstadoE
where idEleccion = idE;

End;
//
call UpdateEstadoE(5,false);

select * from eleccion;

/*Consultar usuario (con llaves foráneas)*/

 delimiter //
create procedure ConsultaU(in idU int)

begin

Select nomtipdoc,noDocumento,nombreUsuario,apellidoUsuario,nomGenero,fechaNacUsuario,emailUsuario,passwordUsuario,nomJornada,nomTipoMiembro,nomCurso
From usuario inner join tipodocumento
on tipodocumento.idTipoDoc = Usuario.idtipodocFK inner join jornada
on jornada.idjornada = usuario.idjornadafk inner join genero 
on genero.idgenero = usuario.idgenerofk inner join tipomiembro
on tipomiembro.idtipomiembro = usuario.idtipomiembrofk inner join curso
on curso.idcurso = usuario.idcurso
where idUsuario= idU;

End;
//
call ConsultaU(5);

/*Registrar un Usuario*/
 delimiter //
create procedure InsertUsu(in Newnumdoc varchar(30), in NewTipDoc int(11), in newnombreU varchar(30), in newapellidoU varchar(30), in NewGenero int(11), in newFechaNac date, in newEmail varchar(30), in newPassword varchar(30), in NewTipJornada int(11),in NewTipMiembro int(11),in NewCurso int(11), in newFoto varchar(250), in newEstadoU boolean)

begin

Insert into Usuario (noDocumento, idTipoDocFK, nombreUsuario, apellidoUsuario, idGeneroFK ,fechaNacUsuario, emailUsuario, PasswordUsuario, idJornadaFK, idTipoMiembroFK, idCurso, fotoUsuario, estadoU)
values (Newnumdoc, NewTipDoc, newnombreU, newapellidoU, NewGenero, newFechaNac, newEmail, newPassword, NewTipJornada, NewTipMiembro, NewCurso, newFoto, newEstadoU);

End;
//
call InsertUsu('135135153',1,'Angelica','Almonacid',1,'2001-08-08','ahsdahs@gmail.com','kdnfknfjef',1,1,1,'...',False);

select * from Usuario;

/*Cambiar password de un usuario*/

delimiter //
create procedure ChangePassword(in idU int, in Newpassword varchar(20))

begin

Update usuario 
set passwordUsuario = Newpassword
where idUsuario = idU;

End;
//
call ChangePassword(5,'SGDSHFD12');

select * from usuario;

/*Cambiar de estado un usuario*/

 delimiter //
create procedure UpdateEstadoU(in idU int, in newEstadoU Boolean)

begin

Update usuario
set estadoU = newEstadoU
where idUsuario = idU;

End;
//
call UpdateEstadoU(6,false);

select * from usuario;

/*Consultar usuario (con llaves foráneas) que tengan cédula de ciudadanía*/
 delimiter //
create procedure ConsultaUT(in TipoDocU int)

begin

Select nomtipdoc,noDocumento,nombreUsuario,apellidoUsuario,nomGenero,fechaNacUsuario,emailUsuario,passwordUsuario,nomJornada,nomTipoMiembro,nomCurso
From usuario inner join tipodocumento
on tipodocumento.idTipoDoc = Usuario.idtipodocFK inner join jornada
on jornada.idjornada = usuario.idjornadafk inner join genero 
on genero.idgenero = usuario.idgenerofk inner join tipomiembro
on tipomiembro.idtipomiembro = usuario.idtipomiembrofk inner join curso
on curso.idcurso = usuario.idcurso
where idTipoDoc= TipoDocU;

End;
//

call ConsultaUT(2);




