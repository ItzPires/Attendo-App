CREATE TABLE aluno (
	id 					Serial,
	numero		 		BIGINT UNIQUE NOT NULL,
	mail	 			VARCHAR(512),
	password	 		VARCHAR(512) NOT NULL,
	nome	 			VARCHAR(512) NOT NULL,
	sobre_mim	 		VARCHAR(512),
	login_time 			TIMESTAMP,
	logged_in	 		BOOL NOT NULL DEFAULT False,
	PRIMARY KEY(id)
);

CREATE TABLE cadeira (
	id 					SERIAL,
	nome			 	VARCHAR(512) NOT NULL,
	ano			 		INTEGER NOT NULL,
	curso 				VARCHAR(512) NOT NULL,
	departamento		VARCHAR(512),
	universidade		VARCHAR(512),
	professor_id 		INTEGER NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE professor (
	id 					SERIAL,
	mail	 			VARCHAR(512) NOT NULL UNIQUE,
	password	 		VARCHAR(512) NOT NULL,
	nome	 			VARCHAR(512) NOT NULL,
	sobre_mim	 		VARCHAR(512),
	login_time 			TIMESTAMP,
	logged_in	 		BOOL NOT NULL DEFAULT False,
	PRIMARY KEY(id)
);

CREATE TABLE aula (
	id 					SERIAL,
	qrcode			 	VARCHAR(512),
	horario_id	 		INTEGER NOT NULL,
	turma_id 			INTEGER NOT NULL,
	dia 				DATE,
	PRIMARY KEY(id)
);

CREATE TABLE presenca (
	aula_id				INTEGER NOT NULL,
	aluno_id 			INTEGER NOT NULL
);

CREATE TABLE horario_semanal (
	id		 			SERIAL,
	-- Dia da semana varia de 1 -> Domingo até 7 -> Segunda feira
	dia_semana	 		INTEGER NOT NULL,
	sala			 	VARCHAR(512) NOT NULL,
	hora_de_inicio		TIME NOT NULL,
	hora_de_fim	 		TIME NOT NULL,
	turma_id	 		INTEGER NOT NULL,
	dia_ultima_guardada DATE,
	PRIMARY KEY(id)
);

CREATE TABLE turma (
	id			 		SERIAL,
	nome			 	VARCHAR(512) NOT NULL,
	professor_id 		INTEGER NOT NULL,
	cadeira_id		 	INTEGER NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE aluno_turma (
	aluno_id 			INTEGER,
	turma_id 			INTEGER,
	PRIMARY KEY(aluno_id,turma_id)
);

ALTER TABLE cadeira ADD CONSTRAINT cadeira_fk1 FOREIGN KEY (professor_id) REFERENCES professor(id);

ALTER TABLE turma ADD CONSTRAINT turma_fk1 FOREIGN KEY (professor_id) REFERENCES professor(id);
ALTER TABLE turma ADD CONSTRAINT turma_fk2 FOREIGN KEY (cadeira_id) REFERENCES cadeira(id);

ALTER TABLE aula ADD CONSTRAINT aula_fk1 FOREIGN KEY (horario_id) REFERENCES horario_semanal(id);
ALTER TABLE aula ADD CONSTRAINT aula_fk2 FOREIGN KEY (turma_id) REFERENCES turma(id);

ALTER TABLE horario_semanal ADD CONSTRAINT horario_semanal_fk1 FOREIGN KEY (turma_id) REFERENCES turma(id);



ALTER TABLE presenca ADD CONSTRAINT presenca_fk1 FOREIGN KEY (aula_id) REFERENCES aula(id);
ALTER TABLE presenca ADD CONSTRAINT presenca_fk2 FOREIGN KEY (aluno_id) REFERENCES aluno(id);

ALTER TABLE aluno_turma ADD CONSTRAINT aluno_turma_fk1 FOREIGN KEY (aluno_id) REFERENCES aluno(id);
ALTER TABLE aluno_turma ADD CONSTRAINT aluno_turma_fk2 FOREIGN KEY (turma_id) REFERENCES turma(id);