DROP TABLE dbo.tblMovie;

CREATE TABLE dbo.tblMovie(
    id INT IDENTITY(1, 1),
    name VARCHAR(MAX),
    CONSTRAINT movie_id_pk PRIMARY KEY (id)  
);

-- Delete All
DELETE FROM dbo.tblMovie;

-- Reset All Identity
EXEC sp_MSForEachTable '
IF OBJECTPROPERTY(object_id(''?''), ''TableHasIdentity'') = 1
DBCC CHECKIDENT (''?'', RESEED, 0)';

