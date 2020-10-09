CREATE OR REPLACE FUNCTION ora_hash_clob(p_clob IN CLOB) RETURN NUMBER IS
    l_line         VARCHAR2(4000);
    l_ora_hash_key NUMBER;
    l_hash_code    NUMBER := 0;
BEGIN
    FOR i in 1 .. ceil(length(p_clob) / 4000)
        LOOP
            l_line := to_char(substr(p_clob, (i - 1) * 4000 + 1, 4000));
            SELECT ora_hash(l_line) INTO l_ora_hash_key FROM dual;
            l_hash_code := mod(31 * l_hash_code + l_ora_hash_key, 4294967295);
        END LOOP;
    RETURN l_hash_code;
END;
