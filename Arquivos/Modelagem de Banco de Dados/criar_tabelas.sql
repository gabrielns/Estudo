CREATE DATABASE IF NOT EXISTS xr_manager;
USE xr_manager;

CREATE TABLE COLABORADOR (
    id_colaborador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    email_corporativo VARCHAR(100) NOT NULL UNIQUE,
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE PROJETO (
    id_projeto INT AUTO_INCREMENT PRIMARY KEY,
    nome_projeto VARCHAR(100) NOT NULL,
    nome_cliente VARCHAR(100) NOT NULL,
    data_inicio DATE NOT NULL,
    prazo_final DATE NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('Em Andamento', 'Pausado', 'Concluido', 'Cancelado'))
);

CREATE TABLE HARDWARE (
    id_hardware INT AUTO_INCREMENT PRIMARY KEY,
    serial_number VARCHAR(50) NOT NULL UNIQUE,
    modelo VARCHAR(50) NOT NULL,
    fabricante VARCHAR(50) NOT NULL,
    estado_fisico VARCHAR(20) NOT NULL CHECK (estado_fisico IN ('Novo', 'Usado', 'Danificado', 'Manutencao')),
    data_compra DATE
);

CREATE TABLE LICENCA (
    id_licenca INT AUTO_INCREMENT PRIMARY KEY,
    nome_software VARCHAR(50) NOT NULL,
    chave_produto VARCHAR(100) NOT NULL,
    fornecedor VARCHAR(50) NOT NULL,
    data_expiracao DATE NOT NULL,
    quantidade_assentos INT NOT NULL
);

CREATE TABLE TAREFA (
    id_tarefa INT AUTO_INCREMENT PRIMARY KEY,
    id_projeto INT NOT NULL,
    id_colaborador INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    prioridade VARCHAR(20) DEFAULT 'Media',
    status_kanban VARCHAR(20) DEFAULT 'To Do',
    FOREIGN KEY (id_projeto) REFERENCES PROJETO(id_projeto),
    FOREIGN KEY (id_colaborador) REFERENCES COLABORADOR(id_colaborador)
);

CREATE TABLE MOVIMENTACAO (
    id_movimentacao INT AUTO_INCREMENT PRIMARY KEY,
    id_hardware INT NOT NULL,
    id_colaborador INT NOT NULL,
    id_projeto INT, -- Pode ser NULL se for uso para estudo
    data_retirada DATETIME NOT NULL,
    data_devolucao_prevista DATETIME NOT NULL,
    data_devolucao_real DATETIME,
    FOREIGN KEY (id_hardware) REFERENCES HARDWARE(id_hardware),
    FOREIGN KEY (id_colaborador) REFERENCES COLABORADOR(id_colaborador),
    FOREIGN KEY (id_projeto) REFERENCES PROJETO(id_projeto)
);

CREATE TABLE LICENCA_ATRIBUICAO (
    id_atribuicao INT AUTO_INCREMENT PRIMARY KEY,
    id_licenca INT NOT NULL,
    id_colaborador INT NOT NULL,
    data_vinculo DATE NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_licenca) REFERENCES LICENCA(id_licenca),
    FOREIGN KEY (id_colaborador) REFERENCES COLABORADOR(id_colaborador)
);

CREATE TABLE MANUTENCAO (
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    id_hardware INT NOT NULL,
    descricao_defeito TEXT NOT NULL,
    acao_realizada TEXT,
    custo_reparo DECIMAL(10, 2) NOT NULL,
    data_entrada DATE NOT NULL,
    data_saida DATE,
    FOREIGN KEY (id_hardware) REFERENCES HARDWARE(id_hardware)
);