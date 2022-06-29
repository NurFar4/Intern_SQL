CREATE TABLE tblMovie(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR,
    CONSTRAINT id_pk PRIMARY KEY(id)  
);

-- Insert Function
CREATE OR REPLACE FUNCTION NSP_tblMovie_Insert (_name VARCHAR)     
    RETURNS INT   
    LANGUAGE plpgsql  
AS $$   
BEGIN
    INSERT INTO tblMovie(name)
    VALUES(_name);
RETURN 1;
END;
$$;

-- Update Function
CREATE OR REPLACE FUNCTION NSP_tblMovie_Update (_id INT, _name VARCHAR)     
    RETURNS INT   
    LANGUAGE plpgsql  
AS $$
BEGIN
    UPDATE tblMovie
    SET name = _name
    WHERE 1=1
    AND id = _id;
RETURN 1;
END;
$$;

-- Delete Function
CREATE OR REPLACE FUNCTION NSP_tblMovie_Delete (_id INT)     
    RETURNS INT   
    LANGUAGE plpgsql  
AS $$   
BEGIN
    DELETE FROM tblMovie
    WHERE 1=1
    AND id = _id;
RETURN 1;
END;
$$;

-- Function For Displaying Changes
CREATE OR REPLACE FUNCTION "NotifyOnDataChangeForTblMovie"()
  RETURNS trigger
  LANGUAGE 'plpgsql'
AS $$ 
DECLARE 
  data JSON;
  notification JSON;
BEGIN
  -- if we delete, then pass the old data
  -- if we insert or update, pass the new data
  IF (TG_OP = 'DELETE') THEN
    data = row_to_json(OLD);
  ELSE
    data = row_to_json(NEW);
  END IF;

  -- create json payload
  -- note that here can be done projection 
  notification = json_build_object(
            'table',TG_TABLE_NAME,
            'action', TG_OP, -- can have value of INSERT, UPDATE, DELETE
            'data', data);  
            
    -- note that channel name MUST be lowercase, otherwise pg_notify() won't work
    PERFORM pg_notify('tblmoviedatachange', notification::TEXT);
  RETURN NEW;
END
$$;

-- Trigger
CREATE TRIGGER "OnDataChangeForTblMovie"
  AFTER INSERT OR DELETE OR UPDATE 
  ON tblMovie
  FOR EACH ROW
  EXECUTE PROCEDURE "NotifyOnDataChangeForTblMovie"();

-- Delete All Data
DELETE FROM tblMovie;

-- Reset To 1
ALTER SEQUENCE tblMovie_id_seq RESTART WITH 1;

CREATE OR REPLACE FUNCTION "NotifyOnDataChangeForTblSaleOrder"()
  RETURNS trigger
  LANGUAGE 'plpgsql'
AS $$ 
DECLARE 
  data JSON;
  notification JSON;
BEGIN
  -- if we delete, then pass the old data
  -- if we insert or update, pass the new data
  IF (TG_OP = 'DELETE') THEN
    data = row_to_json(OLD);
  ELSE
    data = row_to_json(NEW);
  END IF;

  -- create json payload
  -- note that here can be done projection 
  notification = json_build_object(
            'table',TG_TABLE_NAME,
            'action', TG_OP, -- can have value of INSERT, UPDATE, DELETE
            'data', data);  
            
    -- note that channel name MUST be lowercase, otherwise pg_notify() won't work
    PERFORM pg_notify('tblsaleorderdatachange', notification::TEXT);
  RETURN NEW;
END
$$;

CREATE TRIGGER "OnDataChangeForTblSaleOrder"
  AFTER INSERT OR DELETE OR UPDATE 
  ON sale_order
  FOR EACH ROW
  EXECUTE PROCEDURE "NotifyOnDataChangeForTblSaleOrder"();

