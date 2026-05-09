-- =========================================
-- CRIAÇÃO DAS TABELAS
-- =========================================

-- Tabela de funcionários
CREATE TABLE funcionario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    supervisor_id INTEGER REFERENCES funcionario(id)
);

-- Tabela de dependentes
CREATE TABLE dependente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    funcionario_id INTEGER NOT NULL,
    CONSTRAINT fk_funcionario
        FOREIGN KEY (funcionario_id)
        REFERENCES funcionario(id)
        ON DELETE CASCADE
);

-- Tabela de projetos
CREATE TABLE projeto (
    id SERIAL PRIMARY KEY,
    nome_projeto VARCHAR(100) NOT NULL
);

-- Tabela de agregação
CREATE TABLE alocacao_equipamento (
    id SERIAL PRIMARY KEY,
    funcionario_id INTEGER,
    projeto_id INTEGER,
    nome_equipamento VARCHAR(100),

    FOREIGN KEY (funcionario_id)
        REFERENCES funcionario(id),

    FOREIGN KEY (projeto_id)
        REFERENCES projeto(id)
);

-- =========================================
-- INSERTS
-- =========================================

-- Funcionários
INSERT INTO funcionario (nome, supervisor_id)
VALUES
('Carlos', NULL),
('Ana', 1),
('João', 1);

-- Dependentes
INSERT INTO dependente (nome, funcionario_id)
VALUES
('Pedro', 2),
('Maria', 3);

-- Projetos
INSERT INTO projeto (nome_projeto)
VALUES
('Sistema Bancário'),
('Aplicativo Mobile');

-- Equipamentos
INSERT INTO alocacao_equipamento
(funcionario_id, projeto_id, nome_equipamento)
VALUES
(2, 1, 'Notebook Dell'),
(3, 2, 'Monitor LG');

-- =========================================
-- SELECTS
-- =========================================

-- Mostrar funcionários e seus supervisores
SELECT
    f.nome AS funcionario,
    s.nome AS supervisor
FROM funcionario f
LEFT JOIN funcionario s
ON f.supervisor_id = s.id;

-- Mostrar dependentes
SELECT
    d.nome AS dependente,
    f.nome AS funcionario
FROM dependente d
JOIN funcionario f
ON d.funcionario_id = f.id;

-- Mostrar agregação
SELECT
    f.nome AS funcionario,
    p.nome_projeto,
    a.nome_equipamento
FROM alocacao_equipamento a
JOIN funcionario f
ON a.funcionario_id = f.id
JOIN projeto p
ON a.projeto_id = p.id;

