-- Attribute Table
DROP TABLE dbo.TNtlAttribute;

CREATE TABLE dbo.TNtlAttribute(
    attribute_id INT IDENTITY(1, 1) not null,
    name VARCHAR(max),
    CONSTRAINT attribute_id_pk PRIMARY KEY(attribute_id)
);

-- Attribute Value Table
DROP TABLE dbo.TNtlAttributeValue;

CREATE TABLE dbo.TNtlAttributeValue(
    attribute_value_id INT IDENTITY(1, 1) not null,
    attribute_id INT,
    value VARCHAR(max),
    CONSTRAINT attribute_value_id_pk PRIMARY KEY(attribute_value_id)
);

-- UOM Table
DROP TABLE dbo.TNtlUom;

CREATE TABLE dbo.TNtlUom(
    uom_id INT IDENTITY(1, 1) not null,
    name VARCHAR(50),
    CONSTRAINT uom_id_pk PRIMARY KEY(uom_id)
);

-- Status Table
DROP TABLE dbo.TNtlStatus;

CREATE TABLE dbo.TNtlStatus(
    status_id INT IDENTITY(1, 1) not null,
    name VARCHAR(50),
    CONSTRAINT status_id_pk PRIMARY KEY(status_id)
);