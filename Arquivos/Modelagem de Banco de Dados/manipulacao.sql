UPDATE TAREFA 
SET status_kanban = 'Done' 
WHERE id_tarefa = 1;

UPDATE HARDWARE 
SET estado_fisico = 'Usado' 
WHERE id_hardware = 3; -- Era 'Danificado'

UPDATE PROJETO 
SET prazo_final = '2024-07-15' 
WHERE nome_projeto = 'Treinamento VR Embraer';

DELETE FROM TAREFA 
WHERE id_tarefa = 3 AND status_kanban = 'To Do';

DELETE FROM LICENCA_ATRIBUICAO 
WHERE id_colaborador = 2 AND id_licenca = 2;

DELETE FROM PROJETO 
WHERE id_projeto = 3; 