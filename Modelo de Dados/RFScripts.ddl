-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2023-05-29 22:51:17 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_bairro (
    cd_bairro          NUMBER(5) NOT NULL,
    nm_bairro          VARCHAR2(60) NOT NULL,
    t_cidade_cd_cidade NUMBER(4) NOT NULL
);

ALTER TABLE t_bairro ADD CONSTRAINT t_bairro_pk PRIMARY KEY ( cd_bairro );

CREATE TABLE t_categoria (
    id_categoria NUMBER(2) NOT NULL,
    nm_categoria VARCHAR2(12) NOT NULL,
    nm_cor       VARCHAR2(15)
);

ALTER TABLE t_categoria ADD CONSTRAINT t_categoria_pk PRIMARY KEY ( id_categoria );

CREATE TABLE t_cidade (
    cd_cidade          NUMBER(4) NOT NULL,
    nm_cidade          VARCHAR2(60) NOT NULL,
    t_estado_cd_estado NUMBER(2) NOT NULL
);

ALTER TABLE t_cidade ADD CONSTRAINT t_cidade_pk PRIMARY KEY ( cd_cidade );

CREATE TABLE t_endereco (
    nr_cep             NUMBER(8) NOT NULL,
    ds_logradouro      VARCHAR2(80) NOT NULL,
    t_bairro_cd_bairro NUMBER(5) NOT NULL
);

ALTER TABLE t_endereco ADD CONSTRAINT t_endereco_pk PRIMARY KEY ( nr_cep );

CREATE TABLE t_estado (
    cd_estado NUMBER(2) NOT NULL,
    nm_estado VARCHAR2(60) NOT NULL,
    sg_estado VARCHAR2(2) NOT NULL
);

ALTER TABLE t_estado ADD CONSTRAINT t_estado_pk PRIMARY KEY ( cd_estado );

CREATE TABLE t_gasto (
    id_gasto                 NUMBER(9) NOT NULL,
    vl_gasto                 NUMBER(9, 2) NOT NULL,
    ds_descricao             VARCHAR2(60) NOT NULL,
    dt_gasto                 DATE NOT NULL,
    ob_observacao            VARCHAR2(200),
    t_usuario_id_usuario     NUMBER(5) NOT NULL,
    t_categoria_id_categoria NUMBER(2) NOT NULL
);

ALTER TABLE t_gasto ADD CONSTRAINT t_gasto_pk PRIMARY KEY ( id_gasto );

CREATE TABLE t_meta (
    id_meta              NUMBER(6) NOT NULL,
    ds_descricao         VARCHAR2(20) NOT NULL,
    vl_meta              NUMBER(9, 2) NOT NULL,
    dt_prazo             DATE NOT NULL,
    t_usuario_id_usuario NUMBER(5) NOT NULL
);

ALTER TABLE t_meta ADD CONSTRAINT t_meta_pk PRIMARY KEY ( id_meta );

CREATE TABLE t_recebimento (
    id_recebimento       unknown 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL,
    vl_recebimento       NUMBER(9, 2) NOT NULL,
    ds_descricao         VARCHAR2(60) NOT NULL,
    dt_recebimento       DATE NOT NULL,
    ob_observacao        VARCHAR2(200),
    t_usuario_id_usuario NUMBER(5) NOT NULL
);

ALTER TABLE t_recebimento ADD CONSTRAINT t_recebimento_pk PRIMARY KEY ( id_recebimento );

CREATE TABLE t_usuario (
    id_usuario NUMBER(5) NOT NULL,
    nr_cpf     NUMBER(11) NOT NULL,
    nm_nome    VARCHAR2(60) NOT NULL,
    ds_email   VARCHAR2(60) NOT NULL,
    ds_senha   VARCHAR2(12) NOT NULL
);

ALTER TABLE t_usuario ADD CONSTRAINT t_usuario_pk PRIMARY KEY ( id_usuario );

CREATE TABLE t_usuario_endereco (
    t_usuario_id_usuario NUMBER(5) NOT NULL,
    t_endereco_nr_cep    NUMBER(8) NOT NULL,
    nr_endereco          NUMBER(3) NOT NULL,
    ds_complemento       VARCHAR2(20)
);

CREATE UNIQUE INDEX t_usuario_endereco__idx ON
    t_usuario_endereco (
        t_usuario_id_usuario
    ASC );

ALTER TABLE t_usuario_endereco ADD CONSTRAINT t_usuario_endereco_pk PRIMARY KEY ( t_usuario_id_usuario,
                                                                                  t_endereco_nr_cep );

ALTER TABLE t_bairro
    ADD CONSTRAINT t_bairro_t_cidade_fk FOREIGN KEY ( t_cidade_cd_cidade )
        REFERENCES t_cidade ( cd_cidade );

ALTER TABLE t_cidade
    ADD CONSTRAINT t_cidade_t_estado_fk FOREIGN KEY ( t_estado_cd_estado )
        REFERENCES t_estado ( cd_estado );

ALTER TABLE t_endereco
    ADD CONSTRAINT t_endereco_t_bairro_fk FOREIGN KEY ( t_bairro_cd_bairro )
        REFERENCES t_bairro ( cd_bairro );

ALTER TABLE t_gasto
    ADD CONSTRAINT t_gasto_t_categoria_fk FOREIGN KEY ( t_categoria_id_categoria )
        REFERENCES t_categoria ( id_categoria );

ALTER TABLE t_gasto
    ADD CONSTRAINT t_gasto_t_usuario_fk FOREIGN KEY ( t_usuario_id_usuario )
        REFERENCES t_usuario ( id_usuario );

ALTER TABLE t_meta
    ADD CONSTRAINT t_meta_t_usuario_fk FOREIGN KEY ( t_usuario_id_usuario )
        REFERENCES t_usuario ( id_usuario );

ALTER TABLE t_recebimento
    ADD CONSTRAINT t_recebimento_t_usuario_fk FOREIGN KEY ( t_usuario_id_usuario )
        REFERENCES t_usuario ( id_usuario );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_usuario_endereco
    ADD CONSTRAINT t_usuario_endereco_t_endereco_fk FOREIGN KEY ( t_endereco_nr_cep )
        REFERENCES t_endereco ( nr_cep );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_usuario_endereco
    ADD CONSTRAINT t_usuario_endereco_t_usuario_fk FOREIGN KEY ( t_usuario_id_usuario )
        REFERENCES t_usuario ( id_usuario );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             1
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   3
-- WARNINGS                                 0
