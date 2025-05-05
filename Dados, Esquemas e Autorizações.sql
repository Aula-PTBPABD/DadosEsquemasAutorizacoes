/*Criando usuários*/
CREATE USER User_A WITH PASSWORD = 'SenhaForte@123';
CREATE USER User_B WITH PASSWORD = 'Senha@123';
CREATE USER User_C WITH PASSWORD = 'Senha@124';
CREATE USER User_D WITH PASSWORD = 'Senha@125';
CREATE USER User_E WITH PASSWORD = 'Senha@126';

/*Garantido privilégio total a todas as tabelas exceto CLASSROOM*/
GRANT ALL PRIVILEGES ON student TO User_A WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON instructor TO User_A WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON department TO User_A WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON course TO User_A WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON section TO User_A WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON takes TO User_A WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON teaches TO User_A WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON advisor TO User_A WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON prereq TO User_A WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON time_slot TO User_A WITH GRANT OPTION;

/*Listando privilégios do User_A*/
SELECT 
    dp.name AS Usuario, 
    o.name AS Objeto, 
    p.permission_name AS Permissao, 
    p.state_desc AS Estado
FROM 
    sys.database_permissions p
INNER JOIN 
    sys.objects o ON p.major_id = o.object_id
INNER JOIN 
    sys.database_principals dp ON p.grantee_principal_id = dp.principal_id
WHERE 
    dp.name = 'User_A';