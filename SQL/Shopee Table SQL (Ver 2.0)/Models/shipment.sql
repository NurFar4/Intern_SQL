-- Shipment Table
DROP TABLE dbo.TShopeeShipment;

CREATE TABLE dbo.TShopeeShipment(
    shipment_id INT IDENTITY(1, 1) not null,
    start_location VARCHAR(max),
    destination VARCHAR(max),
    tracking_id VARCHAR(20),
    created_date DATETIME,
    expected_date DATETIME,
    due_date DATETIME,
    invoice_id INT,
    carrier_id INT,
    shipment_status VARCHAR(20),
    detail_id INT,
    CONSTRAINT shipment_id_pk PRIMARY KEY (shipment_id)
);

-- Carrier Table
DROP TABLE dbo.TShopeeCarrier;

CREATE TABLE dbo.TShopeeCarrier(
    carrier_id INT IDENTITY(1, 1) not null,
    name VARCHAR(20),
    detail_id INT,
    CONSTRAINT carrier_id_pk PRIMARY KEY(carrier_id)
);

-- Shipment Status Table
DROP TABLE dbo.TShopeeShipmentStatus;

CREATE TABLE dbo.TShopeeShipmentStatus(
    shipment_status_id INT IDENTITY(1, 1) not null,
    name VARCHAR(20),
    detail_id INT,
    CONSTRAINT shipment_status_id_pk PRIMARY KEY(shipment_status_id)
);