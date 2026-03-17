
CREATE DATABASE etec_dql;
USE etec_dql;

/*Prova de Banco de Dados 12/06*/

CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    curso VARCHAR(100)
);

CREATE TABLE professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    disciplina VARCHAR(100)
);

CREATE TABLE turmas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_turma VARCHAR(50),
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES professores(id)
);

CREATE TABLE matriculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_turma INT,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id),
    FOREIGN KEY (id_turma) REFERENCES turmas(id)
);

INSERT INTO alunos (nome, idade, curso) VALUES
('Ana Paula', 17, 'Informática'),
('Bruno Silva', 18, 'Administracão'),
('Carlos Oliveira', 17, 'Informática'),
('Daniela Lima', 19, 'Contabilidade'),
('Eduardo Dias', 18, 'Informática'),
('Fernanda Souza', 17, 'Administracão'),
('Gustavo Lima', 20, 'Contabilidade'),
('Helena Castro', 16, 'Informática'),
('Igor Ramos', 19, 'Informática'),
('Julia Martins', 17, 'Administracão'),
('Kaique Alves', 18, 'Informática'),
('Larissa Torres', 17, 'Contabilidade'),
('Marcos Nunes', 19, 'Administracão'),
('Natália Mendes', 18, 'Informática'),
('Otávio Rocha', 17, 'Contabilidade'),
('Paula Fernandes', 20, 'Administracão'),
('Rafael Duarte', 16, 'Informática'),
('Sabrina Lopes', 17, 'Contabilidade'),
('Thiago Costa', 18, 'Informática'),
('Vanessa Ribeiro', 19, 'Administracão'),
('William Pinto', 17, 'Contabilidade');

INSERT INTO professores (nome, disciplina) VALUES
('João Mendes', 'Matemática'),
('Maria Souza', 'Português'),
('Carlos Santos', 'Informática'),
('Lúcia Oliveira', 'Contabilidade'),
('Pedro Silva', 'Administracão');

INSERT INTO turmas (nome_turma, id_professor) VALUES
('Turma A', 1),
('Turma B', 2),
('Turma C', 3),
('Turma D', 4),
('Turma E', 5);

INSERT INTO matriculas (id_aluno, id_turma) VALUES
(1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(7,4),(8,4),
(9,5),(10,5),(11,1),(12,2),(13,3),(14,4),(15,5),
(16,1),(17,2),(18,3),(19,4),(20,5),(21,1),(1,2),
(2,3),(3,4),(4,5),(5,1),(6,2),(7,3),(8,4),(9,5);

/*A coordenação quer saber o nome e a idade dos alunos do curso de Informática.*/

SELECT 
	nome,
    idade
FROM 
	alunos 
WHERE 
	curso
IN 
	('Informática');
    
/*o diretor precisa de uma lista com os professores que lecionam disciplinhas
 relacionadas à área administrativa.*/
 
 SELECT 
	nome 
FROM 
	professores 
WHERE
	disciplina
IN 
	('Administração');
    
/*A secretaria deseja ver os alunos ordenados da maior para a menor idade */

SELECT 
	idade 
FROM
	alunos 
ORDER BY 
	(idade)desc;
    
/*O coordenador de cursos quer saber quantos alunos há em cada curso, para planejar novas turmas*/

SELECT COUNT(curso) AS total_alunos
FROM 
	alunos 
WHERE 
	curso
IN 
	('Informática' , 'Administração', 'Contabilidade');

/*Mostre apenas os cursos que têm mais de 6 alunos inscritos*/

SELECT 
	curso,
COUNT(*) AS total_matricula
FROM 
	alunos
GROUP BY 
	curso 
HAVING COUNT(*) > 6;
    
/*Liste os nomes dos alunos da Turma A*/

SELECT 
	alunos.nome
FROM 
	alunos 
JOIN 
	matriculas ON alunos.id = matriculas.id_aluno 
JOIN 
	turmas ON matriculas.id_turma = turmas.id 
WHERE turmas.nome_turma = 'Turma A';

/*A secretaria quer saber os nomes dos alunos que estão matriculados e em quais turmas*/

SELECT 
	a.nome AS alunos, m.id_turma
FROM
	alunos a 
INNER JOIN 
	matriculas m ON a.id = m.id_aluno;

/*Mostre todas as turmas e os nomes dos alunos nelas. (Apenas turmas com alunos)*/

SELECT 
	a.nome AS alunos, m.id_turma  
FROM 
	alunos a
INNER JOIN 
	matriculas m ON a.id = m.id_aluno
WHERE 
	 matriculas.id_turma >= 1; /*Não consegui fazer*/
     
/*Quantas matriculas foram feitas na turma B*/

SELECT 
	turmas,
COUNT(*) AS total_matriculasB; /*Não consegui fazer*/

/*Liste os nomes dos professores e as turmas que cada um leciona*/

SELECT nome, disciplina
FROM professores;

/*Qual a média de idade dos alunos de Contabilidade? */

SELECT AVG 
	(idade) AS media_idadeA
FROM 
	alunos 
WHERE
	curso = 'Contabilidade';