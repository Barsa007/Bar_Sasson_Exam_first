CREATE TABLE stack(
  ID INTEGER PRIMARY KEY AUTOINCREMENT ,
  catalog_number INTEGER UNIQUE,
  price INTEGER,
  stack INTEGER,
  CHECK (price>=0 AND stack>=0),
  FOREIGN KEY (catalog_number) REFERENCES catalog(catalog_number) ON DELETE CASCADE
);

CREATE TABLE catalog(
  catalog_number INTEGER PRIMARY KEY UNIQUE ,
  model text NOT NULL,
  brand_id INTEGER  NOT NULL,
  screen_size_id INTEGER  NOT NULL,
  resolution_id INTEGER  NOT NULL,
  smart_tv_id INTEGER DEFAULT 0,
  pannel_id INTEGER  NOT NULL,
  FOREIGN KEY (brand_id) REFERENCES brands(brand_id) ON DELETE CASCADE,
  FOREIGN KEY (screen_size_id) REFERENCES screen_sizes(screen_size_id) ON DELETE CASCADE,
  FOREIGN KEY (resolution_id) REFERENCES resolution(resolution_id) ON DELETE CASCADE,
  FOREIGN KEY (smart_tv_id) REFERENCES smart_tv(smart_tv_id) ON DELETE CASCADE,
  FOREIGN KEY (pannel_id) REFERENCES pannel(pannel_id) ON DELETE CASCADE
);

CREATE TABLE brands(
  brand_id INTEGER PRIMARY KEY AUTOINCREMENT,
  brand_name TEXT NOT NULL UNIQUE
);

CREATE TABLE pannel(
  pannel_id INTEGER PRIMARY KEY AUTOINCREMENT,
  pannel_type text NOT NULL UNIQUE
);

CREATE TABLE resolution(
  resolution_id INTEGER PRIMARY KEY AUTOINCREMENT,
  resolution INTEGER NOT NULL UNIQUE
);

CREATE TABLE screen_sizes(
  screen_size_id INTEGER PRIMARY KEY AUTOINCREMENT,
  screen_size INTEGER NOT NULL UNIQUE
);

CREATE TABLE smart_tv(
  smart_tv_id INTEGER PRIMARY KEY AUTOINCREMENT,
  os text NOT NULL UNIQUE
);

INSERT INTO stack (catalog_number,price,stack) VALUES
	 (1001,5000,10),
	 (1002,7000,5),
	 (1003,6500,8),
	 (1004,3000,12),
	 (1005,6000,4),
	 (1006,3500,20),
	 (1008,1500,15),
	 (1007,6800,6);

INSERT INTO "catalog" (catalog_number,model,brand_id,screen_size_id,resolution_id,smart_tv_id,pannel_id) VALUES
	 (1001,'QLED 4K',1,5,4,1,3),
	 (1002,'OLED CX',2,4,4,2,2),
	 (1003,'Bravia X90',3,4,4,3,2),
	 (1004,'TCL 5 Series',4,3,3,4,1),
	 (1005,'Panasonic HX800',5,4,4,5,2),
	 (1006,'Samsung TU7000',1,3,2,1,3),
	 (1007,'LG NanoCell',2,4,4,2,2),
	 (1008,'Basic TV 32"',1,1,2,0,1);


INSERT INTO brands (brand_name) VALUES
	 ('Samsung'),
	 ('LG'),
	 ('Sony'),
	 ('TCL'),
	 ('Panasonic');

INSERT INTO pannel (pannel_type) VALUES
	 ('LED'),
	 ('OLED'),
	 ('QLED'),
	 ('IPS'),
	 ('VA');

INSERT INTO resolution (resolution) VALUES
	 (720),
	 (1080),
	 (1440),
	 (2160);

INSERT INTO screen_sizes (screen_size) VALUES
	 (32),
	 (40),
	 (50),
	 (55),
	 (65);

INSERT INTO smart_tv (os) VALUES
	 ('None'),
	 ('Tizen'),
	 ('webOS'),
	 ('Android TV'),
	 ('Roku'),
	 ('Panasonic OS');

