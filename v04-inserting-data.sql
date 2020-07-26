


/***** CASH DATA INSERTION *****/ 
/* 1. Loading CashTypes*/

INSERT INTO dd.CashTypes
(ID, CashTypes, IsDeleted, CreatedAt, CreatedBy)
VALUES
('50c221da-fe2c-4184-b31e-c994179f4792', 'Lost: Operating', 0, '2020/07/22 00:00', 'lnapoli'),
('afa3652f-85a4-454e-b7a8-487e19d8d84c', 'Profit: Operating', 0, '2020/07/22 00:00', 'lnapoli'),
('bf793903-b846-4cda-beba-1d5abd730515', 'Lost: Net', 0, '2020/07/22 00:00', 'lnapoli'),
('09805c67-e280-4dc8-b0ca-a5a58ca3b762', 'Profit: Net', 0, '2020/07/22 00:00', 'lnapoli');

SELECT * FROM dd.CashTypes;

--DELETE FROM dd.CashTypes;


/* 2. Loading Cash*/
INSERT INTO dd.Cash
(ID)
VALUES
('4567ff83-1b1f-4148-8ee9-3badd569a15c'),
('35ec2866-4cdc-4c23-899f-6adb531db8b2'),
('212b93e6-935d-414a-bd9e-b9f642b01ec1');

SELECT * FROM dd.Cash;

--DELETE FROM dd.Cash;


/* 3. Loading CashTransactions*/

INSERT INTO dd.CashTransactions
(ID, CashValue, ToCashTypeID, ToCashID, IsDeleted, CreatedAt, CreatedBy)
VALUES
('0b84776a-15e0-4eab-be80-5ba6bda4b849', 100, '50c221da-fe2c-4184-b31e-c994179f4792','4567ff83-1b1f-4148-8ee9-3badd569a15c' ,0, '2020/07/22 00:00', 'lnapoli'),
('3bd1604e-f539-450d-a22c-a380a543c693', 30, 'bf793903-b846-4cda-beba-1d5abd730515', '4567ff83-1b1f-4148-8ee9-3badd569a15c',0, '2020/07/22 00:00', 'lnapoli'),
('57db0e25-ed3f-451e-aad4-1e5d3dc43482', 50, 'afa3652f-85a4-454e-b7a8-487e19d8d84c', '35ec2866-4cdc-4c23-899f-6adb531db8b2',0, '2020/07/22 00:00', 'lnapoli'),
('357b5dcb-931c-418e-af2b-cf523daa0d9a', 10, '09805c67-e280-4dc8-b0ca-a5a58ca3b762', '35ec2866-4cdc-4c23-899f-6adb531db8b2',0, '2020/07/22 00:00', 'lnapoli'),
('76f01213-c4aa-45e1-a0b3-ffc56b2b7fab', 80, 'afa3652f-85a4-454e-b7a8-487e19d8d84c', '212b93e6-935d-414a-bd9e-b9f642b01ec1',0, '2020/07/22 00:00', 'lnapoli'),
('ef2a2d05-081d-4753-a2eb-89f25846b99e', 5, 'bf793903-b846-4cda-beba-1d5abd730515', '212b93e6-935d-414a-bd9e-b9f642b01ec1',0, '2020/07/22 00:00', 'lnapoli');

SELECT * FROM dd.CashTransactions;

--DELETE FROM dd.CashTransactions;


/***** STOCK DATA INSERTION *****/ 
/* 4. Loading Sector*/

INSERT INTO dd.Sector
(ID, Sector, IsDeleted, CreatedAt, CreatedBy)
VALUES
('ffc9b931-089c-4d0f-bde0-745b37950299', 'BIOTECH', 0, '2020/07/22 00:00', 'lnapoli'),
('f8b44438-88a9-4f21-bc41-bb3c5d486672', 'ENERGY', 0, '2020/07/22 00:00', 'lnapoli'),
('9d10b660-ac21-4ef9-99ec-999f1e607e52', 'OIL', 0, '2020/07/22 00:00', 'lnapoli');


SELECT * FROM dd.Sector;

--DELETE FROM dd.Sector;


/* 5. Loading Stock*/
INSERT INTO dd.Stocks
(ID, Ticker, CompanyName, Market, ToSectorID, IsDeleted, CreatedAt, CreatedBy)
VALUES
('273e752d-f9b1-44b4-8228-4babad54ba78', 'PECK', 'Peck Company', 'NASDAQ', 'f8b44438-88a9-4f21-bc41-bb3c5d486672', 0, '2020/07/22 00:00', 'lnapoli'),
('3e82575f-edf0-48c3-a59d-83f08bc5a338', 'TROV', 'Cardiff Oncology', 'NASDAQ', 'ffc9b931-089c-4d0f-bde0-745b37950299', 0, '2020/07/22 00:00', 'lnapoli'),
('926d3d7e-215f-4474-9022-5f6bca3a4841', 'SAEX', 'SA Exploration', 'OTCMKTS', '9d10b660-ac21-4ef9-99ec-999f1e607e52', 0, '2020/07/22 00:00', 'lnapoli');


SELECT * FROM dd.Stocks;

--DELETE FROM dd.Stocks;




/***** CATALIZER INSERTION *****/ 
/* 5. Loading Catalizer Types*/

INSERT INTO dd.CatalizerType
(ID, CatalizerTypes, IsDeleted, CreatedAt, CreatedBy)
VALUES
('6889435c-de45-4553-8d3f-868dff4795fc', 'Positive Results', 0, '2020/07/22 00:00', 'lnapoli'),
('514c9e98-62c9-4024-8647-47e141c9b870', 'New Contract', 0, '2020/07/22 00:00', 'lnapoli'),
('17a178b2-7265-4011-8c98-c2c9f794bc5e', 'Partnership', 0, '2020/07/22 00:00', 'lnapoli');

SELECT * FROM dd.CatalizerType;

--DELETE FROM dd.CatalizerType;


INSERT INTO dd.CatalizerTransactions
(ID, CatalizerValue, ToCatalizerTypeID, IsDeleted, CreatedAt, CreatedBy)
VALUES
('86933c9d-8d2d-45a9-8345-e060236874b6', 100, '6889435c-de45-4553-8d3f-868dff4795fc', 0, '2020/07/22 00:00', 'lnapoli'),
('c3a752e6-3c1c-4f7e-80cc-d54ca60e67f1', 20, '514c9e98-62c9-4024-8647-47e141c9b870', 0, '2020/07/22 00:00', 'lnapoli'),
('bbce7773-2223-457b-a5e8-777717f95422', 30, '17a178b2-7265-4011-8c98-c2c9f794bc5e', 0, '2020/07/22 00:00', 'lnapoli');

SELECT * FROM dd.CatalizerTransactions;

--DELETE FROM dd.CatalizerTransactions;


/***** HISTORYCHART DATA INSERTION *****/ 
/* 1. Loading HistoryChartTypes*/

INSERT INTO dd.HistoryChartTypes
(ID, HistoryChartTypes, IsDeleted, CreatedAt, CreatedBy)
VALUES
('f557589a-48c5-47d2-a0ee-2c4e0324246b', 'Choppy', 0, '2020/07/22 00:00', 'lnapoli'),
('845db9ff-85ed-46d7-a27a-728a6a537d24', 'Downtrending', 0, '2020/07/22 00:00', 'lnapoli'),
('755afd28-8370-492a-8034-49fe6f553ac1', 'Support no-runs', 0, '2020/07/22 00:00', 'lnapoli'),
('9bdde4ef-71f1-42ce-a070-4064128f1289', 'Former Runner', 0, '2020/07/22 00:00', 'lnapoli'),
('69ebb752-c281-4314-8f83-99988483ff64', 'No Volatility', 0, '2020/07/22 00:00', 'lnapoli');


SELECT * FROM dd.HistoryChartTypes;

--DELETE FROM dd.HistoryChartTypes;


/* 2. Loading HistoryChart*/
INSERT INTO dd.HistoryChart
(ID)
VALUES
('e15de8ff-7e0c-470e-98b5-ae4007e41188'),
('cec72808-e7aa-48c1-9d58-e45e657aaa5a'),
('e71b9abd-cb65-46a0-91a0-ba583b7c5ad4');

SELECT * FROM dd.HistoryChart;

--DELETE FROM dd.HistoryChart;


/* 3. Loading dd.HistoryChartTransactions*/

INSERT INTO dd.HistoryChartTransactions
(ID, HistoryChartTransactionsValue, ToHistoryChartTypeID, ToHistoryChartID, IsDeleted, CreatedAt, CreatedBy)
VALUES
('7f96b430-116c-4b21-ba49-96a61004071a', 20, 'f557589a-48c5-47d2-a0ee-2c4e0324246b', 'e15de8ff-7e0c-470e-98b5-ae4007e41188', 0, '2020/07/22 00:00', 'lnapoli'),
('aa69df41-7a6f-4c93-8f17-3c86c196110a', 2, '845db9ff-85ed-46d7-a27a-728a6a537d24', 'e15de8ff-7e0c-470e-98b5-ae4007e41188', 0, '2020/07/22 00:00', 'lnapoli'),
('30a2b259-20d3-4582-9e2f-5b7cb1af4478', 3, '755afd28-8370-492a-8034-49fe6f553ac1', 'cec72808-e7aa-48c1-9d58-e45e657aaa5a', 0, '2020/07/22 00:00', 'lnapoli'),
('ed8d7e3f-c509-42cc-a765-89ec3b06f8c6', 5, '845db9ff-85ed-46d7-a27a-728a6a537d24', 'cec72808-e7aa-48c1-9d58-e45e657aaa5a', 0, '2020/07/22 00:00', 'lnapoli'),
('8622b49a-046a-4c01-ba7c-f304dbbb5d58', 2, '9bdde4ef-71f1-42ce-a070-4064128f1289', 'e71b9abd-cb65-46a0-91a0-ba583b7c5ad4', 0, '2020/07/22 00:00', 'lnapoli'),
('fba4d1cc-bad9-4681-834b-71ff39aa826d', 1, '69ebb752-c281-4314-8f83-99988483ff64', 'e71b9abd-cb65-46a0-91a0-ba583b7c5ad4', 0, '2020/07/22 00:00', 'lnapoli');

SELECT * FROM dd.CashTransactions;

--DELETE FROM dd.CashTransactions;


/***** VOLUME DATA INSERTION *****/ 
/* 1. Loading VolumeTypes*/

INSERT INTO dd.VolumeTypes
(ID, ToVolumeTypes, IsDeleted, CreatedAt, CreatedBy)
VALUES
('2abd0d0e-b3da-488b-a329-35272ee419cd', 'Pick', 0, '2020/07/22 00:00', 'lnapoli'),
('84ae8203-de56-43a5-9290-c351e1bae091', 'Stady', 0, '2020/07/22 00:00', 'lnapoli'),
('e15b1333-68cf-4d97-9358-9a112054ebd2', 'Down', 0, '2020/07/22 00:00', 'lnapoli'),
('40457d2c-f5e2-4142-b48b-e3017974032a', 'NewLevel', 0, '2020/07/22 00:00', 'lnapoli'),
('e1ad17a8-e60b-4a4e-a4fa-15f291b11ca3', 'Step Growth', 0, '2020/07/22 00:00', 'lnapoli'),
('b5dd16b2-7eea-40bd-9138-49118f1ce338', 'Step Down', 0, '2020/07/22 00:00', 'lnapoli');

SELECT * FROM dd.VolumeTypes;

--DELETE FROM dd.VolumeTypes;


/* 2. Loading Volume*/
INSERT INTO dd.Volume
(ID)
VALUES
('8f371c82-0a9a-40c7-ad72-92bee33ef86e'),
('0f1be280-054a-4336-929d-d915e2b2259b'),
('aebb3a67-4c47-4508-9aab-f8da0994a22f');

SELECT * FROM dd.Volume;

--DELETE FROM dd.Volume;


/* 3. Loading dd.VolumeTransactions*/

INSERT INTO pagnone.dd.VolumeTransactions
(ID, VolumeValue, ToVolumeTypesID, ToVolumeID, IsDeleted, CreatedAt, CreatedBy)
VALUES
('517a0292-e3ca-4bbe-b35b-22ef23ce79d5', 50, '2abd0d0e-b3da-488b-a329-35272ee419cd', '8f371c82-0a9a-40c7-ad72-92bee33ef86e', 0, '2020/07/22 00:00', 'lnapoli'),
('0a4bdd03-176e-4e47-ad9f-e7d1ce7cce1c', 0, '84ae8203-de56-43a5-9290-c351e1bae091', '8f371c82-0a9a-40c7-ad72-92bee33ef86e', 0, '2020/07/22 00:00', 'lnapoli'),
('c6862d13-10cc-46cd-9542-e4f8a76a43fb', 80, '2abd0d0e-b3da-488b-a329-35272ee419cd', '0f1be280-054a-4336-929d-d915e2b2259b', 0, '2020/07/22 00:00', 'lnapoli'),
('d2b5185d-d3b4-46f1-a5c6-3e9569957afb', 0, '84ae8203-de56-43a5-9290-c351e1bae091', '0f1be280-054a-4336-929d-d915e2b2259b', 0, '2020/07/22 00:00', 'lnapoli'),
('5cba048d-a6d7-4343-8814-dab81a460b11', 5, 'e1ad17a8-e60b-4a4e-a4fa-15f291b11ca3', 'aebb3a67-4c47-4508-9aab-f8da0994a22f', 0, '2020/07/22 00:00', 'lnapoli'),
('38d3ecf0-b317-445a-b589-3e39c1948bc2', 2, '40457d2c-f5e2-4142-b48b-e3017974032a', 'aebb3a67-4c47-4508-9aab-f8da0994a22f', 0, '2020/07/22 00:00', 'lnapoli');


SELECT * FROM dd.VolumeTransactions;

--DELETE FROM dd.VolumeTransactions;



