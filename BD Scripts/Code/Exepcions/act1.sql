-- 1

CREATE OR REPLACE FUNCTION func_comprovar_dep(dep_id departments.department_id%TYPE) RETURNS BOOLEAN language plpgsql as $$
DECLARE
    var_depid departments.department_id%TYPE;
BEGIN
    SELECT department_id
    INTO STRICT var_depid
    FROM departments
    WHERE department_id = dep_id;
        RETURN TRUE;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE EXCEPTION 'ERROR: no dades';
    WHEN TOO_MANY_ROWS THEN
        RAISE EXCEPTION 'ERROR: retorna mes files';
    WHEN OTHERS THEN
        RAISE EXCEPTION 'ERROR GENERAL';
END;$$;

CREATE OR REPLACE FUNCTION func_comprovar_A(dep_name departments.department_name%TYPE) RETURNS BOOLEAN language plpgsql as $$
BEGIN
    IF (dep_name ILIKE 'A%') THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;$$;

DO $$
DECLARE
    var_depId DEPARTMENTS.DEPARTMENT_ID%TYPE := :vdepId;
    var_depName departments.department_name%type;
BEGIN
    IF (func_comprovar_dep(var_depId)) THEN
        RAISE NOTICE 'EL department existeix';
    ELSE
        RAISE NOTICE 'EL department no existeix';
    end if;

    SELECT department_name
    INTO var_depName
    FROM departments
        WHERE department_id = var_depId;

    IF (func_comprovar_A(var_depName)) THEN
        RAISE NOTICE 'EL department comença amb A';
    ELSE
        RAISE NOTICE 'EL department no comença amb A';
    end if;
END;$$ language plpgsql;


-- 2

CREATE OR REPLACE PROCEDURE proc_loc_address(user_location_id locations.location_id%TYPE, new_street_address locations.street_address%TYPE) language plpgsql AS $$
BEGIN
    UPDATE locations
    SET street_address = new_street_address
    WHERE location_id = user_location_id;
END; $$;

CREATE OR REPLACE FUNCTION func_comprovar_loc(user_location_id locations.location_id%TYPE) RETURNS BOOLEAN language plpgsql AS $$
DECLARE
    var_locId locations.location_id%TYPE;
BEGIN
    SELECT location_id
    INTO STRICT var_locId
    FROM locations
    WHERE location_id = user_location_id;
        RETURN TRUE;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE EXCEPTION 'ERROR: no dades';
    WHEN OTHERS THEN
        RAISE EXCEPTION 'ERROR GENERAL';
END;$$;

DO $$
DECLARE
    var_locId locations.location_id%TYPE := :vdepId;
    var_street_address locations.street_address%TYPE := :vdepAddress;
BEGIN
    IF (func_comprovar_loc(var_locId)) THEN
        CALL proc_loc_address(var_locId,var_street_address);
    ELSE
        RAISE NOTICE 'EL location id no existeix';
    end if;

END;$$ language plpgsql;