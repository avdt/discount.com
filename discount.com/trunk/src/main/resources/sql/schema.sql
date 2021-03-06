-- SQL Manager Lite for PostgreSQL 5.3.0.1
-- ---------------------------------------
-- Host      : localhost
-- Database  : alfero
-- Version   : PostgreSQL 9.1.3, compiled by Visual C++ build 1500, 64-bit



SET check_function_bodies = false;
--
-- Definition for sequence client_id_seq (OID = 34773) : 
--
SET search_path = public, pg_catalog;
CREATE SEQUENCE public.client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence comment_id_seq (OID = 34775) : 
--
CREATE SEQUENCE public.comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence product_id_seq (OID = 34777) : 
--
CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence product_category_id_seq (OID = 34779) : 
--
CREATE SEQUENCE public.product_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence product_settings_id_seq (OID = 34781) : 
--
CREATE SEQUENCE public.product_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence user_id_seq (OID = 34783) : 
--
CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence user_role_id_seq (OID = 34785) : 
--
CREATE SEQUENCE public.user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table role (OID = 34793) : 
--
CREATE TABLE public.role (
    id integer NOT NULL,
    role text
)
WITH (oids = false);
--
-- Structure for table users (OID = 34799) : 
--
CREATE TABLE public.users (
    id integer NOT NULL,
    login text NOT NULL,
    password text,
    email text,
    first_name text,
    last_name text,
    enabled boolean,
    phone_number text,
    city text,
    address text,
    image text,
    published boolean DEFAULT false NOT NULL
)
WITH (oids = false);
--
-- Structure for table category (OID = 34805) : 
--
CREATE TABLE public.category (
    id integer NOT NULL,
    name text NOT NULL,
    image text,
    parent_category_id integer,
    removable boolean DEFAULT true NOT NULL,
    root boolean DEFAULT false NOT NULL,
    published boolean DEFAULT false NOT NULL
)
WITH (oids = false);
--
-- Structure for table product (OID = 34813) : 
--
CREATE TABLE public.product (
    id integer NOT NULL,
    product_category_id integer NOT NULL,
    name text NOT NULL,
    description text,
    price integer DEFAULT 1 NOT NULL,
    discount_price integer,
    discount integer,
    image text,
    sale boolean DEFAULT false,
    producer_id integer NOT NULL,
    range_id integer,
    published boolean DEFAULT false NOT NULL
)
WITH (oids = false);
--
-- Structure for table comment (OID = 34821) : 
--
CREATE TABLE public.comment (
    id integer NOT NULL,
    product_id integer NOT NULL,
    content text,
    date date,
    owner_name text
)
WITH (oids = false);
--
-- Structure for table settings (OID = 34827) : 
--
CREATE TABLE public.settings (
    id integer NOT NULL,
    product_id integer NOT NULL,
    property_name text,
    property_value text
)
WITH (oids = false);
--
-- Structure for table user_role (OID = 34833) : 
--
CREATE TABLE public.user_role (
    user_id integer NOT NULL,
    role_id integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table category_settings (OID = 34836) : 
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
-- Definition for sequence category_settings_id_seq (OID = 34842) : 
--
CREATE SEQUENCE public.category_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table producer (OID = 34844) : 
--
CREATE TABLE public.producer (
    id integer NOT NULL,
    name text NOT NULL,
    image text,
    description text,
    published boolean DEFAULT false NOT NULL
)
WITH (oids = false);
--
-- Definition for sequence producer_id_seq (OID = 34850) : 
--
CREATE SEQUENCE public.producer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table category_producer (OID = 34852) : 
--
CREATE TABLE public.category_producer (
    category_id integer NOT NULL,
    producer_id integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table producer_categories (OID = 34855) : 
--
CREATE TABLE public.producer_categories (
    id integer NOT NULL,
    producer_id integer
)
WITH (oids = false);
--
-- Structure for table range (OID = 34858) : 
--
CREATE TABLE public.range (
    id integer NOT NULL,
    name text NOT NULL,
    producer_id integer,
    image text,
    published boolean DEFAULT false NOT NULL
)
WITH (oids = false);
--
-- Definition for sequence range_id_seq (OID = 34864) : 
--
CREATE SEQUENCE public.range_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table static_page (OID = 34866) : 
--
CREATE TABLE public.static_page (
    id integer NOT NULL,
    title text NOT NULL,
    description text,
    url text NOT NULL,
    location text,
    published boolean,
    reserved boolean,
    content text
)
WITH (oids = false);
--
-- Definition for sequence static_page_id_seq (OID = 34872) : 
--
CREATE SEQUENCE public.static_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence notification_id_seq (OID = 35022) : 
--
CREATE SEQUENCE public.notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table notification (OID = 35024) : 
--
CREATE TABLE public.notification (
    id integer NOT NULL,
    type text NOT NULL
)
WITH (oids = false);
--
-- Structure for table notification_user (OID = 35033) : 
--
CREATE TABLE public.notification_user (
    notification_id integer NOT NULL,
    user_id integer NOT NULL
)
WITH (oids = false);
--
-- Definition for index role_pkey (OID = 34878) : 
--
ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey
    PRIMARY KEY (id);
--
-- Definition for index user_pkey (OID = 34880) : 
--
ALTER TABLE ONLY users
    ADD CONSTRAINT user_pkey
    PRIMARY KEY (id);
--
-- Definition for index productCategory_pkey (OID = 34882) : 
--
ALTER TABLE ONLY category
    ADD CONSTRAINT "productCategory_pkey"
    PRIMARY KEY (id);
--
-- Definition for index product_pkey (OID = 34884) : 
--
ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey
    PRIMARY KEY (id);
--
-- Definition for index comment_pkey (OID = 34886) : 
--
ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pkey
    PRIMARY KEY (id);
--
-- Definition for index productSettings_pkey (OID = 34888) : 
--
ALTER TABLE ONLY settings
    ADD CONSTRAINT "productSettings_pkey"
    PRIMARY KEY (id);
--
-- Definition for index user_role_pkey (OID = 34890) : 
--
ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_pkey
    PRIMARY KEY (user_id, role_id);
--
-- Definition for index settings_product_id_fkey (OID = 34892) : 
--
ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_product_id_fkey
    FOREIGN KEY (product_id) REFERENCES product(id);
--
-- Definition for index user_role_roleId_fkey (OID = 34897) : 
--
ALTER TABLE ONLY user_role
    ADD CONSTRAINT "user_role_roleId_fkey"
    FOREIGN KEY (role_id) REFERENCES role(id);
--
-- Definition for index user_role_userId_fkey (OID = 34902) : 
--
ALTER TABLE ONLY user_role
    ADD CONSTRAINT "user_role_userId_fkey"
    FOREIGN KEY (user_id) REFERENCES users(id);
--
-- Definition for index category_settings_pkey (OID = 34907) : 
--
ALTER TABLE ONLY category_settings
    ADD CONSTRAINT category_settings_pkey
    PRIMARY KEY (id);
--
-- Definition for index category_settings_fk (OID = 34909) : 
--
ALTER TABLE ONLY category_settings
    ADD CONSTRAINT category_settings_fk
    FOREIGN KEY (category_id) REFERENCES category(id);
--
-- Definition for index producer_pkey (OID = 34919) : 
--
ALTER TABLE ONLY producer
    ADD CONSTRAINT producer_pkey
    PRIMARY KEY (id);
--
-- Definition for index category_producer_category_id_fkey (OID = 34921) : 
--
ALTER TABLE ONLY category_producer
    ADD CONSTRAINT category_producer_category_id_fkey
    FOREIGN KEY (category_id) REFERENCES category(id);
--
-- Definition for index category_producer_producer_id_fkey (OID = 34926) : 
--
ALTER TABLE ONLY category_producer
    ADD CONSTRAINT category_producer_producer_id_fkey
    FOREIGN KEY (producer_id) REFERENCES producer(id);
--
-- Definition for index range_pkey (OID = 34931) : 
--
ALTER TABLE ONLY range
    ADD CONSTRAINT range_pkey
    PRIMARY KEY (id);
--
-- Definition for index comment_product_id_fkey (OID = 34948) : 
--
ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_product_id_fkey
    FOREIGN KEY (product_id) REFERENCES product(id);
--
-- Definition for index static_page_pkey (OID = 34953) : 
--
ALTER TABLE ONLY static_page
    ADD CONSTRAINT static_page_pkey
    PRIMARY KEY (id);
--
-- Definition for index users_login_key (OID = 34959) : 
--
ALTER TABLE ONLY users
    ADD CONSTRAINT users_login_key
    UNIQUE (login);
--
-- Definition for index product_producer_id_fkey (OID = 34978) : 
--
ALTER TABLE ONLY product
    ADD CONSTRAINT product_producer_id_fkey
    FOREIGN KEY (producer_id) REFERENCES producer(id);
--
-- Definition for index product_range_id_fkey (OID = 34983) : 
--
ALTER TABLE ONLY product
    ADD CONSTRAINT product_range_id_fkey
    FOREIGN KEY (range_id) REFERENCES range(id);
--
-- Definition for index parent_category_fk (OID = 35004) : 
--
ALTER TABLE ONLY category
    ADD CONSTRAINT parent_category_fk
    FOREIGN KEY (parent_category_id) REFERENCES category(id);
--
-- Definition for index range_producer_id_fkey (OID = 35017) : 
--
ALTER TABLE ONLY range
    ADD CONSTRAINT range_producer_id_fkey
    FOREIGN KEY (producer_id) REFERENCES producer(id);
--
-- Definition for index notification_pkey (OID = 35030) : 
--
ALTER TABLE ONLY notification
    ADD CONSTRAINT notification_pkey
    PRIMARY KEY (id);
--
-- Definition for index notification_user_notification_id_fkey (OID = 35036) : 
--
ALTER TABLE ONLY notification_user
    ADD CONSTRAINT notification_user_notification_id_fkey
    FOREIGN KEY (notification_id) REFERENCES notification(id);
--
-- Definition for index notification_user_user_id_fkey (OID = 35041) : 
--
ALTER TABLE ONLY notification_user
    ADD CONSTRAINT notification_user_user_id_fkey
    FOREIGN KEY (user_id) REFERENCES users(id);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
