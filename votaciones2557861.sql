create database votaciones2557861;

use votaciones2557861;

create table Genero(
idGenero int auto_increment primary key,
nomGenero varchar(30) not null,
estadoG boolean not null);

create table Jornada(
idJornada int auto_increment primary key,
nomJornada varchar(30) not null,
estadoJ boolean not null);

create table TipoDocumento(
idTipoDoc int auto_increment primary key,
nomTipDoc varchar(30) not null,
estadoTD boolean not null);

create table TipoMiembro(
idTipoMiembro int auto_increment primary key,
nomTipoMiembro varchar(30) not null,
estadoTM boolean not null);

create table Curso(
idCurso int auto_increment primary key,
nomCurso varchar(30) not null,
estadoCu boolean not null);

create table Concejo(
idConcejo int auto_increment primary key,
nomConcejo varchar(30) not null,
estadoCo boolean not null);

create table Cargo(
idCargo int auto_increment primary key,
nomCargo varchar(30) not null,
idConcejoFK int(11) not null,
estadoC boolean not null);

create table Eleccion(
idEleccion int auto_increment primary key,
fechaEleccion date not null,
anioEleccion year not null,
estadoEL boolean not null);

create table Usuario(
idUsuario int auto_increment primary key,
noDocumento varchar(30) not null,
idTipoDocFK int(11) not null,
nombreUsuario varchar(30) not null,
apellidoUsuario varchar(30) not null,
idGeneroFK int(11) not null,
fechaNacUsuario date,
emailUsuario varchar(30) not null,
PasswordUsuario varchar(30) not null,
idJornadaFK int(11) not null,
idTipoMiembroFK int(11) not null,
idCurso int(11) not null,
fotoUsuario varchar(250) not null,
estadoU boolean not null);

create table Postulacion_candidato(
idPostCandidato int auto_increment primary key,
idUsuarioFK int(11) not null,
idEleccionFK int(11) not null,
idCargoFK int(11) not null,
Propuestas varchar(250) not null,
totalVotos int not null,
estadoCan boolean not null);

create table Votacion(
idVotacion int auto_increment primary key,
horaVotacion time not null,
idUsuarioFK int(11) not null,
idPostCandidatoFK int(11) not null,
estadoV boolean not null);


alter table Usuario
add constraint idGeneroFK
foreign key (idGeneroFK)
references Genero(idGenero);

alter table Usuario
add constraint idTipDocFK
foreign key (idTipoDocFK)
references TipoDocumento(idTipoDoc);

alter table Usuario
add constraint idJornadaFK
foreign key (idJornadaFK)
references Jornada(idJornada);

alter table Usuario
add constraint idTipoMiembroFK
foreign key (idTipoMiembroFK)
references TipoMiembro(idTipoMiembro);

alter table Usuario
add constraint idCurso
foreign key (idCurso)
references Curso(idCurso);

alter table Postulacion_candidato
add constraint idUsuarioFK
foreign key (idUsuarioFK)
references Usuario(idUsuario);

alter table Postulacion_candidato
add constraint idEleccionFK
foreign key (idEleccionFK)
references Eleccion(idEleccion);

alter table Postulacion_candidato
add constraint idCargoFK
foreign key (idCargoFK)
references Cargo(idCargo);

alter table Votacion
add constraint FKUsVot
foreign key (idUsuarioFK)
references Usuario(idUsuario);

alter table Votacion
add constraint FKPostVot
foreign key (idPostCandidatoFK)
references Postulacion_candidato(idPostCandidato);

insert into Genero(nomGenero,estadoG)
values('Femenino',true);
insert into Genero(nomGenero,estadoG)
values('Masculino',true);

insert into Jornada(nomJornada,estadoJ)
values('Mañana',true);
insert into Jornada(nomJornada,estadoJ)
values('Tarde',true);
insert into Jornada(nomJornada,estadoJ)
values('Noche',true);

insert into TipoDocumento(nomTipDoc,estadoTD)
values('Tarjeta de Identidad',true);
insert into TipoDocumento(nomTipDoc,estadoTD)
values('Cédula de ciudadania',true);
insert into TipoDocumento(nomTipDoc,estadoTD)
values('Cédula de extranjeria',true);
insert into TipoDocumento(nomTipDoc,estadoTD)
values('Pasaporte',true);
insert into TipoDocumento(nomTipDoc,estadoTD)
values('NUIP',false);

insert into TipoMiembro(nomTipoMiembro,estadoTM)
values('Estudiante',true);
insert into TipoMiembro(nomTipoMiembro,estadoTM)
values('Profesor',true);
insert into TipoMiembro(nomTipoMiembro,estadoTM)
values('Acudiente',true);

insert into Curso(nomCurso,estadoCu)
values('901',true);
insert into Curso(nomCurso,estadoCu)
values('902',true);
insert into Curso(nomCurso,estadoCu)
values('1001',true);
insert into Curso(nomCurso,estadoCu)
values('1002',true);
insert into Curso(nomCurso,estadoCu)
values('1003',false);
insert into Curso(nomCurso,estadoCu)
values('1101',true);
insert into Curso(nomCurso,estadoCu)
values('1102',true);
insert into Curso(nomCurso,estadoCu)
values('1103',false);

insert into Concejo(nomConcejo,estadoCO)
values('Concejo Académico',true);
insert into Concejo(nomConcejo,estadoCO)
values('Concejo Directivo',true);
insert into Concejo(nomConcejo,estadoCO)
values('Concejo Convivencia',true);

insert into Eleccion(fechaEleccion,anioEleccion,estadoEL)
values('2020-04-20','2020',true);
insert into Eleccion(fechaEleccion,anioEleccion,estadoEL)
values('2019-04-15','2019',true);
insert into Eleccion(fechaEleccion,anioEleccion,estadoEL)
values('2019-04-12','2019',false);
insert into Eleccion(fechaEleccion,anioEleccion,estadoEL)
values('2018-04-10','2018',true);
insert into Eleccion(fechaEleccion,anioEleccion,estadoEL)
values('2017-04-12','2017',true);

insert into Cargo(nomCargo,idConcejoFK,estadoC)
values('Personero','1',true);
insert into Cargo(nomCargo,idConcejoFK,estadoc)
values('Contralor','1',true);
insert into Cargo(nomCargo,idConcejoFK,estadoC)
values('Cabildante','1',true);



insert into Usuario(noDocumento,idTipoDocFK,nombreUsuario,apellidoUsuario,idGeneroFK,fechaNacUsuario,emailUsuario,passwordUsuario,fotoUsuario,idJornadaFK,idTipoMiembroFK,idCurso,estadoU)
values('1','1','VOTO','BLANCO','2','0000-00-00','-','-','...','1','1','3',true);
insert into Usuario(noDocumento,idTipoDocFK,nombreUsuario,apellidoUsuario,idGeneroFK,fechaNacUsuario,emailUsuario,passwordUsuario,fotoUsuario,idJornadaFK,idTipoMiembroFK,idCurso,estadoU)
values('1010123456','1','DAVID SANTIAGO','LÓPEZ MORA','2','2004-10-11','davidLopez456@hotmail.com','David2004','...','1','1','1',true);
insert into Usuario(noDocumento,idTipoDocFK,nombreUsuario,apellidoUsuario,idGeneroFK,fechaNacUsuario,emailUsuario,passwordUsuario,fotoUsuario,idJornadaFK,idTipoMiembroFK,idCurso,estadoU)
values('1010123789','1','LAURA MILENA','GOMEZ BONILLA','1','2004-03-17','lauragomez@gmail.com','Gomez2004','...','1','1','1',true);
insert into Usuario(noDocumento,idTipoDocFK,nombreUsuario,apellidoUsuario,idGeneroFK,fechaNacUsuario,emailUsuario,passwordUsuario,fotoUsuario,idJornadaFK,idTipoMiembroFK,idCurso,estadoU)
values('1010123741','1','DIEGO FERNANDO','CAÑON VARGAS','2','2003-05-20','diegocanon@hotmail.com','Diego2003','...','1','1','1',true);
insert into Usuario(noDocumento,idTipoDocFK,nombreUsuario,apellidoUsuario,idGeneroFK,fechaNacUsuario,emailUsuario,passwordUsuario,fotoUsuario,idJornadaFK,idTipoMiembroFK,idCurso,estadoU)
values('1010123852','1','TATIANA','VARGAS CABRERA','1','2003-11-28','tatacabrera@gmail.com','Cabrera2003','...','1','1','3',true);
insert into Usuario(noDocumento,idTipoDocFK,nombreUsuario,apellidoUsuario,idGeneroFK,fechaNacUsuario,emailUsuario,passwordUsuario,fotoUsuario,idJornadaFK,idTipoMiembroFK,idCurso,estadoU)
values('1010123963','1','LEYDY KATHERINE','FERNANDEZ RODRIGUEZ','1','2004-06-28','leydy2004@gmail.com','Leydy2004','...','1','1','4',true);
insert into Usuario(noDocumento,idTipoDocFK,nombreUsuario,apellidoUsuario,idGeneroFK,fechaNacUsuario,emailUsuario,passwordUsuario,fotoUsuario,idJornadaFK,idTipoMiembroFK,idCurso,estadoU)
values('1010123654','2','MAURICIO','BERMUDEZ AMAYA','2','2002-01-26','maobermudez@gmail.com','Amaya2002','...','1','1','4',true);
insert into Usuario(noDocumento,idTipoDocFK,nombreUsuario,apellidoUsuario,idGeneroFK,fechaNacUsuario,emailUsuario,passwordUsuario,fotoUsuario,idJornadaFK,idTipoMiembroFK,idCurso,estadoU)
values('1010741258','1','ANDRES FELIPE','RODRIGUEZ PEREZ','2','2004-03-23','andyrodriguez@gmail.com','Arodriguez2004','...','1','1','3',true);
insert into Usuario(noDocumento,idTipoDocFK,nombreUsuario,apellidoUsuario,idGeneroFK,fechaNacUsuario,emailUsuario,passwordUsuario,fotoUsuario,idJornadaFK,idTipoMiembroFK,idCurso,estadoU)
values('1010236859','1','MARIA ANGÉLICA','TRIVIÑO LATORRE','1','2002-02-04','angelicatri@gmail.com','Trivino2002','...','1','1','3',true);
insert into Usuario(noDocumento,idTipoDocFK,nombreUsuario,apellidoUsuario,idGeneroFK,fechaNacUsuario,emailUsuario,passwordUsuario,fotoUsuario,idJornadaFK,idTipoMiembroFK,idCurso,estadoU)
values('1010236963','1','GENARO','VASQUEZ RODRIGUEZ','2','2002-11-14','gevasquez@gmail.com','Vasquez123','...','1','1','3',false);

insert into postulacion_candidato(idUsuarioFK,idEleccionFK,idCargoFK,propuestas,totalVotos,estadoCan)
values('1','1','1','Mejorar entrega refrigerios, Alargar descansos','0',true);
insert into postulacion_candidato(idUsuarioFK,idEleccionFK,idCargoFK,propuestas,totalVotos,estadoCan)
values('5','1','1','Mejorar entrega refrigerios, Alargar descansos','0',true);
insert into postulacion_candidato(idUsuarioFK,idEleccionFK,idCargoFK,propuestas,totalVotos,estadoCan)
values('7','1','1','Mejorar sala de informática, Construir piscina','0',true);

insert into votacion(horaVotacion,idUsuarioFK,idPostCandidatoFK,estadoV)
values('12:08:15','1','1',true);
insert into votacion(horaVotacion,idUsuarioFK,idPostCandidatoFK,estadoV)
values('12:12:35','2','3',true);
insert into votacion(horaVotacion,idUsuarioFK,idPostCandidatoFK,estadoV)
values('12:14:18','3','2',true);
insert into votacion(horaVotacion,idUsuarioFK,idPostCandidatoFK,estadoV)
values('12:15:58','4','2',true);
insert into votacion(horaVotacion,idUsuarioFK,idPostCandidatoFK,estadoV)
values('12:18:02','5','3',true);
insert into votacion(horaVotacion,idUsuarioFK,idPostCandidatoFK,estadoV)
values('12:24:22','6','3',true);
insert into votacion(horaVotacion,idUsuarioFK,idPostCandidatoFK,estadoV)
values('12:28:02','7','3',true);
insert into votacion(horaVotacion,idUsuarioFK,idPostCandidatoFK,estadoV)
values('12:30:14','8','2',true);
insert into votacion(horaVotacion,idUsuarioFK,idPostCandidatoFK,estadoV)
values('12:40:20','9','1',true);
insert into votacion(horaVotacion,idUsuarioFK,idPostCandidatoFK,estadoV)
values('12:45:20','10','2',true);

Select nomtipdoc,noDocumento,nombreUsuario,apellidoUsuario,nomGenero,fechaNacUsuario,emailUsuario,passwordUsuario,nomJornada,nomTipoMiembro,nomCurso
From usuario inner join tipodocumento
on tipodocumento.idTipoDoc = Usuario.idtipodocFK inner join jornada
on jornada.idjornada = usuario.idjornadafk inner join genero 
on genero.idgenero = usuario.idgenerofk inner join tipomiembro
on tipomiembro.idtipomiembro = usuario.idtipomiembrofk inner join curso
on curso.idcurso = usuario.idcurso;

Select nomConcejo, nomCargo, estadoC
from Cargo inner join Concejo
on Concejo.idConcejo = Cargo.idConcejoFK;

Select nomConcejo, nomCargo, estadoC
from Cargo right join Concejo
on Concejo.idConcejo = Cargo.idConcejoFK;

Select nombreUsuario, apellidoUsuario, totalVotos 
from postulacion_candidato inner join Usuario
on usuario.idUsuario = postulacion_candidato.idUsuarioFK;





