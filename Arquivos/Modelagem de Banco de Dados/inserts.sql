INSERT INTO COLABORADOR (nome, cargo, email_corporativo, ativo) VALUES 
('João Silva', 'Desenvolvedor Unity', 'joao.silva@xrstudio.com', TRUE),
('Maria Souza', 'Artista 3D', 'maria.souza@xrstudio.com', TRUE),
('Carlos Mendez', 'QA Tester', 'carlos.mendez@xrstudio.com', TRUE),
('Ana Pereira', 'Gerente de Projetos', 'ana.pereira@xrstudio.com', TRUE);

INSERT INTO PROJETO (nome_projeto, nome_cliente, data_inicio, prazo_final, status) VALUES 
('Treinamento VR Embraer', 'Embraer', '2024-01-10', '2024-06-30', 'Em Andamento'),
('Museu AR Interativo', 'MASP', '2024-02-15', '2024-05-20', 'Pausado'),
('Simulador de Voo Lite', 'AeroClub', '2023-11-01', '2024-01-15', 'Concluido');

INSERT INTO HARDWARE (serial_number, modelo, fabricante, estado_fisico, data_compra) VALUES 
('META-Q3-001', 'Quest 3', 'Meta', 'Novo', '2024-01-05'),
('META-Q3-002', 'Quest 3', 'Meta', 'Usado', '2024-01-05'),
('MS-HL2-999', 'HoloLens 2', 'Microsoft', 'Danificado', '2023-05-10'),
('APP-VP-777', 'Vision Pro', 'Apple', 'Novo', '2024-03-01');

INSERT INTO LICENCA (nome_software, chave_produto, fornecedor, data_expiracao, quantidade_assentos) VALUES 
('Unity Pro', 'U-2024-KEY-X99', 'Unity Technologies', '2025-01-01', 5),
('Autodesk Maya', 'M-888-777-666', 'Autodesk', '2024-12-31', 2);

INSERT INTO TAREFA (id_projeto, id_colaborador, titulo, descricao, prioridade, status_kanban) VALUES 
(1, 1, 'Criar script de movimentação', 'Implementar locomotion system sem teleporte', 'Alta', 'Doing'),
(1, 2, 'Modelar cockpit do avião', 'Low poly para performance mobile', 'Media', 'Done'),
(2, 1, 'Configurar AR Foundation', 'Setup inicial do projeto Unity', 'Alta', 'To Do'),
(3, 3, 'Testar colisão nas nuvens', 'Verificar bugs de física', 'Baixa', 'Done');

INSERT INTO MOVIMENTACAO (id_hardware, id_colaborador, id_projeto, data_retirada, data_devolucao_prevista) VALUES 
(1, 1, 1, '2024-04-01 09:00:00', '2024-04-01 18:00:00'), -- João pegou o Quest 3
(4, 2, 2, '2024-04-02 10:00:00', '2024-04-05 18:00:00'); -- Maria pegou o Vision Pro

INSERT INTO LICENCA_ATRIBUICAO (id_licenca, id_colaborador, data_vinculo) VALUES 
(1, 1, '2024-01-10'), -- João usa Unity
(2, 2, '2024-01-10'); -- Maria usa Maya

INSERT INTO MANUTENCAO (id_hardware, descricao_defeito, custo_reparo, data_entrada) VALUES 
(3, 'Lente trincada e display piscando', 1500.00, '2024-03-20');