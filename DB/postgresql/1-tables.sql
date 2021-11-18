CREATE TABLE aluno (
	numero_de_estudante VARCHAR(512) NOT NULL,
	mail	 VARCHAR(512) NOT NULL,
	password VARCHAR(512) NOT NULL,
	nome	 VARCHAR(512) NOT NULL,
	PRIMARY KEY(numero_de_estudante)
);

CREATE TABLE cadeira (
	id		 serial,
	nome	 VARCHAR(512) NOT NULL,
	departamento VARCHAR(512) NOT NULL,
	ano		 INTEGER,
	PRIMARY KEY(id)
);

CREATE TABLE professor (
	mail	 VARCHAR(512) NOT NULL,
	password VARCHAR(512) NOT NULL,
	nome	 VARCHAR(512) NOT NULL,
	PRIMARY KEY(mail)
);

CREATE TABLE aula (
	id		    SERIAL,
	sala		 VARCHAR(512),
	horario_id BIGINT NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE presenca (
	aula_id		 BIGINT NOT NULL,
	numero_aluno VARCHAR(512) NOT NULL
);

CREATE TABLE horario_semanal (
	id		 BIGINT,
	dia_de_semana	 BIGINT,
	inicio TIMESTAMP,
	fim	 TIMESTAMP,
	cadeira_id	 INTEGER NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE cadeira_aluno (
	cadeira_id		 INTEGER,
	numero_aluno VARCHAR(512),
	PRIMARY KEY(cadeira_id,numero_aluno)
);

CREATE TABLE professor_cadeira (
	professor_mail VARCHAR(512),
	cadeira_id		 INTEGER,
	PRIMARY KEY(professor_mail,cadeira_id)
);

ALTER TABLE aula ADD CONSTRAINT aula_fk1 FOREIGN KEY (horario_id) REFERENCES horario_semanal(id);
ALTER TABLE presenca ADD CONSTRAINT presenca_fk1 FOREIGN KEY (aula_id) REFERENCES aula(id);
ALTER TABLE presenca ADD CONSTRAINT presenca_fk2 FOREIGN KEY (numero_aluno) REFERENCES aluno(numero_de_estudante);
ALTER TABLE horario_semanal ADD CONSTRAINT horario_semanal_fk1 FOREIGN KEY (cadeira_id) REFERENCES cadeira(id);
ALTER TABLE cadeira_aluno ADD CONSTRAINT cadeira_aluno_fk1 FOREIGN KEY (cadeira_id) REFERENCES cadeira(id);
ALTER TABLE cadeira_aluno ADD CONSTRAINT cadeira_aluno_fk2 FOREIGN KEY (numero_aluno) REFERENCES aluno(numero_de_estudante);
ALTER TABLE professor_cadeira ADD CONSTRAINT professor_cadeira_fk1 FOREIGN KEY (professor_mail) REFERENCES professor(mail);
ALTER TABLE professor_cadeira ADD CONSTRAINT professor_cadeira_fk2 FOREIGN KEY (cadeira_id) REFERENCES cadeira(id);
