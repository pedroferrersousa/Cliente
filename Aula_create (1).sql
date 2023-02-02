-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-01-25 22:15:56.386

-- tables
-- Table: Cliente
CREATE TABLE Cliente (
    Idcliente int  NOT NULL,
    Nome char(90)  NOT NULL,
    datanascimento date  NOT NULL,
    cpf char(12)  NOT NULL,
    email char(50)  NOT NULL,
    telefone char(12)  NULL,
    CONSTRAINT Id PRIMARY KEY (Idcliente)
);

-- Table: Curso
CREATE TABLE Curso (
    idcurso int  NOT NULL,
    nome char(90)  NOT NULL,
    cargahoraria int  NOT NULL,
    descricao char(120)  NOT NULL,
    CONSTRAINT Curso_pk PRIMARY KEY (idcurso)
);

-- Table: Inscricao
CREATE TABLE Inscricao (
    idcurso int  NOT NULL,
    idcliente int  NOT NULL,
    datainscricao date  NOT NULL,
    datacancelamento date  NULL,
    CONSTRAINT Idcliente PRIMARY KEY (idcurso,idcliente)
);

CREATE INDEX idcurso on Inscricao (idcurso ASC);

CREATE INDEX Table_3_Table_2 on Inscricao (idcliente ASC);

-- foreign keys
-- Reference: Table_2_Table_1 (table: Inscricao)
ALTER TABLE Inscricao ADD CONSTRAINT Table_2_Table_1
    FOREIGN KEY (idcurso)
    REFERENCES Cliente (Idcliente)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Table_3_Table_2 (table: Inscricao)
ALTER TABLE Inscricao ADD CONSTRAINT Table_3_Table_2
    FOREIGN KEY (idcliente)
    REFERENCES Curso (idcurso)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

