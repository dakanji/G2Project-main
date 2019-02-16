## mysql
# WebDavLockMap
CREATE TABLE DB_TABLE_PREFIXWebDavLockMap(
 DB_COLUMN_PREFIXdepth varchar(128),
 DB_COLUMN_PREFIXowner varchar(128),
 DB_COLUMN_PREFIXexpires int(11),
 DB_COLUMN_PREFIXtoken varchar(128),
 DB_COLUMN_PREFIXpath varchar(128),
 DB_COLUMN_PREFIXgalleryLockId int(11)
) DB_TABLE_TYPE
/*!40100 DEFAULT CHARACTER SET utf8 */;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('WebDavLockMap', 0, 1);

## postgres
# WebDavLockMap
CREATE TABLE DB_TABLE_PREFIXWebDavLockMap(
 DB_COLUMN_PREFIXdepth VARCHAR(128),
 DB_COLUMN_PREFIXowner VARCHAR(128),
 DB_COLUMN_PREFIXexpires INTEGER,
 DB_COLUMN_PREFIXtoken VARCHAR(128),
 DB_COLUMN_PREFIXpath VARCHAR(128),
 DB_COLUMN_PREFIXgalleryLockId INTEGER);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('WebDavLockMap', 0, 1);

## oracle
# WebDavLockMap
CREATE TABLE DB_TABLE_PREFIXWebDavLockMap(
 DB_COLUMN_PREFIXdepth VARCHAR2(128),
 DB_COLUMN_PREFIXowner VARCHAR2(128),
 DB_COLUMN_PREFIXexpires INTEGER,
 DB_COLUMN_PREFIXtoken VARCHAR2(128),
 DB_COLUMN_PREFIXpath VARCHAR2(128),
 DB_COLUMN_PREFIXgalleryLockId INTEGER);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('WebDavLockMap', 0, 1);

## db2
# WebDavLockMap
CREATE TABLE DB_TABLE_PREFIXWebDavLockMap(
 DB_COLUMN_PREFIXdepth VARCHAR(128),
 DB_COLUMN_PREFIXowner VARCHAR(128),
 DB_COLUMN_PREFIXexpires INTEGER,
 DB_COLUMN_PREFIXtoken VARCHAR(128),
 DB_COLUMN_PREFIXpath VARCHAR(128),
 DB_COLUMN_PREFIXgalleryLockId INTEGER);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('WebDavLockMap', 0, 1);

## mssql
# WebDavLockMap
CREATE TABLE DB_TABLE_PREFIXWebDavLockMap(
 DB_COLUMN_PREFIXdepth NVARCHAR(128) NULL,
 DB_COLUMN_PREFIXowner NVARCHAR(128) NULL,
 DB_COLUMN_PREFIXexpires INT NULL,
 DB_COLUMN_PREFIXtoken NVARCHAR(128) NULL,
 DB_COLUMN_PREFIXpath NVARCHAR(128) NULL,
 DB_COLUMN_PREFIXgalleryLockId INT NULL);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('WebDavLockMap', 0, 1);

