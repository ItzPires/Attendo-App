-- INSERT some students
INSERT INTO aluno(numero, mail, password, nome)
VALUES ('2019217793', 'uc2019217793@student.uc.pt', '12345', 'Pedro Henriques');
INSERT INTO aluno(numero, mail, password, nome)
VALUES ('2019218086', 'uc2019218086@student.uc.pt', '12345', 'Adriana Bernardo');
INSERT INTO aluno(numero, mail, password, nome)
VALUES ('2019222451', 'uc2019222451@student.uc.pt', '12345', 'Fábio Vaqueiro');
INSERT INTO aluno(numero, mail, password, nome)
VALUES ('2019220273', 'uc2019220273@student.uc.pt', '12345', 'João Fernandes');
INSERT INTO aluno(numero, mail, password, nome)
VALUES ('2019225195', 'uc2019225195@student.uc.pt', '12345', 'Samuel Tiago');
INSERT INTO aluno(numero, mail, password, nome)
VALUES ('2019217420', 'uc2019217420@student.uc.pt', '12345', 'Pedro Mendes');
INSERT INTO aluno(numero, mail, password, nome)
VALUES ('2019223988', 'uc2019223988@student.uc.pt', '12345', 'Pedro Chaves');

-- Teacher
INSERT INTO professor(mail, password, nome)
VALUES ('mlcorreia@dei.uc.pt', '12345', 'Clara Luxo');

-- Cadeira
INSERT INTO cadeira(nome, ano, departamento, curso, universidade, professor_id)
VALUES ('Processos de Gestão e de Inovação', 3, 'Departamento de Engenharia Informática', 'Engenharia Informática', 'Universidade de Coimbra', 1);

-- Turma PGI
INSERT INTO turma(nome, professor_id, cadeira_id)
VALUES ('Teorico prática 1', 1, 1); --???? IDS

-- Horário da turma
INSERT INTO horario_semanal(dia_semana, hora_de_inicio, hora_de_fim, turma_id)
VALUES ('Quinta', TIME '18:00:00', TIME '20:00:00', 1);

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