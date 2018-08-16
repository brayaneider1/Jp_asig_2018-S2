CREATE TABLE pais (
  id_pais  int(10) NOT NULL, 
  nom_pais varchar(250) NOT NULL, 
  PRIMARY KEY (id_pais)) comment='pais de la personal';
CREATE TABLE departamento (
  id_depart  int(10) NOT NULL, 
  nom_depart int(10) NOT NULL, 
  fk_id_pais int(10) NOT NULL, 
  PRIMARY KEY (id_depart)) comment='departamento de la persona';
CREATE TABLE municipio (
  id_munici    int(10) NOT NULL, 
  nom_munic    int(10) NOT NULL, 
  fk_id_depart int(10) NOT NULL, 
  PRIMARY KEY (id_munici)) comment='municipio que pertenece la persona';
CREATE TABLE cliente (
  id_cliente         int(10) NOT NULL, 
  nom_cliente        varchar(100) NOT NULL, 
  telefo_cliente     varchar(203) NOT NULL, 
  fecha_nace_cliente date NOT NULL, 
  direccion_cliente  varchar(200) NOT NULL, 
  fk_id_munici       int(10) NOT NULL, 
  PRIMARY KEY (id_cliente)) comment='Informacion basica del cliente para sus contacto';
CREATE TABLE poliza (
  id_poliza                     int(10) NOT NULL, 
  precio_poliza                 int(10) NOT NULL, 
  fk_id_estado_poliza           int(1) NOT NULL, 
  fk_id_poliza                  int(1) NOT NULL, 
  direccion_hogar               int(100) NOT NULL, 
  antiguedad_hogar              int(3) NOT NULL, 
  cant_habita_hogar             int(3) NOT NULL, 
  caracteristicas_hogar         varchar(255) NOT NULL, 
  fk_id_material_hogar          int(1) NOT NULL, 
  fk_id_tipo_uso_hogar          int(1) NOT NULL, 
  modelo_automovil              int(4) NOT NULL, 
  placa_automovil               varchar(8) NOT NULL, 
  fk_id_clase_auto              int(1) NOT NULL, 
  fk_id_tipo_automovil          int(1) NOT NULL, 
  fk_id_servicio_automovil      int(1) NOT NULL, 
  edad_vida                     int(3) NOT NULL, 
  fk_id_nivel_segu_social_salud int(1) NOT NULL, 
  PRIMARY KEY (id_poliza)) comment='existe tres tipos de polizas, para hogar, automovil y de vida,';
CREATE TABLE estado_poliza (
  id_estado_poliza  int(1) NOT NULL AUTO_INCREMENT, 
  nom_estado_poliza varchar(20) NOT NULL, 
  PRIMARY KEY (id_estado_poliza)) comment='la poliza esta activa o inactiva';
CREATE TABLE tipo_poliza (
  id_poliza       int(1) NOT NULL AUTO_INCREMENT, 
  nom_tipo_poliza varchar(20) NOT NULL, 
  PRIMARY KEY (id_poliza)) comment='segun su respetiva poliza desbloqueara casilla';
CREATE TABLE tipo_material_hogar (
  id_material_hogar         int(1) NOT NULL AUTO_INCREMENT, 
  nom_material_hogar        varchar(100) NOT NULL, 
  costo_tipo_material_hogar int(20) NOT NULL, 
  PRIMARY KEY (id_material_hogar)) comment='segun el material del hogar, puede aumentar el costo de la vivienda';
CREATE TABLE tipo_uso_hogar (
  id_tipo_uso_hogar    int(1) NOT NULL AUTO_INCREMENT, 
  nom_tipo_uso_hogar   varchar(200) NOT NULL, 
  costo_tipo_uso_hogar int(20) NOT NULL, 
  PRIMARY KEY (id_tipo_uso_hogar)) comment='habitual o alquilada, la ultima tiene mayor costo';
CREATE TABLE cobertura (
  id_cobertura        int(10) NOT NULL, 
  nom_cobertura       varchar(200) NOT NULL, 
  fk_id_poliza        int(10) NOT NULL, 
  fk_id_indemnizacion int(10) NOT NULL, 
  PRIMARY KEY (id_cobertura)) comment='la cobertura puede extenderse a varias polizas y varios aspectos
puede cubrir: robo accidentes accesorios desastresnaturales y vandalismo';
CREATE TABLE Clase_automovil (
  id_clase_auto    int(1) NOT NULL AUTO_INCREMENT, 
  nom_clase_auto   varchar(200) NOT NULL, 
  costo_clase_auto int(11) NOT NULL, 
  PRIMARY KEY (id_clase_auto)) comment='las clases de auntos son: automovil, campero, camioneta, bus';
CREATE TABLE tipo_automovil (
  id_tipo_automovil    int(1) NOT NULL AUTO_INCREMENT, 
  nom_tipo_automovil   varchar(200) NOT NULL, 
  costo_tipo_automovil int(11) NOT NULL, 
  PRIMARY KEY (id_tipo_automovil)) comment='los tipo de auntomoviles son: automovil, campero y pesado';
CREATE TABLE servicio_automovil (
  id_servicio_automovil    int(1) NOT NULL AUTO_INCREMENT, 
  nom_servicio_automovil   varchar(200) NOT NULL, 
  costo_servicio_automovil int(11) NOT NULL, 
  PRIMARY KEY (id_servicio_automovil)) comment='el servicion puede ser  particular o publico';
CREATE TABLE nivel_segu_social_salud (
  id_nivel_segu_social_salud int(1) NOT NULL AUTO_INCREMENT, 
  nom_nivel_segu_social      varchar(200) NOT NULL, 
  porcentaje_nivel           int(10) NOT NULL, 
  PRIMARY KEY (id_nivel_segu_social_salud)) comment='nivel de seguridad social para cualcular el costo del seguro de vida';
CREATE TABLE cliente_poliza (
  id_compra_poliza   int(10) NOT NULL, 
  Vigencia_clie_poli int(10) NOT NULL, 
  fecha_compra       date NOT NULL, 
  fk_id_cliente      int(10) NOT NULL, 
  fk_id_poliza       int(10) NOT NULL, 
  PRIMARY KEY (id_compra_poliza)) comment='la relacion de muchos a muchos se crea una tabla "cliente_poliza", un clinete compra muchas polizas, y una poliza puede ser comprada por muchos clientes, aqui llevara el registro de la compra y su respectiva vigencia';
CREATE TABLE cubre_cobertu_sinies (
  id_cubre_cobertu_sinies int(10) NOT NULL AUTO_INCREMENT, 
  fecha_cubre             date NOT NULL, 
  fk_id_cobertura         int(10) NOT NULL, 
  fk_id_siniestro         int(10) NOT NULL, 
  PRIMARY KEY (id_cubre_cobertu_sinies));
CREATE TABLE indemnizacion (
  id_indemnizacion  int(10) NOT NULL, 
  costo_inde        int(10) NOT NULL, 
  fk_id_estado_inde int(1) NOT NULL, 
  PRIMARY KEY (id_indemnizacion)) comment='se puede indenizar segun la cobertura : robo accidentes accesorios desastresnaturales y vandalismo';
CREATE TABLE estado_indemnizacion (
  id_estado_inde  int(1) NOT NULL AUTO_INCREMENT, 
  nom_estado_inde varchar(100) NOT NULL, 
  `Column`        int(10) NOT NULL, 
  PRIMARY KEY (id_estado_inde));
CREATE TABLE siniestro (
  id_siniestro                                int(10) NOT NULL AUTO_INCREMENT, 
  nom_siniestro                               varchar(100) NOT NULL, 
  Descricion                                  varchar(255) NOT NULL, 
  cubre_cobertu_siniesid_cubre_cobertu_sinies int(10) NOT NULL, 
  PRIMARY KEY (id_siniestro)) comment='los siniestros puedeser accidentes,robo, robo accesorios desastresnaturales y vandalismo';
CREATE TABLE Aseguradora (
  id_aseguradora       int(10) NOT NULL AUTO_INCREMENT, 
  nom_aseguradora      varchar(200) NOT NULL, 
  fk_id_poliza         int(10) NOT NULL, 
  telefono_aseguradora varchar(200) NOT NULL, 
  email_asseguradora   varchar(200) NOT NULL, 
  PRIMARY KEY (id_aseguradora)) comment='La informacion basica de la aseguradora o empresa';
ALTER TABLE departamento ADD INDEX FKdepartamen175390 (fk_id_pais), ADD CONSTRAINT FKdepartamen175390 FOREIGN KEY (fk_id_pais) REFERENCES pais (id_pais);
ALTER TABLE municipio ADD INDEX FKmunicipio981859 (fk_id_depart), ADD CONSTRAINT FKmunicipio981859 FOREIGN KEY (fk_id_depart) REFERENCES departamento (id_depart);
ALTER TABLE cliente ADD INDEX FKcliente373130 (fk_id_munici), ADD CONSTRAINT FKcliente373130 FOREIGN KEY (fk_id_munici) REFERENCES municipio (id_munici);
ALTER TABLE cliente_poliza ADD INDEX FKcliente_po677682 (fk_id_cliente), ADD CONSTRAINT FKcliente_po677682 FOREIGN KEY (fk_id_cliente) REFERENCES cliente (id_cliente);
ALTER TABLE cliente_poliza ADD INDEX FKcliente_po389078 (fk_id_poliza), ADD CONSTRAINT FKcliente_po389078 FOREIGN KEY (fk_id_poliza) REFERENCES poliza (id_poliza);
ALTER TABLE poliza ADD INDEX FKpoliza465405 (fk_id_poliza), ADD CONSTRAINT FKpoliza465405 FOREIGN KEY (fk_id_poliza) REFERENCES tipo_poliza (id_poliza);
ALTER TABLE poliza ADD INDEX FKpoliza183325 (fk_id_estado_poliza), ADD CONSTRAINT FKpoliza183325 FOREIGN KEY (fk_id_estado_poliza) REFERENCES estado_poliza (id_estado_poliza);
ALTER TABLE poliza ADD INDEX FKpoliza545861 (fk_id_material_hogar), ADD CONSTRAINT FKpoliza545861 FOREIGN KEY (fk_id_material_hogar) REFERENCES tipo_material_hogar (id_material_hogar);
ALTER TABLE poliza ADD INDEX FKpoliza871257 (fk_id_tipo_uso_hogar), ADD CONSTRAINT FKpoliza871257 FOREIGN KEY (fk_id_tipo_uso_hogar) REFERENCES tipo_uso_hogar (id_tipo_uso_hogar);
ALTER TABLE cobertura ADD INDEX FKcobertura780879 (fk_id_poliza), ADD CONSTRAINT FKcobertura780879 FOREIGN KEY (fk_id_poliza) REFERENCES poliza (id_poliza);
ALTER TABLE poliza ADD INDEX FKpoliza257875 (fk_id_clase_auto), ADD CONSTRAINT FKpoliza257875 FOREIGN KEY (fk_id_clase_auto) REFERENCES Clase_automovil (id_clase_auto);
ALTER TABLE poliza ADD INDEX FKpoliza666581 (fk_id_tipo_automovil), ADD CONSTRAINT FKpoliza666581 FOREIGN KEY (fk_id_tipo_automovil) REFERENCES tipo_automovil (id_tipo_automovil);
ALTER TABLE poliza ADD INDEX FKpoliza969232 (fk_id_servicio_automovil), ADD CONSTRAINT FKpoliza969232 FOREIGN KEY (fk_id_servicio_automovil) REFERENCES servicio_automovil (id_servicio_automovil);
ALTER TABLE poliza ADD INDEX FKpoliza783146 (fk_id_nivel_segu_social_salud), ADD CONSTRAINT FKpoliza783146 FOREIGN KEY (fk_id_nivel_segu_social_salud) REFERENCES nivel_segu_social_salud (id_nivel_segu_social_salud);
ALTER TABLE cubre_cobertu_sinies ADD INDEX FKcubre_cobe588663 (fk_id_cobertura), ADD CONSTRAINT FKcubre_cobe588663 FOREIGN KEY (fk_id_cobertura) REFERENCES cobertura (id_cobertura);
ALTER TABLE siniestro ADD INDEX FKsiniestro581064 (cubre_cobertu_siniesid_cubre_cobertu_sinies), ADD CONSTRAINT FKsiniestro581064 FOREIGN KEY (cubre_cobertu_siniesid_cubre_cobertu_sinies) REFERENCES cubre_cobertu_sinies (id_cubre_cobertu_sinies);
ALTER TABLE cubre_cobertu_sinies ADD INDEX FKcubre_cobe107153 (fk_id_siniestro), ADD CONSTRAINT FKcubre_cobe107153 FOREIGN KEY (fk_id_siniestro) REFERENCES siniestro (id_siniestro);
ALTER TABLE indemnizacion ADD INDEX FKindemnizac732273 (fk_id_estado_inde), ADD CONSTRAINT FKindemnizac732273 FOREIGN KEY (fk_id_estado_inde) REFERENCES estado_indemnizacion (id_estado_inde);
ALTER TABLE cobertura ADD INDEX FKcobertura496155 (fk_id_indemnizacion), ADD CONSTRAINT FKcobertura496155 FOREIGN KEY (fk_id_indemnizacion) REFERENCES indemnizacion (id_indemnizacion);
ALTER TABLE Aseguradora ADD INDEX FKAsegurador425489 (fk_id_poliza), ADD CONSTRAINT FKAsegurador425489 FOREIGN KEY (fk_id_poliza) REFERENCES poliza (id_poliza);
