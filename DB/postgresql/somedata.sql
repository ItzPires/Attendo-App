-- INSERT some students
CREATE EXTENSION IF NOT EXISTS pgcrypto;
INSERT INTO aluno(numero, mail, password, nome, sobre_mim)
VALUES ('2019217793', 'uc2019217793@student.uc.pt', crypt('12345', gen_salt('md5')), 'Pedro Henriques', 'Sou bué fixe ya');
INSERT INTO aluno(numero, mail, password, nome, sobre_mim)
VALUES ('2019218086', 'uc2019218086@student.uc.pt', crypt('12345', gen_salt('md5')), 'Adriana Bernardo', 'Sou bué monga');
INSERT INTO aluno(numero, mail, password, nome, sobre_mim)
VALUES ('2019222451', 'uc2019222451@student.uc.pt', crypt('12345', gen_salt('md5')), 'Fábio Vaqueiro', 'A tua carteira onde tá?');
INSERT INTO aluno(numero, mail, password, nome, sobre_mim)
VALUES ('2019220273', 'uc2019220273@student.uc.pt', crypt('12345', gen_salt('md5')), 'João Fernandes', 'Pomba\n#ABS\n#Pombal');
INSERT INTO aluno(numero, mail, password, nome, sobre_mim)
VALUES ('2019225195', 'uc2019225195@student.uc.pt', crypt('12345', gen_salt('md5')), 'Samuel Tiago', 'Samuel aqui');
INSERT INTO aluno(numero, mail, password, nome, sobre_mim)
VALUES ('2019217420', 'uc2019217420@student.uc.pt', crypt('12345', gen_salt('md5')), 'Pedro Mendes', 'adsadadsasd');
INSERT INTO aluno(numero, mail, password, nome, sobre_mim)
VALUES ('2019223988', 'uc2019223988@student.uc.pt', crypt('12345', gen_salt('md5')), 'Pedro Chaves', 'asdasda');

-- Teacher
INSERT INTO professor(mail, password, nome, sobre_mim)
VALUES ('mlcorreia@dei.uc.pt', crypt('12345', gen_salt('md5')), 'Clara Luxo', 'Prof PGI');

-- Cadeira
INSERT INTO cadeira(nome, ano, departamento, curso, universidade, professor_id)
VALUES ('Processos de Gestão e de Inovação', 3, 'Departamento de Engenharia Informática', 'Engenharia Informática', 'Universidade de Coimbra', 1);

-- Turma PGI
INSERT INTO turma(nome, professor_id, cadeira_id)
VALUES ('Teorico prática 1', 1, 1); --???? IDS

-- Horário da turma
INSERT INTO horario_semanal(dia_semana, hora_de_inicio, hora_de_fim, turma_id, sala)
VALUES (5, TIME '18:00:00', TIME '20:00:00', 1, 'C5.1');

-- Aula da Turma
INSERT INTO aula(horario_id, turma_id)
VALUES (1, 1);


-- Aluno Turma
INSERT INTO aluno_turma(aluno_id, turma_id)
VALUES (1, 1);
INSERT INTO aluno_turma(aluno_id, turma_id)
VALUES (2, 1);
INSERT INTO aluno_turma(aluno_id, turma_id)
VALUES (3, 1);
INSERT INTO aluno_turma(aluno_id, turma_id)
VALUES (4, 1);
INSERT INTO aluno_turma(aluno_id, turma_id)
VALUES (5, 1);
INSERT INTO aluno_turma(aluno_id, turma_id)
VALUES (6, 1);