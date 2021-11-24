--INSERT some students
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

--Teacher
INSERT INTO professor(mail, password, nome)
VALUES ('mlcorreia@dei.uc.pt', '12345', 'Clara Luxo')

--Cadeira
INSERT INTO cadeira(nome, ano, departamento, universidade)
VALUES ('Processos de Gestão e de Inovação', '3', 'Departamento de Engenharia Informática', 'Engenharia Informática', 'Universidade de Coimbra');

--Aula
INSERT INTO aula(sala, qrcode, )
