-- Criar procedure Insere_projeto
CREATE OR REPLACE PROCEDURE brh.insere_projeto(
p_ID IN INTEGER,
p_NOME_DO_PROJETO IN VARCHAR2, 
p_RESPONSAVEL IN BRH.COLABORADOR.MATRICULA%type,
p_INICIO IN DATE,
p_FIM IN DATE
)
IS
BEGIN
    CREATE TABLE BRH.PROJETO(p_ID, p_NOME_DO_PROJETO, p_RESPONSAVEL, p_INICIO, p_FIM);
END;



-- Criar funcao calcula_idade
VARIABLE g_IDADE INTEGER(3);
CREATE OR REPLACE FUNCTION calcula_idade
    (p_DATA IN DATE)
RETURN
    v_IDADE INTEGER
IS
BEGIN
    g_idade := SELECT MONTHS_BETWEEN(SYSDATE, p_DATA)/12;
    RETURN g_idade;
END;



-- Criar funcao finaliza_projeto
CREATE OR REPLACE FUNCTION finaliza_projeto(
    p_ID IN BRH.PROJETO.ID%type,
    p_DATA_FINALIZACAO IN BRH.PROJETO.FIM%type
    )
RETURN
    p_DATA_FINALIZACAO DATE
IS
BEGIN
    UPDATE BRH.PROJETO SET FIM := SYSDATE WHERE ID := p_ID
END;



-- Validar novo projeto
CREATE OR REPLACE PROCEDURE brh.insere_projeto(
p_ID IN INTEGER,
p_NOME_DO_PROJETO IN VARCHAR2, 
p_RESPONSAVEL IN BRH.COLABORADOR.MATRICULA%type,
p_INICIO IN DATE,
p_FIM IN DATE
)
IS
BEGIN
    IF LENGTH(p_NOME_DO_PROJETO) > 2 THEN
        CREATE TABLE BRH.PROJETO(p_ID, p_NOME_DO_PROJETO, p_RESPONSAVEL, p_INICIO, p_FIM);
    ELSE
        dbms_output.put_line('Nome de projeto inv�lido! Deve ter dois ou mais caracteres.');
    END IF;
END;



-- Validar calculo de idade
VARIABLE g_IDADE INTEGER(3);
CREATE OR REPLACE FUNCTION calcula_idade
    (p_DATA IN DATE)
RETURN
    v_IDADE INTEGER
IS
BEGIN
    IF g_idade < SYSDATE THEN
        g_idade := SELECT MONTHS_BETWEEN(SYSDATE, p_DATA)/12;
        RETURN g_idade;
    ELSE
      dbms_output.put_line('Imposs�vel calcular idade! Data inv�lida: ' || g_idade);
    END IF;  
END;
