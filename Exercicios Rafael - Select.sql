-- 1. Listar todos os jogos com seus desenvolvedores e gêneros.
select * from jogos;

-- 2. Contar quantos usuários existem no sistema.
select * from usuarios;

-- 3. Listar todas as transmissões, incluindo o nome do usuário que as fez.
SELECT transmissoes.data_transmissao, 
usuarios.nome FROM transmissoes
INNER JOIN usuarios ON
transmissoes.id = usuarios.id;

-- 4. Encontrar a média de visualizações por transmissão.
SELECT avg(visualizacoes) AS media_visualizacoes
from transmissoes;	

-- 5. Listar todos os comentários feitos em transmissões específicas, incluindo o nome do jogo.
SELECT c.comentario, j.titulo
FROM comentarios as c 
INNER JOIN transmissoes as t ON
c.transmissao_id = t.id
INNER JOIN jogos as j ON
t.jogo_id = j.id;
 
-- 6. Listar jogos com mais de 500 visualizações em suas transmissões
SELECT jogos.titulo, transmissoes.visualizacoes
FROM jogos
INNER JOIN transmissoes ON
jogos.id = transmissoes.id
WHERE transmissoes.visualizacoes > 500;
	
-- 7. Listar usuários e o número de transmissões que fizeram.
SELECT 
    u.nome AS nome_usuario, 
    COUNT(t.id) AS quantidade_transmissoes
FROM 
    usuarios u
LEFT JOIN 
    transmissoes t ON u.id = t.usuario_id
GROUP BY 
    u.id, u.nome;

-- 8. Encontrar todos os comentários de um usuário específico.
SELECT 
    c.comentario AS comentario, 
    t.id AS id_transmissao
FROM 
    comentarios c
JOIN 
    transmissoes t ON c.transmissao_id = t.id
WHERE 
    c.usuario_id = 1;

-- 9. Listar todos os jogos e suas respectivas transmissões.
SELECT 
    j.titulo AS titulo_jogo, 
    t.id AS transmissao_id
FROM 
    jogos j
LEFT JOIN 
    transmissoes t ON j.id = t.jogo_id;

-- 10. Listar jogos e a quantidade de comentários feitos em cada um.
SELECT 
    j.titulo AS titulo_jogo, 
    COUNT(c.id) AS quantidade_comentarios
FROM 
    jogos j
LEFT JOIN 
    transmissoes t ON j.id = t.jogo_id
LEFT JOIN 
    comentarios c ON t.id = c.transmissao_id
GROUP BY 
    j.id, j.titulo;

-- 11. Listar todos os comentários junto com o nome do usuário que os fez e o título da transmissão relacionada.
SELECT 
    c.comentario AS comentario, 
    u.nome AS nome_usuario, 
    t.id AS id_transmissao
FROM 
    comentarios c
JOIN 
    transmissoes t ON c.transmissao_id = t.id
JOIN 
    usuarios u ON c.usuario_id = u.id;

-- 12. Encontrar todos os usuários e suas transmissões, incluindo a data da transmissão.
SELECT 
    u.nome AS nome_usuario, 
    t.id AS id_transmissao, 
    t.data_transmissao
FROM 
    usuarios u
LEFT JOIN 
    comentarios c ON u.id = c.usuario_id
LEFT JOIN 
    transmissoes t ON c.transmissao_id = t.id;

-- 13. Listar todos os jogos e suas respectivas transmissões, mostrando também o número de visualizações.
SELECT 
    j.nome AS nome_jogo, 
    t.titulo AS titulo_transmissao, 
    t.visualizacoes
FROM 
    jogos j
LEFT JOIN 
    transmissoes t ON j.id = t.jogo_id;

-- 14. Encontrar todos os jogos e os comentários feitos sobre eles, incluindo o nome do usuário que fez o comentário.
SELECT 
    j.titulo AS titulo_jogo, 
    c.comentario AS comentario, 
    u.nome AS nome_usuario
FROM 
    jogos j
LEFT JOIN 
    transmissoes t ON j.id = t.jogo_id
LEFT JOIN 
    comentarios c ON t.id = c.transmissao_id
LEFT JOIN 
    usuarios u ON c.usuario_id = u.id;

-- 15. Listar os jogos, suas transmissões e o número de comentários feitos em cada transmissão.
SELECT 
    j.titulo AS nome_jogo, 
    t.id AS id_transmissao, 
    COUNT(c.id) AS quantidade_comentarios
FROM 
    jogos j
LEFT JOIN 
    transmissoes t ON j.id = t.jogo_id
LEFT JOIN 
    comentarios c ON t.id = c.transmissao_id
GROUP BY 
    j.id, j.titulo, t.id, t.id;
