
CREATE TABLE USER_MST (UID SERIAL PRIMARY KEY, USERID TEXT, PWD TEXT, EMAILID TEXT, STATUS CHAR(1) DEFAULT 'Y', FIRTSTNAME TEXT, LASTNAME TEXT, ADDRESS TEXT, CONTACTNO TEXT);

CREATE TABLE ROLE_MST (ROLEID SERIAL PRIMARY KEY, ROLENAME TEXT, DESCR TEXT, STATUS CHAR(1) DEFAULT 'Y');

CREATE TABLE RIGHT_MST (RIGHTID SERIAL PRIMARY KEY, RIGHTNAME TEXT, DESCR TEXT, SCREEN TEXT, STATUS CHAR(1) DEFAULT 'Y');

CREATE TABLE USER_ROLE_MAPPING (MAPID SERIAL PRIMARY KEY, UID INT REFERENCES USER_MST(UID) ON DELETE CASCADE, ROLEID INT REFERENCES ROLE_MST(ROLEID) ON DELETE CASCADE, STATUS CHAR(1) DEFAULT 'Y' );

CREATE TABLE ROLE_RIGHT_MAPPING (MAPID SERIAL PRIMARY KEY, ROLEID INT REFERENCES ROLE_MST(ROLEID) ON DELETE CASCADE, RIGHTID INT REFERENCES RIGHT_MST(RIGHTID) ON DELETE CASCADE, STATUS CHAR(1) DEFAULT 'Y' );

CREATE TABLE MED_CATEGORY_MST (ID SERIAL PRIMARY KEY, DESCR TEXT);

CREATE TABLE MED_MST (MEDID SERIAL PRIMARY KEY, MEDNAME TEXT, CATEGORYID INT REFERENCES MED_CATEGORY_MST(ID) ON DELETE CASCADE);

CREATE TABLE STORE_MST (SID SERIAL PRIMARY KEY, SNAME TEXT, SADDRESS TEXT, SCONTACTNO TEXT, STATUS CHAR(1) DEFAULT 'Y');

CREATE TABLE COMMON_GENE_PARA (ID SERIAL PRIMARY KEY, NAME TEXT, DESCR TEXT, KEY TEXT, STATUS CHAR(1) DEFAULT 'Y');

INSERT INTO USER_MST(USERID,PWD) VALUES('admin','admin');

INSERT INTO ROLE_MST(ROLENAME, DESCR) VALUES('Admin', 'This is admin');
INSERT INTO ROLE_MST(ROLENAME, DESCR) VALUES('User', 'This is user');

INSERT INTO USER_ROLE_MAPPING(UID,ROLEID) VALUES(1,1);

INSERT INTO RIGHT_MST(RIGHTNAME, DESCR, SCREEN) VALUES('Add Medicine', 'Add screen for medicine', 'addMed.jsp');
INSERT INTO RIGHT_MST(RIGHTNAME, DESCR, SCREEN) VALUES('Delete Medicine', 'Delete screen for medicine', 'delMed.jsp');
INSERT INTO RIGHT_MST(RIGHTNAME, DESCR, SCREEN) VALUES('Add Store', 'Add screen for store', 'addStore.jsp');
INSERT INTO RIGHT_MST(RIGHTNAME, DESCR, SCREEN) VALUES('Delete Store', 'Delete screen for store', 'delStore.jsp');
INSERT INTO RIGHT_MST(RIGHTNAME, DESCR, SCREEN) VALUES('Update Contact Us', 'Update screen for Contact Us section', 'updateContactUs.jsp');

INSERT INTO RIGHT_MST(RIGHTNAME, DESCR, SCREEN) VALUES('Search Medicine', 'Search screen for medicine', 'searchMed.jsp');
INSERT INTO RIGHT_MST(RIGHTNAME, DESCR, SCREEN) VALUES('Update Profile', 'Update screen for profile', 'updateProfile.jsp');
INSERT INTO RIGHT_MST(RIGHTNAME, DESCR, SCREEN) VALUES('MedBook', 'display screen for MedBook', 'medBook.jsp');

INSERT INTO ROLE_RIGHT_MST(ROLEID,RIGHTID) VALUES(1,1);
INSERT INTO ROLE_RIGHT_MST(ROLEID,RIGHTID) VALUES(1,2);
INSERT INTO ROLE_RIGHT_MST(ROLEID,RIGHTID) VALUES(1,3);
INSERT INTO ROLE_RIGHT_MST(ROLEID,RIGHTID) VALUES(1,4);
INSERT INTO ROLE_RIGHT_MST(ROLEID,RIGHTID) VALUES(1,5);
INSERT INTO ROLE_RIGHT_MST(ROLEID,RIGHTID) VALUES(2,6);
INSERT INTO ROLE_RIGHT_MST(ROLEID,RIGHTID) VALUES(2,7);
INSERT INTO ROLE_RIGHT_MST(ROLEID,RIGHTID) VALUES(2,8);

INSERT INTO MED_CATEGORY_MST(DESCR) VALUES('Fever');
INSERT INTO MED_CATEGORY_MST(DESCR) VALUES('Cold & Flu');
INSERT INTO MED_CATEGORY_MST(DESCR) VALUES('Diabetes');
INSERT INTO MED_CATEGORY_MST(DESCR) VALUES('Digestion');

INSERT INTO COMMON_GENE_PARA(NAME, DESCR, KEY) VALUES('m', 'Male', 'Gender');
INSERT INTO COMMON_GENE_PARA(NAME, DESCR, KEY) VALUES('f', 'Female', 'Gender');
INSERT INTO COMMON_GENE_PARA(NAME, DESCR, KEY) VALUES('IN', 'India', 'Country');
INSERT INTO COMMON_GENE_PARA(NAME, DESCR, KEY) VALUES('DL', 'Delhi', 'City');
INSERT INTO COMMON_GENE_PARA(NAME, DESCR, KEY) VALUES('RO', 'Rohini', 'Region');