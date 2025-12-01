
SELECT modelo, serial_number, estado_fisico 
FROM HARDWARE 
WHERE fabricante = 'Meta' AND estado_fisico = 'Novo'
ORDER BY modelo;

SELECT 
    P.nome_projeto,
    T.titulo AS tarefa,
    T.status_kanban,
    C.nome AS responsavel
FROM TAREFA T
INNER JOIN PROJETO P ON T.id_projeto = P.id_projeto
INNER JOIN COLABORADOR C ON T.id_colaborador = C.id_colaborador
WHERE T.status_kanban = 'Doing';

SELECT 
    H.modelo,
    C.nome AS retirado_por,
    M.data_retirada
FROM MOVIMENTACAO M
JOIN HARDWARE H ON M.id_hardware = H.id_hardware
JOIN COLABORADOR C ON M.id_colaborador = C.id_colaborador
WHERE M.data_retirada BETWEEN '2024-04-01' AND '2024-04-30';

SELECT C.nome, COUNT(T.id_tarefa) AS total_tarefas
FROM COLABORADOR C
LEFT JOIN TAREFA T ON C.id_colaborador = T.id_colaborador
GROUP BY C.nome;