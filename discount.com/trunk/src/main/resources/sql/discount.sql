-- SQL Manager Lite for PostgreSQL 5.3.0.1
-- ---------------------------------------
-- Host      : localhost
-- Database  : alfero
-- Version   : PostgreSQL 9.1.3, compiled by Visual C++ build 1500, 64-bit



SET check_function_bodies = false;
--
-- Definition for sequence client_id_seq (OID = 24682) :
--
SET search_path = public, pg_catalog;
CREATE SEQUENCE public.client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence comment_id_seq (OID = 24684) :
--
CREATE SEQUENCE public.comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence product_id_seq (OID = 24686) :
--
CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence product_category_id_seq (OID = 24688) :
--
CREATE SEQUENCE public.product_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence product_settings_id_seq (OID = 24690) :
--
CREATE SEQUENCE public.product_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence user_id_seq (OID = 24692) :
--
CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence user_role_id_seq (OID = 24694) :
--
CREATE SEQUENCE public.user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table client (OID = 24696) :
--
CREATE TABLE public.client (
    id integer NOT NULL,
    name text,
    type text
)
WITH (oids = false);
--
-- Structure for table role (OID = 24699) :
--
CREATE TABLE public.role (
    id integer NOT NULL,
    role text
)
WITH (oids = false);
--
-- Structure for table users (OID = 24702) :
--
CREATE TABLE public.users (
    id integer NOT NULL,
    login text,
    password text,
    email text,
    first_name text,
    last_name text,
    enabled boolean
)
WITH (oids = false);
--
-- Structure for table category (OID = 24705) :
--
CREATE TABLE public.category (
    id integer NOT NULL,
    name text NOT NULL,
    image text
)
WITH (oids = false);
--
-- Structure for table product (OID = 24711) :
--
CREATE TABLE public.product (
    id integer NOT NULL,
    product_category_id integer NOT NULL,
    name text NOT NULL,
    description text,
    price integer DEFAULT 1 NOT NULL,
    discount_price integer,
    discount integer,
    image text
)
WITH (oids = false);
--
-- Structure for table comment (OID = 24717) :
--
CREATE TABLE public.comment (
    id integer NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    content text
)
WITH (oids = false);
--
-- Structure for table settings (OID = 24723) :
--
CREATE TABLE public.settings (
    id integer NOT NULL,
    product_id integer NOT NULL,
    property_name text,
    property_value text
)
WITH (oids = false);
--
-- Structure for table user_role (OID = 24726) :
--
CREATE TABLE public.user_role (
    user_id integer NOT NULL,
    role_id integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table category_settings (OID = 33005) :
--
CREATE TABLE public.category_settings (
    id integer NOT NULL,
    field_name text NOT NULL,
    field_type text NOT NULL,
    category_id integer NOT NULL,
    unit text
)
WITH (oids = false);
--
-- Definition for sequence category_settings_id_seq (OID = 33013) :
--
CREATE SEQUENCE public.category_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Data for table public.client (OID = 24696) (LIMIT 0,4)
--
INSERT INTO client (id, name, type)
VALUES (4250, 'kghjk', 'hgjkghjk');

INSERT INTO client (id, name, type)
VALUES (1, 'init client', NULL);

INSERT INTO client (id, name, type)
VALUES (4600, 'aaaa', 'fdsafd');

INSERT INTO client (id, name, type)
VALUES (4650, 'jrtyj', 'jytrj');

--
-- Data for table public.role (OID = 24699) (LIMIT 0,2)
--
INSERT INTO role (id, role)
VALUES (1, 'ROLE_ADMIN');

INSERT INTO role (id, role)
VALUES (2, 'ROLE_USER');

--
-- Data for table public.users (OID = 24702) (LIMIT 0,1)
--
INSERT INTO users (id, login, password, email, first_name, last_name, enabled)
VALUES (1, 'init user', '123456', 'init_user@discount.com', 'Init', 'User', true);

--
-- Data for table public.category (OID = 24705) (LIMIT 0,3)
--
INSERT INTO category (id, name, image)
VALUES (1658, 'boilers', 'images/default.jpg');

INSERT INTO category (id, name, image)
VALUES (1659, 'Plubling', 'images/default.jpg');

INSERT INTO category (id, name, image)
VALUES (1700, 'new cat', 'images/airline.PNG');

--
-- Data for table public.product (OID = 24711) (LIMIT 0,1)
--
INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image)
VALUES (1850, 1658, 'new  product,123,sdfasdf,4321', 'new prod description', 100, NULL, NULL, 'images/default.jpg');

--
-- Data for table public.user_role (OID = 24726) (LIMIT 0,2)
--
INSERT INTO user_role (user_id, role_id)
VALUES (1, 1);

INSERT INTO user_role (user_id, role_id)
VALUES (1, 2);

--
-- Data for table public.category_settings (OID = 33005) (LIMIT 0,6)
--
INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (808, 'price', 'NUMBER', 1658, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (809, 'description', 'TEXT', 1658, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (810, 'power', 'TEXT', 1658, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (811, '', 'TEXT', 1659, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (850, 'price', 'NUMBER', 1700, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (851, 'description', 'TEXT', 1700, NULL);

--
-- Definition for index client_pkey (OID = 24729) :
--
ALTER TABLE ONLY client
    ADD CONSTRAINT client_pkey
    PRIMARY KEY (id);
--
-- Definition for index role_pkey (OID = 24731) :
--
ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey
    PRIMARY KEY (id);
--
-- Definition for index user_pkey (OID = 24733) :
--
ALTER TABLE ONLY users
    ADD CONSTRAINT user_pkey
    PRIMARY KEY (id);
--
-- Definition for index productCategory_pkey (OID = 24735) :
--
ALTER TABLE ONLY category
    ADD CONSTRAINT "productCategory_pkey"
    PRIMARY KEY (id);
--
-- Definition for index product_pkey (OID = 24737) :
--
ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey
    PRIMARY KEY (id);
--
-- Definition for index comment_pkey (OID = 24749) :
--
ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pkey
    PRIMARY KEY (id);
--
-- Definition for index productSettings_pkey (OID = 24761) :
--
ALTER TABLE ONLY settings
    ADD CONSTRAINT "productSettings_pkey"
    PRIMARY KEY (id);
--
-- Definition for index comment_product_id_fkey (OID = 32910) :
--
ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_product_id_fkey
    FOREIGN KEY (product_id) REFERENCES product(id);
--
-- Definition for index comment_user_id_fkey (OID = 32915) :
--
ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_user_id_fkey
    FOREIGN KEY (user_id) REFERENCES users(id);
--
-- Definition for index user_role_pkey (OID = 32949) :
--
ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_pkey
    PRIMARY KEY (user_id, role_id);
--
-- Definition for index settings_product_id_fkey (OID = 32956) :
--
ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_product_id_fkey
    FOREIGN KEY (product_id) REFERENCES product(id);
--
-- Definition for index user_role_roleId_fkey (OID = 32995) :
--
ALTER TABLE ONLY user_role
    ADD CONSTRAINT "user_role_roleId_fkey"
    FOREIGN KEY (role_id) REFERENCES role(id);
--
-- Definition for index user_role_userId_fkey (OID = 33000) :
--
ALTER TABLE ONLY user_role
    ADD CONSTRAINT "user_role_userId_fkey"
    FOREIGN KEY (user_id) REFERENCES users(id);
--
-- Definition for index category_settings_pkey (OID = 33011) :
--
ALTER TABLE ONLY category_settings
    ADD CONSTRAINT category_settings_pkey
    PRIMARY KEY (id);
--
-- Definition for index category_settings_fk (OID = 33025) :
--
ALTER TABLE ONLY category_settings
    ADD CONSTRAINT category_settings_fk
    FOREIGN KEY (category_id) REFERENCES category(id);
--
-- Data for sequence public.client_id_seq (OID = 24682)
--
SELECT pg_catalog.setval('client_id_seq', 94, true);
--
-- Data for sequence public.comment_id_seq (OID = 24684)
--
SELECT pg_catalog.setval('comment_id_seq', 1, false);
--
-- Data for sequence public.product_id_seq (OID = 24686)
--
SELECT pg_catalog.setval('product_id_seq', 37, true);
--
-- Data for sequence public.product_category_id_seq (OID = 24688)
--
SELECT pg_catalog.setval('product_category_id_seq', 34, true);
--
-- Data for sequence public.product_settings_id_seq (OID = 24690)
--
SELECT pg_catalog.setval('product_settings_id_seq', 32, true);
--
-- Data for sequence public.user_id_seq (OID = 24692)
--
SELECT pg_catalog.setval('user_id_seq', 65, true);
--
-- Data for sequence public.user_role_id_seq (OID = 24694)
--
SELECT pg_catalog.setval('user_role_id_seq', 10, true);
--
-- Data for sequence public.category_settings_id_seq (OID = 33013)
--
SELECT pg_catalog.setval('category_settings_id_seq', 17, true);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
