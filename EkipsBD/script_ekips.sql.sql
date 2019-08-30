CREATE DATABASE M_Ekips

USE M_Ekips


CREATE TABLE Usuarios(
	IdUsuario INT PRIMARY KEY IDENTITY NOT NULL
	,Email VARCHAR(255) UNIQUE NOT NULL
	,Senha VARCHAR(255) NOT NULL
	,IdPermissao INT FOREIGN KEY REFERENCES Permissao(IdPermissao)
);

CREATE TABLE Funcionarios(
	IdFuncionario INT PRIMARY KEY IDENTITY NOT NULL
	,Nome VARCHAR(255) UNIQUE NOT NULL
	,CPF VARCHAR(20) UNIQUE NOT NULL
	,DataNascimento DATE NOT NULL
	,Salario FLOAT NOT NULL
	,IdDepartamento INT FOREIGN KEY REFERENCES Departamentos(IdDepartamento)
	,IdCargo INT FOREIGN KEY REFERENCES Cargos(IdCargo)
	,IdUsuario INT FOREIGN KEY REFERENCES Usuarios (IdUsuario)
);
drop table Usuarios

CREATE TABLE Departamentos(
	IdDepartamento INT PRIMARY KEY IDENTITY NOT NULL
	,Nome VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Cargos(
	IdCargo INT PRIMARY KEY IDENTITY NOT NULL
	,Nome VARCHAR(255) UNIQUE NOT NULL
	,Ativo INT DEFAULT(1) NOT NULL
);
CREATE TABLE Permissao(
	IdPermissao INT PRIMARY KEY IDENTITY NOT NULL
	,Nome VARCHAR(255) NOT NULL
);

INSERT INTO Permissao(Nome) VALUES('Comum')

INSERT INTO Permissao(Nome) VALUES('Administrador')

INSERT INTO Departamentos(Nome) VALUES('Jurídico');

INSERT INTO Departamentos(Nome) VALUES('Tecnologia');

INSERT INTO Cargos(Nome) VALUES('Advogado Trabalhista')

INSERT INTO Cargos(Nome) VALUES('Product Owner')

INSERT INTO Usuarios(Email,Senha,IdPermissao) VALUES('bob@mail.com','123',1)

INSERT INTO Usuarios(Email,Senha,IdPermissao) VALUES('fernando@mail.com','321',2)

INSERT INTO Funcionarios(Nome,CPF,DataNascimento,Salario,IdDepartamento,IdCargo,IdUsuario) 
VALUES ('Bob','255.281.000-46','09/09/1980','1500',1,1,1)

INSERT INTO Funcionarios(Nome,CPF,DataNascimento,Salario,IdDepartamento,IdCargo,IdUsuario) 
VALUES ('Fernando','248.589.650-07','08/05/1974','1700',2,2,2)

SELECT * FROM Usuarios

SELECT * FROM Funcionarios

SELECT * FROM Permissao

SELECT * FROM Departamentos

SELECT * FROM Cargos

SELECT Funcionarios.Nome,Funcionarios.IdFuncionario,Funcionarios.CPF,Funcionarios.DataNascimento,Funcionarios.IdDepartamento,Funcionarios.IdCargo,Funcionarios.Salario,
Usuarios.IdUsuario,Usuarios.Email,Usuarios.Senha,Usuarios.IdPermissao,Departamentos.IdDepartamento,Departamentos.Nome,Cargos.IdCargo,Cargos.Nome,Cargos.Ativo,Permissao.IdPermissao,Permissao.Nome
FROM Funcionarios
JOIN Usuarios
ON Funcionarios.IdUsuario = Usuarios.IdUsuario
JOIN Departamentos
ON Funcionarios.IdDepartamento = Departamentos.IdDepartamento
JOIN Cargos
ON Funcionarios.IdCargo = Cargos.IdCargo
JOIN Permissao 
ON Usuarios.IdPermissao = Permissao.IdPermissao

ALTER TABLE Usuarios add Permissao VARCHAR(255)

INSERT INTO Usuarios(Permissao) VALUES('COMUM')

INSERT INTO Usuarios(Permissao) VALUES('ADMINISTRADOR')

update Usuarios set Permissao = 'COMUM' WHERE IdUsuario = 1


update Usuarios set Permissao = 'ADMINISTRADOR' WHERE IdUsuario = 2








