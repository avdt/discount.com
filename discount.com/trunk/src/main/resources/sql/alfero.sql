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
-- Data for table public.role (OID = 34793) (LIMIT 0,2)
--
INSERT INTO role (id, role)
VALUES (1, 'ROLE_ADMIN');

INSERT INTO role (id, role)
VALUES (2, 'ROLE_USER');

--
-- Data for table public.users (OID = 34799) (LIMIT 0,8)
--
INSERT INTO users (id, login, password, email, first_name, last_name, enabled, phone_number, city, address, image, published)
VALUES (1, 'init user', '123456', 'init_user@discount.com', 'Init', 'User', true, NULL, NULL, NULL, 'images/default.jpg', false);

INSERT INTO users (id, login, password, email, first_name, last_name, enabled, phone_number, city, address, image, published)
VALUES (3300, 'andriy-vintoniv', '1234', 'andriyvintoniv@ukr.net', 'Andriy', 'Vintoniv', NULL, '0666647427', NULL, NULL, 'images/default.jpg', false);

INSERT INTO users (id, login, password, email, first_name, last_name, enabled, phone_number, city, address, image, published)
VALUES (3350, 'andriy', '1234', 'andriy-vintoniv@ukr.net', 'Andriy', 'Vintoniv', NULL, '22222222222', NULL, NULL, 'images/default.jpg', false);

INSERT INTO users (id, login, password, email, first_name, last_name, enabled, phone_number, city, address, image, published)
VALUES (3450, 'test', '1234', 'test@example.com', 'test', 'user', NULL, '123456789', NULL, NULL, 'images/default.jpg', false);

INSERT INTO users (id, login, password, email, first_name, last_name, enabled, phone_number, city, address, image, published)
VALUES (3500, 'andriy-ukr', '1234', 'andriyvintoniv@ukr.net', 'Андрій', 'Вінтонів', NULL, '123456789', 'Ль͐ӑאҀ', 'вул. Лазаренка, 36/77', 'images/default.jpg', false);

INSERT INTO users (id, login, password, email, first_name, last_name, enabled, phone_number, city, address, image, published)
VALUES (3600, 'valid_user', '123456', 'valid_user@example.com', 'Valid', 'User', NULL, '0666647472', NULL, NULL, 'images/default.jpg', false);

INSERT INTO users (id, login, password, email, first_name, last_name, enabled, phone_number, city, address, image, published)
VALUES (3650, 'hdfgh', 'dfghdfg', 'valid_user@example.com', 'hdfgh', '', NULL, '0666647472', NULL, NULL, 'images/default.jpg', false);

INSERT INTO users (id, login, password, email, first_name, last_name, enabled, phone_number, city, address, image, published)
VALUES (3750, 'admin', '123456', 'andriyvintoniv@ukr.net', 'admin', '', NULL, '0666647427', NULL, '', 'images/default.jpg', false);

--
-- Data for table public.category (OID = 34805) (LIMIT 0,44)
--
INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (2, 'Опалення', 'images/опалення.jpg', NULL, false, true, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (2900, 'Дизайн радіатори', 'images/IMG_1133.JPG', 2, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (2950, 'Змішувачі для ванни', 'images/змішувач для ванни.jpg', 1, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (2951, 'Змішувачі для кухні', 'images/змішувач для кухні.jpg', 1, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3000, 'Котли', 'images/котли.jpg', 2, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3050, 'Газові колонки', 'images/газові колонки.jpg', 2, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3100, 'Змішувач для біде', 'images/біде.jpg', 1, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (5000, 'Test category', 'images/default.jpg', NULL, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3300, 'Змішувачі для душової кабіни', 'images/змішувач для душу.jpg', 1, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3301, 'Змішувачі для умивальника', 'images/змішувач для умивальника.jpeg', 1, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (1, 'Змішувачі', 'images/змішувачі.jpg', NULL, false, true, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3350, 'Сантехніка для ванни', 'images/сант. для ванни.jpg', NULL, true, true, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3400, 'Сантехніка для душу', 'images/душ кабіна.gif', NULL, true, true, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3401, 'Меблі для ванної', 'images/меблі для ванної.jpg', NULL, true, true, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3402, 'Мийки і раковини', 'images/мийки і раковини.jpg', NULL, true, true, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3403, 'Сантехніка для туалету', 'images/сант. для туалету.jpg', NULL, true, true, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3404, 'Кухонні мийки', 'images/куханна мийка.jpg', 3402, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3405, 'Раковини', 'images/раковина.jpg', 3402, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3406, 'Аксесуари для кухонних мийок', 'images/default.jpg', 3402, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3407, 'П''єдестал для раковини', 'images/П''єдестал для раковини.jpg', 3402, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3408, 'Акрилові ванни', 'images/акрилова ванна.jpg', 3350, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3450, 'Бокові панелі', 'images/bokovaj_panel_1.jpg', 3350, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3451, 'Ванни', 'images/ванна.jpg', 3350, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3452, 'Гідромасажні ванни', 'images/гідромасажна ванна.jpg', 3350, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3500, 'Карнізи для ванни', 'images/карніз.jpg', 3350, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3550, 'Аксесуари для ванної кімнати', 'images/аксеури для ванни.jpg', 3350, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3551, 'Поручні для ванни', 'images/поручень.jpg', 3350, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3552, 'Гідромасажні бокси', 'images/Гідромасажні бокси.jpg', 3400, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3553, 'Душові двері і перегородки', 'images/Душові двері і перегородки.jpg', 3400, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3554, 'Душові кабіни', 'images/Душові кабіни.jpg', 3400, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3555, 'Душові піддони', 'images/Душові піддони.jpg', 3400, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3556, 'Ручні душі', 'images/Ручні душі.jpg', 3400, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3557, 'Душові набори', 'images/Душові набори.jpg', 3400, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3558, 'Рушникосушки', 'images/Рушникосушки.jpg', 3350, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3559, 'Сифони', 'images/Сифони.jpeg', 3402, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3560, 'Зеркала для ванної', 'images/Зеркала для ванної.jpg', 3401, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3561, 'Комплекти меблів для ванної', 'images/Комплекти меблів для ванної.jpg', 3401, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3562, 'Пенали для ванної', 'images/Пенали для ванної.jpg', 3401, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3563, 'Тумби для ванної', 'images/Тумби для ванної.jpg', 3401, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3564, 'Шафи для ванної', 'images/Шафи для ванної.jpg', 3401, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3565, 'Біде', 'images/Біде1.jpg', 3403, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3566, 'Пісюари', 'images/Пісюари.jpg', 3403, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3567, 'Унітази', 'images/Унітази.png', 3403, true, false, false);

INSERT INTO category (id, name, image, parent_category_id, removable, root, published)
VALUES (3568, 'Інсталяції', 'images/Інсталяції.JPG', 3403, true, false, false);

--
-- Data for table public.product (OID = 34813) (LIMIT 0,72)
--
INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3514, 3100, 'Hansa 45073203', 'Однорычажный смеситель для биде с донным клапаном на одно отверстие, DN 15 для биде расход: 6 л/мин, измеряется при давлении потока 3 бар • сливной гарнитур • Подключение через гибкие шланги G 3/8 • DVGW в работе выступ: 105 мм излив: литой', 0, NULL, 0, 'images/zb2.jpg', true, 1150, 186, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3101, 2900, 'BOGO', 'Se', 2712, NULL, 0, 'images/JrKGAKKjcdQ.jpg', false, 1000, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3352, 3000, 'Kiturami TWIN Alpha', 'Функція енергозбереження
Датчик виявлення витоку газу
Запобігання розморожування системи опалення в зимовий період
Вбудований сепаратор усуває повітря із системи опалення
Працює при низькому тиску газу (від 0,3 мбар)
Працює при слабкому протоці води ГВП (від 1,6 л / хв)
Функція самодіагностики несправностей
Зручне управління котлом
Теплообмінник складається з міді 99%
Розширювальний бак - 7л', 0, NULL, 10, 'images/k1.jpg', true, 1100, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3513, 3301, 'Hansa 45042203', 'Однорычажный смеситель для умывальника, DN 15 расход: 6 л/мин, измеряется при давлении потока 3 бар • сливной гарнитур • Подключение через гибкие шланги G 3/8 • DVGW в работе выступ: 99 мм излив: неподвижный, литой', 0, NULL, 0, 'images/zu7.jpg', false, 1150, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3100, 2900, 'Сезам', '', 123, NULL, 0, 'images/IMG_1133.JPG', false, 1, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3150, 2900, 'Левантієць', '', 5977, NULL, 0, 'images/nfINId-JlCk.jpg', false, 1, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3200, 2900, 'ЛоконSe', '', 4269, NULL, 0, 'images/fJQVwg1Ndj0.jpg', false, 1, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3520, 2951, 'Zegor SAR-A181', '', 323, NULL, 0, 'images/zk12.jpg', false, 1, 153, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3250, 2900, 'Лабіринт', '', 2391, NULL, 0, 'images/gdiaHB106IY.jpg', false, 1, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3528, 3301, 'Zegor-BEY A730', '', 224, NULL, 0, 'images/zu8.jpg', false, 1, 154, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3516, 3300, 'Hansa 45120103', 'Однорычажный смеситель для душа, DN 15 (G1/2) для настенного монтажа расход: 17 л/мин, измеряется при давлении потока 3 бар • S-образные подключения DN 15 (G1/2) • DVGW в работе', 0, NULL, 0, 'images/zdk2.jpg', false, 1150, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3507, 2951, 'Hansa Cuisine 54902203', '', 600, NULL, 0, 'images/zk6.jpg', false, 1150, 187, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3451, 3300, 'HAIBA HANSBERG 003', '', 150, NULL, 0, 'images/zdk1.jpg', false, 950, 1, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3518, 2951, ' Zegor DYU-A180', 'Змішувач для кухні боковий на жовтій гайці.
ф40 безшумний керамічний катридж з збільшеним ресурсом, 
латунний корпус, покращений аератор змягчуючий воду,
надійне кріплення на усиленій гайці.', 200, NULL, 0, 'images/zk10.jpg', false, 1, 155, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3201, 2900, 'Трансформер', '', 9819, NULL, 10, 'images/GBuiNrYDtsA.jpg', true, 1000, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3511, 3301, 'Hansa Designo 51032173', '', 556, NULL, 0, 'images/zu6.jpg', false, 1150, 186, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3452, 3100, 'HAIBA HANSBERG 002', '', 250, NULL, 0, 'images/zb1.jpg', false, 950, 1, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3450, 2950, 'HAIBA HANSBERG 009', '', 200, NULL, 0, 'images/zv1.jpg', false, 950, 1, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3503, 2951, 'HAIBA GUDINI 018', '', 234, NULL, 0, 'images/zk5.jpg', false, 950, 150, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3500, 3301, 'HAIBA HANSBERG 001', '', 321, NULL, 0, 'images/zu2.jpg', false, 1000, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3508, 2951, 'Hansa Cuisine 54912233', '', 675, NULL, 0, 'images/zk7.jpg', false, 1150, 187, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3504, 2950, 'HAIBA GUDINI 006', '', 211, NULL, 0, 'images/zv3.jpg', false, 950, 150, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3505, 2950, 'Haiba', '', 0, NULL, 0, 'images/zv4.jpg', false, 950, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3400, 2951, 'Haiba Hansberg 004-25см', '', 155, NULL, 0, 'images/zk3.jpg', false, 950, 1, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3509, 3301, 'Hansa Cuisine 54932213', '', 1112, NULL, 0, 'images/zu4.jpg', false, 1150, 187, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3510, 3301, 'Hansa Designo 51032101', '', 865, NULL, 0, 'images/zu5.jpg', false, 1150, 186, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3512, 2951, 'Hansa Designo 51052102', '', 987, NULL, 0, 'images/zk8.jpg', false, 1150, 186, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3519, 2951, ' Zegor YUB-A182', 'Змішувач для кухні боковий на жовтій гайці.
ф40 безшумний керамічний катридж з збільшеним ресурсом,
надійне кріплення на усиленій гайці.', 436, NULL, 0, 'images/zk11.jpg', false, 1, 152, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3517, 2951, 'TBS-A179', 'Смеситель для кухни боковой.
Ф40 малошумный керамический картридж с повышенным ресурсом, латунный корпус, улучшенный аэратор смягчающий воду.', 166, NULL, 0, 'images/zk9.jpg', false, 1, 151, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3356, 2951, 'Haiba Hansberg017', '', 132, NULL, 0, 'images/zk1.jpg', false, 950, 1, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3357, 2951, 'Haiba Hansberg012', '', 145, NULL, 0, 'images/zk2.jpg', false, 950, 1, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3502, 2951, 'Haiba Hansberg 011', '', 155, NULL, 0, 'images/zk4.jpg', false, 950, 1, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3506, 3301, 'Hansa Pico 46042203', '', 345, NULL, 0, 'images/zu3.jpg', false, 1150, 188, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3533, 3301, 'Zegor-BIT-A182', 'Змішувач для умивальника (тюльпан).
ф40 катридж.', 165, NULL, 0, 'images/zu13.jpg', false, 1, 164, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3534, 3301, 'Zegor-BBS-A279', 'Змішувач для умивальника (тюльпан).
ф40 катридж. Латунний корпус.', 180, NULL, 0, 'images/zu14.jpg', false, 1, 165, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3536, 2950, ' Zegor-DFR-A605', 'Змішувач для ванни з шаровим переключателем.
кранбукса, 24(1/2 керам.), литий корпус.', 350, NULL, 0, 'images/zv6.jpg', false, 1, 167, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3650, 2950, 'utywetry', 'yert ert yert  ert ', 654, NULL, 0, 'images/default.jpg', false, 950, 150, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3541, 2950, 'Zegor-D4Q', 'Змішувач для ванни з шаровим переключателем.
кранбукса, 24(1/2 керам.), литий корпус.
масажна лійка.', 325, NULL, 0, 'images/zv11.jpg', false, 1, 172, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3538, 2950, 'Zegor-DMX', 'Змішувач для ванни 
кранбукса, 24(1/2 керам.), литий корпус.', 366, NULL, 0, 'images/zv8.jpg', false, 1, 169, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3539, 2950, 'Zegor-LML', 'Змішувач для ванни
кранбукса, 24(3/8разин.).', 299, NULL, 0, 'images/zv9.jpg', false, 1, 170, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3501, 2950, 'HAIBA HANSBERG 006', '', 300, NULL, 0, 'images/zv2.jpg', false, 950, 1, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3353, 3000, 'Kiturami TWIN ALPHA', 'Технические особенности Kiturami TWIN ALPHA:
Новый усовершенствованный медно-алюминиевый теплообменник.
Облегчённый расширительный бак, усовершенствованное крепление к корпусу котла Kiturami Twin Apha.
Установлен новый вентилятор с низким уровнем шума для поддержания стабильного давления в котле. Привод осуществляется от однофазного электродвигателя постоянного тока. Крепление на вибропоглащающей площадке.
Технология блокирования проникновения газообразных отходов.
Установлена горелка пропорционально контролируемого типа, потребление газа пропорционально контролируется, в зависимости от температуры горячей воды и отопления. Так образом расход газа минимизируется.
Энергосбережение достигается благодаря эффективной работе котла, оснащенного комнатным термостатом-регулятором с цифровой индикацией режимов «Сон», «Отсутствие», «Душ».
Блок управления, оснащенный системой выявления утечки газа, автоматически оповещает об утечке газа. В этом случае котел автоматически прекращает работу, что позволяет предотвратить аварийную ситуацию и избежать отравления угарным газом.
Когда температура воздуха резко понижается зимой, котел автоматически функционирует и поддерживает заданную температуру. Функционирование отопительного циркуляционного насоса предотвращает замерзание котла. При длительном отсутствии не выключайте котел. Настройте температуру котла на соответствующую температуру, чтобы предотвратить замораживание и образование трещин.
В случае неисправности мигает контрольная лампочка, и на дисплее комнатного термостата-регулятора появляется цифра, обозначающая вид неисправности. Это позволяет легко установить проичину внештатной ситуации.
В случае перегрева теплообменника, отключения электропитания или быстрого падения давления газа, система безопасности автоматически прекращает подачу газа. (При засорении выхлопных труб или когда затрудняется отвод газа ввиду направления ветра, система отслеживает эти условия и автоматически блокирует подачу газа).
Если уровень воды в котле ниже нормы срабатывает функция автоматического наполненения воды. (Если котел закрытого типа, тогда необходимо пополнять воду самостоятельно.
Возможность регулировки температуры горячей воды в диапазоне от 35°С до 60°С.', 0, NULL, 0, 'images/k2.jpg', false, 1100, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3354, 3000, 'Kiturami World Plus', 'Потребительские характеристики Kiturami World Plus:
Система накопительного теплообменника. Конструкция накопительного теплообменника позволяет предотвращать коррозийные процессы, повышает прочность теплообменника и срок эксплуатации котла;
Горелка с внутренним пламенем обеспечивает полное сгорание газа, снижая при этом расход;
Горячая вода: много и быстро. Теплосберегающая система, действующая по принципу термоса, позволяет получать достаточное количество горячей воды из накопительного бака;
Система безопасности: датчик утечки газа и сейсмодатчик. Установленные датчики утечки газа и сейсмодатчик обеспечивают безопасную работу котла в любых условиях.
Автоматическая система отключения газа. Тревожная сигнализация при самодиагностики. Защита от встречного ветра. Отключение при низком давлении. Устройство отключение при пожаре. Защита циркуляции. Защита от замерзания. Система накопительного теплообменника. Конструкция накопительного теплообменника позволяет предотвращать коррозийные процессы, повышает прочность теплообменника и срок эксплуатации котла. В котле Китурами впервые использована горелка с внутренним пламенем. Горелка с внутренним пламенем обеспечивает полное сгорание газа, снижая при этом расход газа. Теплосберегающая система, действующая по принципу термоса, позволяет получать достаточное количество горячей воды из накопительного бака. Установленные датчики утечки газа. Ипользование незамерзающих жидкостей. Экономия электроэнергии посредством выносного комнатного терморегулятора со встроенным цифровым управлением позволяющим использовать и программировать рабочие режимы.', 0, NULL, 0, 'images/k3.jpg', false, 1000, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3529, 3301, ' Zegor-JAF-A725', 'Змішувач для умивальника (тюльпан) 
литий корпус', 225, NULL, 0, 'images/zu9.jpg', false, 1, 160, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3527, 2951, 'Zegor TOE A-827', 'Змішувач для кухні на метал. гайці.', 122, NULL, 0, 'images/zk19.jpg', false, 1, 159, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3526, 2951, ' POP A-031 25см', 'Змішувач для кухні 
ф40 катридж.', 140, NULL, 0, 'images/zk18.jpg', false, 1, 158, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3525, 2951, 'Zegor POP B-031 15см', 'Змішувач для кухні 
ф40 катридж.', 200, NULL, 0, 'images/zk17.jpg', false, 1, 158, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3524, 2951, 'Zegor PDF A-283 25см.', 'Змішувач для кухні на гайці.
ф40 катридж', 313, NULL, 0, 'images/zk16.jpg', false, 1, 157, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3523, 2951, 'Zegor PDF B-283 15 см.', 'Змішувач для кухні на гайці.
ф40 катридж', 170, NULL, 0, 'images/zk15.jpg', false, 1, 157, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3522, 2951, 'Zegor PED A-279 25', 'Змішувач для кухнi на жовтій гайці
ф40 катридж, латунний корпус.', 155, NULL, 0, 'images/zk14.jpg', false, 1, 156, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3521, 2951, ' Zegor PED B-182', 'Змішувач для кухні на жовтій гайці
ф40 катридж, латунний корпус.', 135, NULL, 0, 'images/zk13.jpg', false, 1, 156, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3530, 3301, ' Zegor-JAP-A827', 'Змішувач для умивальника (тюльпан) 
литий корпус.', 200, NULL, 0, 'images/zu10.jpg', false, 1, 161, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3531, 3301, 'Zegor-TLK-A119', 'Кран для раковини( моно)
литий корпус', 150, NULL, 0, 'images/zu11.jpg', false, 1, 162, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3548, 2950, ' Zegor-ECT', '', 0, NULL, 0, 'images/zv18.jpg', false, 1, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3549, 2950, ' Zegor-NGB', 'Змішувач для ванни 
Новинка!!!', 0, NULL, 0, 'images/zv19.jpg', false, 1, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3551, 2950, 'Zegor-NKE', 'Змішувач для ванни .
ф40 катридж, покращений поворотний переключатель
на корпусі.', 0, NULL, 0, 'images/zv21.jpg', false, 1, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3552, 2950, 'Zegor-NLY', 'Змішувач для ванни .
ф40 катридж, покращений поворотний переключатель
на корпусі.', 0, NULL, 0, 'images/zv22.jpg', false, 1, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3553, 2950, 'Zegor-NPO', 'Змішувач для ванни .
ф40 катридж, покращений поворотний переключатель
на корпусі.', 0, NULL, 0, 'images/zv23.jpg', false, 1, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3554, 2950, ' Zegor-NVL', 'Змішувач для ванни .
ф40 катридж, покращений поворотний переключатель
на корпусі, латунний корпус, 
масажна лійка, душовий шланг двослойний розтяжний.', 0, NULL, 0, 'images/zv24.jpg', false, 1, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3355, 3000, 'Kiturami EcoCondensing', 'Наилучший показатель по выбросу Nox и СО. Электронная система контроля потребления газа – пропорционально нагреву температуры теплоносителя и с преимуществом мгновенного нагрева ГВС. Использование в теплообменнике таких материалов как: медной трубки теплоносителя, алюминиевых секций радиаторов и нержавеющей стали теплообменника, позволяют увеличить ресурс работы теплообменника до 20 лет. Емкость с нейтрализатором кислоты – разряжает сконденсированную воду от PH-3 до PH-6. Вода выходит из котла неагрессивной и пригодной к сливу в канализацию. Котел оснащен дистанционным пультом управления с комнатным термостатом. Функция предотвращения промерзания котла в зимнее время года. Наличие датчика утечки газа.', 0, NULL, 0, 'images/k4.jpg', false, 1100, NULL, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3535, 3301, 'Zegor-BEA-A112', 'Змішувач для умивальника (тюльпан).
ф40 катридж.', 123, NULL, 0, 'images/zu15.jpg', false, 1, 166, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3600, 2950, 'test product', '', 0, NULL, 0, 'images/default.jpg', false, 950, 1, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3532, 3301, 'Zegor-TZF-A605', '', 160, NULL, 0, 'images/zu12.jpg', false, 1, 163, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3540, 2950, 'Zegor-D3Q', 'Змішувач для ванни з шаровим переключателем.
кранбукса, 24(1/2 керам.), литий корпус.
масажна лійка.', 500, NULL, 0, 'images/zv10.jpg', false, 1, 171, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3542, 2950, ' Zegor-D5Q', 'Змішувач для ванни з трипозиційним катріджним переключателем.
литий корпус. плоский прямий гусак 35см., 
масажна лійка, Душовий шланг двослойний розтяжний.', 550, NULL, 0, 'images/zv12.jpg', false, 1, 173, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3543, 2950, 'Zegor-DST', 'Змішувач для ванни з дво позиційним катріджним переключателем.
кранбукса, 24(1/2 керам.), латунний корпус,
плоский прямий гусак, масажна лійка.', 415, NULL, 0, 'images/zv13.jpg', false, 1, 174, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3544, 2950, ' Zegor-SEA', 'Змішувач для ванни з коротким зливом.
ф40 катридж.', 220, NULL, 0, 'images/zv14.jpg', false, 1, 175, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3545, 2950, 'Zegor-SIT', 'Змішувач для ванни з коротким зливом.
ф40 катридж.', 200, NULL, 0, 'images/zv15.jpg', false, 1, 176, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3546, 2950, 'Zegor-SWZ', 'Змішувач для ванни з коротким зливом.
ф40 катридж. латю корпус.', 210, NULL, 0, 'images/zv16.jpg', false, 1, 177, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3547, 2950, 'Zegor-LOP', 'Змішувач для ванни 
ф40 катридж', 259, NULL, 0, 'images/zv17.jpg', false, 1, 178, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3537, 2950, 'Zegor-DMT', 'Змішувач для ванни з дво позиційним катріджним переключателем.
кранбукса, 24(1/2 керам.), литий корпус.
масажна лійка.', 325, NULL, 0, 'images/zv7.jpg', false, 1, 168, false);

INSERT INTO product (id, product_category_id, name, description, price, discount_price, discount, image, sale, producer_id, range_id, published)
VALUES (3515, 2950, 'Hansa 45112103', 'Однорычажный смеситель для ванны, DN 15 (G1/2) для настенного монтажа расход: 20/19 л/мин (излив/душ), измеряется при давлении потока 3 бар • переключение - автоматический возврат в исходное положение душ/ванна • S-образные подключения DN 15 (', 0, NULL, 0, 'images/zv5.jpg', false, 1150, NULL, false);

--
-- Data for table public.comment (OID = 34821) (LIMIT 0,37)
--
INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (150, 3353, 'Скільки часу триватиме достовка?', '2013-11-06', 'Андрій Вінтонів');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (1250, 3452, 'fgjghf', '2013-11-11', 'jfhg');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (550, 3503, 'asdfasdfj jklsdajf lkdsjf jsd iojpsio

', '2013-11-07', 'Андрій Вінтонів');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (401, 3503, 'Перший відгук, що відпралено на email.', '2013-11-06', 'Андрій Вінтонів');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (1200, 3452, 'fgjghf', '2013-11-11', 'jfhg');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (1100, 3452, 'fgjghf', '2013-11-11', 'jfhg');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (1150, 3452, 'fgjghf', '2013-11-11', 'jfhg');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (400, 3503, 'Перший відгук, що відпралено на email.', '2013-11-06', 'Андрій Вінтонів');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (350, 3503, 'Перший відгук, що відпралено на email.', '2013-11-06', 'Андрій Вінтонів');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (301, 3503, 'Другий відгук, що відпралено на email.', '2013-11-06', 'Андрій Вінтонів');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (300, 3503, 'Перший відгук, що відпралено на email.', '2013-11-06', 'Test user');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (201, 3503, 'Дуже стильний дизайн. І якість відповідна. Дуже задоволений.', '2013-11-06', 'Андрій Вінтонів');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (500, 3503, 'ghfkhjytdkjh hgf  gfh', '2013-11-07', 'kikik');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (450, 3503, 'ghfkhjytdkjh hgf  gfh', '2013-11-06', 'Андрій Вінтонів');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (1350, 3508, 'jhgfjgh', '2013-12-02', 'jfghj');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (1000, 3504, 'hljk', '2013-11-08', 'lhjkl');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (950, 3504, 'fghjkjhjklh', '2013-11-08', 'jfgh jf');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (900, 3504, 'fghjkj', '2013-11-08', 'jfgh jf');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (101, 3504, 'ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo oooooooooooooooooooooooooooooooooooooooooo oooooooooooooooooooooooooooooooooooooooooooooooo ooooooooooooooooooooooooooooooooooooooooooooooo ooooooooooooooooooooooooooooooooooooooooo oooooooooooooooooooooooooooooooooo ooooooooooooooooooooooooooooooooooooooooooooooooooo oooooooooooooooooooooooooo oooooooooooooooooooooooooooooooooooooo oooooooooooooooooooooo ooooooooooooooo oooooooooooooooooo oooooooooooooooooooo oooooooooooooooooooo oooooooooooooooooooooooooo oooooooooooooooooooooo ooooooooooooooooooooo oooooooooooooo ooooooooooooo ooooooooooooooo oooooooooooooooooo oooooooooooo ooooooooo ooooooooooooo oooooooooooooooo ooooooooooooo ooooooooooo oooooooo ooooooooooo oooooooooooo ooooooooooooo oooooooooooooooo ooooooooooooo oooooooooooo ooooo ooooooooooo ooooooo oooooooo oooo ooooooo oooooooooooo oooooooooo oooo oooooooooooo oooooo oooooooo oooooooooooooo oooooooooo oooooooooooo oooooooo ooooooooooooo oooooo ooooooooo ooooo ooooooooo ooooooooo oooooooooooo oo ooooooooooo ooooooo oooooooo oooo oooooooooo oooooooooooo oooooooooo ooooooo oooooooooooo oooooooooooooo oooooooooooo ooooooooooooooooo ooooooooooooooo oooooooooooooo oooooooooooooooo ooooooooooooooooo ooooooooooooo ooooooooooo oooooooooooooo ooooooooooooooo oooooooooo ooooooooooo oooooooooooooo oooooooooooo oooooooooooooo ooooooooo ooooooooooo oooooooooo oooooooooooooo ooooooooooo oooooooooo oooooooooooooooo ooooooooooooooooo ooooooooooooo oooo o ooooooooooooooooooo ooooooooooooo ooooooooooooooo ooooooooooooo ooooooooooo ooooooooooo ooooooooooooooo ooooooooooooo ooooooooooo oooooooooooooo oooooooooooo ooooooooooooooooooo ooooooooooo oooooooooooooooooooo oooooooooooooooo ooooooooooooooooooooooooooooooooooooo ooooooooooooo ooooooooooooooooooo ooooooooooooooooooooooooo oooooooooooooooooooooo ooooooooooooooooooooooooo ooooooooooooooooooooooooooooooooo ooooooooooooooo ooooooooooo ooooooooooooo ooooooooooooo oooooooooooo oooooooooooooo ooooooooooooo ooooooooooooo oooooooooooo ooooooooooo ooooooooooo oooooooooooo  oooooooooooooooo ooooooooooooo oooooooooooooo ooooooooooo ooooooooooooo  oooooooooooo oooooooooooooooo oooooooooooooo ooooooooooooo ooooooooooooooooooooooooo oooooooooooooooo oooooooooooooooooo ooooooooooooooooooo ooooooooooooooooooooooo ooooooooooooooooooooooo oooooooooooooo ooooooooooooooooooooo oooooooooooooo ooooooooooooooooo oooooooooooooooo oooooooooooooooo ooooooooooooooooo  ooooooooooooooooooooo  oooooooooooooooooo oooooooooooooooo oooooooooooo oooooooooooooooooooooooooo oooooooooooo ooooooooooooooo ooooooooo oooooooo oooooooooo oooooooooooooo oooooooooooo ooooooooooooo ooooooooooooooo oooooooooooooooooooooo oooooooooooooooo oooooooooooooooooooooo ooooooooooooooo oooooooooooooo ooooooooooooooo ooooooooooo ooooooooooooo ooooooooooooooooo oooooooooooooooooooooo ooooooooooooo ooooooooooooo ooooooooooooooo ooooooooooooo ooooooooooooooooooooooooooo
 ', '2013-11-06', 'Andriy Vintoniv');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (850, 3504, 'hfhtrtyh', '2013-11-08', ' hdgfh');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (750, 3537, 'ljkhlhjlhj', '2013-11-07', 'Андрій Вінтонів');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (701, 3537, 'ljkhlhjlhj', '2013-11-07', 'Андрій Вінтонів');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (700, 3537, 'ljkhlhjlhj', '2013-11-07', 'Андрій Вінтонів');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (650, 3537, 'kjhkjghk', '2013-11-07', 'Андрій Вінтонів');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (600, 3537, 'Норм змішувач', '2013-11-07', 'Андрій Вінтонів');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (752, 3513, 'hgf gfj fghjfgh jh fgh fgh ', '2013-11-07', 'Андрій Вінтонів');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (751, 3513, 'jfyt jhgfj fghjf', '2013-11-07', 'Андрій Вінтонів');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (800, 3504, 'hfhtrtyh', '2013-11-08', ' hdgfh');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (250, 3504, 'Останній відгук', '2013-11-06', 'Андрій Вінтонів');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (202, 3504, 'дролдролдордглпоь рпольор л', '2013-11-06', 'Андрій Вінтонів');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (100, 3504, 'Хороший змішувач. Ціна відповідає якості.', '2013-11-06', 'Andriy Vintoniv');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (50, 3504, 'ololo', '2013-11-06', 'user');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (1050, 3505, 'апврвапр', '2013-11-11', 'рвапр');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (1400, 3515, 'чого така низька ціна?', '2014-03-25', 'Андрій Вінтонів');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (1450, 3501, 'trtrtrt', '2014-04-16', 'rtrt');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (1300, 3501, 'hdfghdfg hdfg dfg hgfd  dfg ', '2013-11-11', 'Andriy Vintoniv');

INSERT INTO comment (id, product_id, content, date, owner_name)
VALUES (200, 3501, 'ghjk', '2013-11-06', 'ghjk');

--
-- Data for table public.settings (OID = 34827) (LIMIT 0,259)
--
INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3957, 3505, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3958, 3505, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3653, 3452, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4036, 3452, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3961, 3508, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4300, 3650, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4301, 3650, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3150, 3100, 'Профіль', '30x10');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3151, 3100, 'Розмір', '2000х1250х1370');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3152, 3100, 'Профіль', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3153, 3100, 'Розмір', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3154, 3100, 'Профіль', '30x10x15 25x25x2.0');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3155, 3100, 'Розмір', '2000х1250х1370');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3156, 3100, 'Профіль', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3157, 3100, 'Розмір', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3200, 3200, 'Профіль', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3201, 3200, 'Розмір', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3202, 3200, 'Профіль', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3203, 3200, 'Розмір', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3204, 3101, 'Профіль', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3205, 3101, 'Розмір', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3206, 3101, 'Профіль', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3207, 3101, 'Розмір', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3208, 3201, 'Профіль', 'Se');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3209, 3201, 'Розмір', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3210, 3201, 'Профіль', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3211, 3201, 'Розмір', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3250, 3201, 'Профіль', 'Seff dfsggdsfg ');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3251, 3201, 'Розмір', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3252, 3201, 'Профіль', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3253, 3201, 'Розмір', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (2800, 3250, 'Профіль', '40х40х1,5');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (2801, 3250, 'Розмір', '40х40х1,5');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (2802, 3100, 'Профіль', '30x10x15');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (2803, 3100, 'Розмір', '2000х1250х1370');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3450, 3201, 'Профіль', 'Se');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3451, 3201, 'Розмір', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3452, 3201, 'Профіль', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3453, 3201, 'Розмір', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3552, 3352, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3556, 3354, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3557, 3355, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3558, 3356, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3559, 3357, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3600, 3400, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3650, 3450, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3651, 3450, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3652, 3451, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3700, 3354, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3750, 3354, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3800, 3354, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3801, 3354, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3802, 3354, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3850, 3201, 'Профіль', 'Se');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3851, 3201, 'Розмір', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3852, 3201, 'Профіль', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3853, 3201, 'Розмір', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3854, 3101, 'Профіль', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3855, 3101, 'Розмір', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3856, 3101, 'Профіль', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3857, 3101, 'Розмір', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3900, 3451, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3901, 3356, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3902, 3357, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3950, 3500, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3953, 3502, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3959, 3506, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3960, 3507, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3962, 3507, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3963, 3509, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3964, 3509, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3965, 3510, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3966, 3511, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3967, 3512, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3969, 3512, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3970, 3514, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3973, 3516, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3974, 3517, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3975, 3518, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3976, 3519, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3977, 3520, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3978, 3521, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3979, 3522, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3980, 3523, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3981, 3524, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3982, 3525, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3983, 3526, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3984, 3527, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3985, 3528, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3986, 3529, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3987, 3530, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3988, 3531, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3989, 3532, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3990, 3533, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3991, 3534, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3992, 3535, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3993, 3536, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3994, 3536, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3997, 3538, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3998, 3538, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3999, 3539, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4000, 3539, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4001, 3540, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4002, 3540, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4003, 3541, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4004, 3541, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4005, 3542, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4006, 3542, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4007, 3543, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4008, 3543, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4009, 3544, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4010, 3544, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4011, 3545, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4012, 3545, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4013, 3546, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4014, 3546, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4015, 3547, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4016, 3547, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4017, 3548, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4018, 3548, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4019, 3549, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4020, 3549, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4023, 3551, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4024, 3551, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4025, 3552, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4026, 3552, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4027, 3553, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4028, 3553, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4029, 3554, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4030, 3554, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4031, 3355, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4032, 3355, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4033, 3400, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4034, 3450, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4035, 3450, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4037, 3201, 'Профіль', 'Se');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4038, 3201, 'Розмір', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4039, 3201, 'Профіль', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4040, 3201, 'Розмір', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4041, 3451, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4042, 3356, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4043, 3357, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4044, 3500, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4045, 3352, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4050, 3502, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4051, 3506, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4052, 3518, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4053, 3511, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4100, 3500, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4103, 3400, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4104, 3450, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4105, 3450, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3553, 3353, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3554, 3353, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3954, 3503, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3995, 3537, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3996, 3537, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3968, 3513, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4150, 3600, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4151, 3600, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4152, 3600, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4153, 3600, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4154, 3600, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4155, 3600, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4157, 3511, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4163, 3517, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4164, 3514, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4165, 3507, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3951, 3501, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3952, 3501, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4166, 3509, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4167, 3509, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4168, 3510, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4169, 3512, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4170, 3519, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4171, 3520, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4172, 3528, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4174, 3517, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4175, 3507, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4176, 3451, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4177, 3356, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4178, 3357, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4179, 3502, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4180, 3506, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4181, 3518, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4182, 3529, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4183, 3527, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4184, 3526, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4185, 3525, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4186, 3524, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4187, 3523, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4188, 3522, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4189, 3521, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4190, 3511, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4192, 3450, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4193, 3450, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4194, 3450, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4195, 3450, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4196, 3450, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4197, 3450, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4198, 3400, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4199, 3400, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4204, 3530, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4205, 3531, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4206, 3532, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4207, 3533, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4208, 3534, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4209, 3535, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4210, 3536, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4211, 3536, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4214, 3538, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4215, 3538, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4216, 3538, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4217, 3538, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4218, 3539, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4219, 3539, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4220, 3540, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4221, 3540, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4222, 3541, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4223, 3541, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4224, 3542, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4225, 3542, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4226, 3543, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4227, 3543, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4228, 3544, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4229, 3544, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4230, 3545, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4231, 3545, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4232, 3546, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4233, 3546, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4234, 3547, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4235, 3547, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4250, 3514, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4251, 3514, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3955, 3504, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3956, 3504, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4160, 3504, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4161, 3504, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4156, 3452, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4191, 3452, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3555, 3353, '', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4162, 3508, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4173, 3508, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4158, 3503, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4159, 3503, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4212, 3537, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4213, 3537, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3971, 3515, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (3972, 3515, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4046, 3501, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4047, 3501, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4048, 3501, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4049, 3501, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4101, 3501, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4102, 3501, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4200, 3501, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4201, 3501, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4202, 3501, 'Тип', '');

INSERT INTO settings (id, product_id, property_name, property_value)
VALUES (4203, 3501, 'Тип', '');

--
-- Data for table public.user_role (OID = 34833) (LIMIT 0,9)
--
INSERT INTO user_role (user_id, role_id)
VALUES (1, 1);

INSERT INTO user_role (user_id, role_id)
VALUES (1, 2);

INSERT INTO user_role (user_id, role_id)
VALUES (3300, 2);

INSERT INTO user_role (user_id, role_id)
VALUES (3350, 2);

INSERT INTO user_role (user_id, role_id)
VALUES (3450, 2);

INSERT INTO user_role (user_id, role_id)
VALUES (3500, 2);

INSERT INTO user_role (user_id, role_id)
VALUES (3600, 2);

INSERT INTO user_role (user_id, role_id)
VALUES (3650, 2);

INSERT INTO user_role (user_id, role_id)
VALUES (3750, 2);

--
-- Data for table public.category_settings (OID = 34836) (LIMIT 0,65)
--
INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1250, 'Профіль', 'TEXT', 2900, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1251, 'Розмір', 'TEXT', 2900, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1300, 'Профіль', 'TEXT', 2900, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1301, 'Розмір', 'TEXT', 2900, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1350, 'Тип', 'TEXT', 2950, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1351, 'Тип', 'TEXT', 2951, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1352, 'Тип', 'TEXT', 2950, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1400, '', 'TEXT', 3000, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1450, '', 'TEXT', 3050, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1500, '', 'TEXT', 3100, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1600, '', 'TEXT', 3300, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1601, '', 'TEXT', 3301, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1650, '', 'TEXT', 3350, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1651, '', 'TEXT', 3350, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1700, '', 'TEXT', 3350, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1701, '', 'TEXT', 3350, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1702, '', 'TEXT', 3400, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1703, '', 'TEXT', 3400, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1704, '', 'TEXT', 3401, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1705, '', 'TEXT', 3402, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1706, '', 'TEXT', 3403, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1707, '', 'TEXT', 3404, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1708, '', 'TEXT', 3405, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1709, '', 'TEXT', 3406, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1710, '', 'TEXT', 3407, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1711, '', 'TEXT', 3408, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1750, '', 'TEXT', 3450, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1751, '', 'TEXT', 3451, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1752, '', 'TEXT', 3452, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1800, '', 'TEXT', 3500, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1801, '', 'TEXT', 3500, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1802, '', 'TEXT', 3500, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1803, '', 'TEXT', 3500, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1850, '', 'TEXT', 3500, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1851, '', 'TEXT', 3500, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1852, '', 'TEXT', 3500, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1853, '', 'TEXT', 3500, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1854, '', 'TEXT', 3500, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1855, '', 'TEXT', 3500, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1856, '', 'TEXT', 3500, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1857, '', 'TEXT', 3500, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1858, '', 'TEXT', 3500, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1859, '', 'TEXT', 3500, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1860, '', 'TEXT', 3500, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1861, '', 'TEXT', 3500, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1862, '', 'TEXT', 3550, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1863, '', 'TEXT', 3551, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1864, '', 'TEXT', 3552, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1865, '', 'TEXT', 3553, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1866, '', 'TEXT', 3554, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1867, '', 'TEXT', 3555, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1868, '', 'TEXT', 3556, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1869, '', 'TEXT', 3557, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1870, '', 'TEXT', 3558, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1871, '', 'TEXT', 3559, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1872, '', 'TEXT', 3560, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1873, '', 'TEXT', 3561, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1874, '', 'TEXT', 3562, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1875, '', 'TEXT', 3563, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1876, '', 'TEXT', 3564, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1877, '', 'TEXT', 3565, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1878, '', 'TEXT', 3565, NULL);

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1879, '', 'TEXT', 3566, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1880, '', 'TEXT', 3567, '');

INSERT INTO category_settings (id, field_name, field_type, category_id, unit)
VALUES (1881, '', 'TEXT', 3568, '');

--
-- Data for table public.producer (OID = 34844) (LIMIT 0,5)
--
INSERT INTO producer (id, name, image, description, published)
VALUES (1000, 'Test producer', 'images/default.jpg', NULL, false);

INSERT INTO producer (id, name, image, description, published)
VALUES (1100, 'Kiturami', 'images/kiturami-kombi.jpg', NULL, false);

INSERT INTO producer (id, name, image, description, published)
VALUES (1, 'Zegor', 'images/zegor.jpg', 'Марка «Zegor» от фирмы «Touzhen» пришла на украинский рынок в 2007 году и быстро завоевала своих поклонников.

Фабрика сантехнического оборудования позволяет использовать новейшие технологии и устанавливать высокие стандарты качества.

Работая в сантехнической сфере, мы всегда ставим качество продукции на первое место. Поэтому внедряем в производство новейшие технологии литья и нанесения покрытий, гарантирующих беспрецедентно высокий уровень нашего сантехнического товара.', false);

INSERT INTO producer (id, name, image, description, published)
VALUES (1150, 'Hansa', 'images/Hansa-Logo.jpg', '', false);

INSERT INTO producer (id, name, image, description, published)
VALUES (950, 'Haiba', 'images/haiba.jpg', 'Вот уже более 20 лет китайская корпорация Haiba разрабатывает различную сантехническую продукцию. За этот период компания завоевала престижные позиции в своей отрасли. Она является просто гигантом по производству сантехники. Территория компании занимает целых 90 000 квадратных метров. В год она производит более 6 миллионов экземпляров смесителей. Каждый из них соответствует мировому уровню качества. Это достигается благодаря стандартизованной системе управления производством. А также за счет использования передового высокотехнологичного оборудования на всех заводах компании. В корпорации присутствует современная база для инновационных разработок.

Применяемые в бытовом использовании изделия прекрасно дополнят общий интерьер кухни. Также вы можете обустроить свою столовую и ванную комнату. Смесители Haiba отличают аккуратные ручки, усиленные гайки. Дизайнерское исполнение также присуще этим изделиям.

Приятная новость для покупателей. Смеситель Haiba включает полную комплектацию для быстрой и простой установки. Наружные части арматуры изделий сначала покрываются слоем никеля. Это дает защиту от коррозии. Затем подвергаются хромированию. Это исключает развитие и размножение микроорганизмов на поверхности металла. Огромный выбор кухонных смесителей отличается разнообразием оригинальных форм рычагов, носиков и т. д.

Те, кому нужно подобрать смеситель для ванной, тоже останутся довольны. Их выбор не менее внушителен и разнообразен. В каждой коллекции имеется своя оригинальная модель, которая подойдет к любому интерьеру. ', false);

--
-- Data for table public.category_producer (OID = 34852) (LIMIT 0,20)
--
INSERT INTO category_producer (category_id, producer_id)
VALUES (2950, 1);

INSERT INTO category_producer (category_id, producer_id)
VALUES (2951, 1);

INSERT INTO category_producer (category_id, producer_id)
VALUES (3100, 1);

INSERT INTO category_producer (category_id, producer_id)
VALUES (3300, 1);

INSERT INTO category_producer (category_id, producer_id)
VALUES (3301, 1);

INSERT INTO category_producer (category_id, producer_id)
VALUES (1, 1);

INSERT INTO category_producer (category_id, producer_id)
VALUES (2950, 1150);

INSERT INTO category_producer (category_id, producer_id)
VALUES (2951, 1150);

INSERT INTO category_producer (category_id, producer_id)
VALUES (3100, 1150);

INSERT INTO category_producer (category_id, producer_id)
VALUES (3300, 1150);

INSERT INTO category_producer (category_id, producer_id)
VALUES (3301, 1150);

INSERT INTO category_producer (category_id, producer_id)
VALUES (1, 1150);

INSERT INTO category_producer (category_id, producer_id)
VALUES (2, 1100);

INSERT INTO category_producer (category_id, producer_id)
VALUES (3000, 1100);

INSERT INTO category_producer (category_id, producer_id)
VALUES (2950, 950);

INSERT INTO category_producer (category_id, producer_id)
VALUES (2951, 950);

INSERT INTO category_producer (category_id, producer_id)
VALUES (3100, 950);

INSERT INTO category_producer (category_id, producer_id)
VALUES (3300, 950);

INSERT INTO category_producer (category_id, producer_id)
VALUES (3301, 950);

INSERT INTO category_producer (category_id, producer_id)
VALUES (1, 950);

--
-- Data for table public.range (OID = 34858) (LIMIT 0,40)
--
INSERT INTO range (id, name, producer_id, image, published)
VALUES (150, 'Gudini', 950, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (151, 'TBS', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (152, 'YUB', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (153, 'SAR', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (154, 'BEY', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (155, 'DYU', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (156, 'PED', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (157, 'PDF', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (158, 'POP', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (159, 'TOE', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (160, 'JAF', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (161, 'JAP', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (162, 'TLK', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (163, 'TZF', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (164, 'BIT', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (165, 'BBS', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (166, 'BEA', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (167, 'DFR', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (168, 'DMT', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (169, 'DMX', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (170, 'LML', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (171, 'D3Q', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (172, 'D4Q', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (173, 'D5Q', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (174, 'DST', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (175, 'SEA', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (176, 'SIT', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (177, 'SWZ', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (178, 'LOP', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (179, 'ECT', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (180, 'NGB', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (181, 'NHK', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (182, 'NKE', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (183, 'NLY', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (184, 'NPO', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (185, 'NVL', 1, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (186, 'Designo', 1150, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (187, 'Cuisine', 1150, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (188, 'Pico', 1150, NULL, false);

INSERT INTO range (id, name, producer_id, image, published)
VALUES (1, 'Hansberg', 950, 'images/hansberg.jpg', false);

--
-- Data for table public.static_page (OID = 34866) (LIMIT 0,11)
--
INSERT INTO static_page (id, title, description, url, location, published, reserved, content)
VALUES (350, 'test CKEditor', '', 'test-ckeditor', 'TOP_MENU', false, false, '<h3><img alt="" src="http://localhost:1234/images/%D0%B7%D0%BC%D1%96%D1%88%D1%83%D0%B2%D0%B0%D1%87%20%D0%B4%D0%BB%D1%8F%20%D0%B2%D0%B0%D0%BD%D0%BD%D0%B8.jpg" style="float:left; height:195px; margin-right:10px; width:230px" />Test CKEditor</h3>

<div class="user-content-block">
<p>Steps:</p>

<p>1. Go to staging.openideo.com<br />
2. Open any test challenge<br />
3. Write a comment into corresponding text field<br />
4. Click on [Post comment] button several times<br />
5. Verify the behavior</p>

<p>Expected ReSult: One comment should be posted.<br />
Actual Result: The same comment is posted several times.</p>

<p>The issue reproduced for comments and replies on blog post, challenge and contribution pages.</p>
</div>

<p><img alt="smiley" src="http://localhost:8080/discount/js/libs/ckeditor/plugins/smiley/images/regular_smile.png" style="height:23px; width:23px" title="smiley" /></p>

<p>&nbsp;</p>

<h2>Details</h2>

<div class="mod-content">
<ul>
	<li>
	<div class="wrap"><strong>Status:</strong> <img alt="Reopened" src="https://jira.epam.com/jira/images/icons/statuses/reopened.png" style="height:16px; width:16px" title="Reopened - This issue was once resolved, but the resolution was deemed incorrect. From here issues are either marked assigned or resolved." /> Reopened (<a class="issueaction-viewworkflow" href="https://jira.epam.com/jira/plugins/servlet/workflow/thumbnail/getThumbnail?workflowName=IDEO-JSUP+Workflow&amp;stepId=5&amp;width=full&amp;height=full" title="IDEO-JSUP Workflow: IDEOJSUP-374">View Workflow</a>)</div>
	</li>
	<li>
	<div class="wrap"><strong>Priority:</strong> <img alt="Minor" src="https://jira.epam.com/jira/images/icons/priorities/minor.png" style="height:16px; width:16px" title="Minor - Minor loss of function, or other problem where easy workaround is present." /> Minor <img alt="" src="http://localhost:1234/images/%D0%B7%D0%BC%D1%96%D1%88%D1%83%D0%B2%D0%B0%D1%87%20%D0%B4%D0%BB%D1%8F%20%D0%BA%D1%83%D1%85%D0%BD%D1%96.jpg" style="float:right; height:370px; width:340px" /></div>
	</li>
	<li>
	<div class="wrap"><strong>Resolution:</strong> Unresolved</div>
	</li>
	<li>
	<div class="wrap"><strong>Affects Version/s:</strong> None</div>
	</li>
	<li>
	<div class="wrap">
	<p><strong>Fix Versio</strong></p>

	<ul>
		<li>
		<div class="wrap"><strong>Type:</strong> <img alt="Bug" src="https://jira.epam.com/jira/images/icons/issuetypes/bug.png" style="height:16px; width:16px" title="Bug - A problem which impairs or prevents the functions of the product." /> Bug</div>
		</li>
	</ul>
	<strong>n/s:</strong> None</div>
	</li>
	<li>
	<div class="wrap"><strong>Security Level:</strong> IDEO-JSUP Client oicom</div>
	</li>
	<li>
	<div class="wrap" id="wrap-labels"><strong>Labels:</strong>
	<div class="labels-wrap value editable-field inactive" title="Click to edit">None</div>
	</div>
	</li>
	<li>
	<div class="wrap"><strong>Environment:</strong>
	<div class="value editable-field inactive" id="environment-val" title="Click to edit">
	<p>staging.openideo.com</p>
	</div>
	</div>
	</li>
</ul>

<div id="customfieldmodule">
<div class="aui-tabs horizontal-tabs" id="customfield-tabs">
<div class="tabs-pane active-pane" id="customfield-panel-1">
<ul>
	<li>
	<div class="wrap"><strong>Rank:</strong>

	<div class="value type-gh-global-rank" id="customfield_10800-val">390869</div>
	</div>
	</li>
	<li>
	<div class="wrap"><strong>Customer:</strong>
	<div class="value type-select editable-field inactive" id="customfield_15109-val" title="Click to edit">Client oicom</div>
	</div>
	</li>
</ul>
</div>
</div>
</div>
</div>

<div class="mod-header" id="descriptionmodule_heading">
<ul>
</ul>

<h2>Description</h2>
</div>
');

INSERT INTO static_page (id, title, description, url, location, published, reserved, content)
VALUES (51, 'Test Static Page', 'this is the first test static page', 'test-static-page', NULL, false, false, '');

INSERT INTO static_page (id, title, description, url, location, published, reserved, content)
VALUES (400, 'tttt', '', 'ttttt', NULL, false, false, '<h1 style="font-style: italic;"><span style="font-family:georgia,serif">ewrtwert ewrt wert wer t</span></h1>

<p>&nbsp;</p>
');

INSERT INTO static_page (id, title, description, url, location, published, reserved, content)
VALUES (1, 'Про Нас', NULL, '/about', 'BOTTOM_MENU', true, true, NULL);

INSERT INTO static_page (id, title, description, url, location, published, reserved, content)
VALUES (2, 'Контакти', NULL, '/contacts', 'BOTTOM_MENU', true, true, NULL);

INSERT INTO static_page (id, title, description, url, location, published, reserved, content)
VALUES (3, 'Розпродаж', NULL, '/sale', 'BOTTOM_MENU', true, true, NULL);

INSERT INTO static_page (id, title, description, url, location, published, reserved, content)
VALUES (4, 'Акції', NULL, '/special-offers', 'TOP_MENU', true, true, NULL);

INSERT INTO static_page (id, title, description, url, location, published, reserved, content)
VALUES (5, 'Оплата', '', '/payment', 'TOP_MENU', false, true, '<h3>Подбор и&nbsp;оплата Авиабилета</h3>

<p>После выбора параметров и&nbsp;направления маршрута нажмите на&nbsp;кнопку &laquo;Найти&raquo;. Вам будут предложены доступные на&nbsp;данный момент авиабилеты. С&nbsp;помощью фильтров выберите желаемое количество пересадок, время в&nbsp;пути, а&nbsp;также период времени вылета и&nbsp;прибытия.<br />
Нажмите кнопку &laquo;Забронировать&raquo; на&nbsp;подходящем билете.<br />
Далее необходимо заполнить информацию о&nbsp;пассажире(ах). Имя и&nbsp;фамилию пассажира необходимо заполнять латинскими буквами&nbsp;&mdash; так&nbsp;же, как в&nbsp;загранпаспорте. Все поля в&nbsp;форме &laquo;Информация о&nbsp;пассажирах&raquo; должны быть заполнены. В&nbsp;данных покупателя обязательно укажите свой номер телефона и&nbsp;Email.</p>

<p>При нажатии кнопки &laquo;Забронировать&raquo; автоматически будут проверены все поля анкеты и&nbsp;в&nbsp;случае отсутствия какой-либо информации система выдаст информационное сообщение.</p>

<p>Вам будут предложены следующие варианты оплаты авиабилета:<br />
&mdash;&nbsp;карты Visa или MasterCard;<br />
&mdash;&nbsp;наличными по&nbsp;счету в&nbsp;банке для физических лиц;<br />
&mdash;&nbsp;наличными с&nbsp;помощью более 4000 терминалов &laquo;Банк&nbsp;24 Национальный кредит&raquo;.</p>

<p>1. Оплата с&nbsp;помощью карт Visa/MasterCard<br />
Мы&nbsp;принимаем платежные карты всех банков мира. После того как пройдет оплата, электронный билет будет Вам доставлен на&nbsp;электронную почту (e-mail) и&nbsp;продублирован в&nbsp;новом окне браузера, откуда можно будет его распечатать.</p>

<p>2. Оплата наличными деньгами по&nbsp;счету в&nbsp;отделении банка<br />
Оплата наличным способом дает возможность оплатить забронированный заказ в&nbsp;любом удобном для Вас отделении банков Украины. При выборе этого варианта оплаты необходимо распечатать созданный на&nbsp;сайте счет и&nbsp;оплатить его в&nbsp;любом отделении банка. В&nbsp;назначении платежа обязательно необходимо указывать номер бронирования.<br />
Обратите внимание, что деньги от&nbsp;банка могут проходить к&nbsp;нам с&nbsp;задержкой до&nbsp;нескольких дней.<br />
При оплате заказа в&nbsp;банке обязательно свяжитесь с&nbsp;оператором по&nbsp;тел. 044&nbsp;537 02 02.</p>

<p>3. Оплата наличными с&nbsp;помощью электронного терминала &laquo;Банк&nbsp;24 Национальный кредит&raquo;<br />
Подберите ближайший к&nbsp;Вам терминал, перейдя по&nbsp;ссылке https://bnk24.com.ua/Map.<br />
Обращаем Ваше внимание, что терминал сдачу не&nbsp;выдает. Сдача может быть зачислена на&nbsp;указанный Вами в&nbsp;момент оплаты номер телефона. Максимальная сумма оплаты&nbsp;&mdash; 10&nbsp;000&nbsp;грн.<br />
При оплате через терминал необходимо:<br />
&mdash;&nbsp;выбрать &quot;Билеты&quot;/&quot;Розетка Путешествия&laquo;;<br />
&mdash;&nbsp;ввести номер бронировки, которая ранее была выслана Вам на&nbsp;e-mail и&nbsp;SMS;<br />
&mdash;&nbsp;после ввода номера бронировки на&nbsp;экране терминала появится информация о&nbsp;билете;<br />
&mdash;&nbsp;внести необходимую сумму денег и&nbsp;получить чек;<br />
&mdash;&nbsp;в&nbsp;течении 60&nbsp;минут Вам на&nbsp;e-mail будет выслан электронный билет.</p>

<p>Осуществить оплату авиабилета и&nbsp;ЖД билета денежными сертификатами Розетка невозможно.</p>

<h3>Подбор и&nbsp;оплата&nbsp;ЖД билетов</h3>

<p>Система online-заказов предоставляет Вам возможность выбрать и&nbsp;оплатить ЖД-билет, не&nbsp;выходя из&nbsp;дома. Поисковая система запрашивает пункт отправления, пункт назначения и&nbsp;дату отправления, после чего появляются варианты путешествия. При поиске билета выдается актуальная на&nbsp;момент бронирования цена и&nbsp;наличие.<br />
Стоимость железнодорожного билета зависит от&nbsp;выбранного маршрута и&nbsp;от&nbsp;ряда особенностей, к&nbsp;которым относятся:<br />
&mdash;&nbsp;уровень комфорта (сидячие места, плацкарт, купе, люкс и&nbsp;др.);<br />
&mdash;&nbsp;необходимость постельного белья;<br />
&mdash;&nbsp;возраст пассажира (взрослый или ребенок)<br />
После бронирования железнодорожного билета необходимо произвести оплату в&nbsp;течении 15&nbsp;минут. Если в&nbsp;назначенный срок оплата не&nbsp;производится, бронирование аннулируется.<br />
Оплатить билет возможно только с&nbsp;помощью банковской карты Visa или MasterCard.<br />
После успешного проведения оплаты&nbsp;Вы получаете e-mail и&nbsp;SMS с&nbsp;кодом бронировки.<br />
Для получения ЖД-билета нужно предъявить этот код в&nbsp;любой кассе &laquo;Укрзалізниці&raquo; на&nbsp;территории Украины.<br />
При возникновении каких-либо вопросов обращайтесь по&nbsp;тел. 044&nbsp;537 02 02.</p>

<h3>Условия возврата Авиабилетов</h3>

<p>Возврат денежных средств за&nbsp;авиабилеты производится в&nbsp;соответствии с&nbsp;правилами авиакомпаний.<br />
Сумма денежных средств может быть возвращена как полностью (как правило, для дорогих тарифов),<br />
так и&nbsp;за&nbsp;вычетом штрафа в&nbsp;пользу авиакомпании. Размер штрафа зависит от&nbsp;авиакомпании, тарифа,<br />
сроков сдачи авиабилета. Возврат уплаченной денежной суммы за&nbsp;авиабилет без штрафных санкций возможен в&nbsp;случаях изменения перевозчиком первоначальных условий перевозки, болезни пассажира и&nbsp;других случаях, которые произошли не&nbsp;по&nbsp;вине пассажира.<br />
Во&nbsp;время бронирования ознакомьтесь с&nbsp;правилами возврата выбранного билета на&nbsp;сайте.<br />
Сервисный сбор продавца и&nbsp;комиссионные банка не&nbsp;возвращаются.<br />
По&nbsp;условиям и&nbsp;процедуре возврата денежных средств за&nbsp;авиабилеты необходимо обратиться к&nbsp;оператору по&nbsp;тел. 044&nbsp;537 02 02.</p>

<h3>Условия возврата&nbsp;ЖД билетов</h3>

<p>Для возврата денежных средств необходимо обратиться в&nbsp;Ж/Д кассу и&nbsp;обменять код интернет-заказа на&nbsp;бумажный билет.<br />
Возврат билетов происходит по&nbsp;той&nbsp;же схеме,что и&nbsp;для обычных бумажных билетов.<br />
Сумма возврата за&nbsp;неиспользованный железнодорожный билет зависит от&nbsp;сроков обращения пассажира и&nbsp;устанавливается Министерством транспорта и&nbsp;связи Украины.<br />
Если пассажир потерял билет, то&nbsp;возврат денежных средств за&nbsp;данный билет не&nbsp;производится.<br />
Оплата услуг резервирования места и&nbsp;продажи билета не&nbsp;возвращается, исключением являются случаи, когда возврат происходит по&nbsp;вине железной дороги.<br />
Возврат железнодорожных билетов осуществляется исключительно в&nbsp;кассах возврата.<br />
При себе обязательно необходимо иметь документ, удостоверяющий личность.<br />
&nbsp;</p>
');

INSERT INTO static_page (id, title, description, url, location, published, reserved, content)
VALUES (6, 'Доставка', '', '/delivery', 'TOP_MENU', false, true, '<h2>Способы доставки</h2>

<h3>Адресная доставка по Киеву и Киевской области</h3>

<p><br />
Доставка в пределах Киева бесплатная при заказе на сумму от <strong>1500 грн</strong>. Стоимость доставки заказов до <strong>1500 грн</strong> составляет <strong>35 грн</strong>.<br />
<br />
Товары из раздела &quot;Активный отдых и туризм&quot;, &quot;Дом, сад&quot; и &quot;Детский мир&quot; доставляются <strong>бесплатно</strong> при сумме заказа <strong>от 500 грн. </strong><br />
<br />
Товары из раздела &quot;Бытовая техника и интерьер&quot; по Киеву доставляются <strong>бесплатно</strong> при сумме заказа <strong>от 800 грн</strong>, стоимость доставки заказов до 800 грн составляет 35 грн. Доставка товаров из данного раздела по Киеву и Украине осуществляется отдельно от доставки товаров из других разделов сайта.<br />
<br />
Доставка уцененных товаров не осуществляется. Уцененные товары Вы можете приобрести в нашем выставочном зале.<br />
<br />
По Киеву доставка большинства товаров осуществляется с 10:00 до 21:00 в рабочие дни, с 10:00 до 19:00 в субботу и с 10:00 до 17:00 воскресенье. Доставка товаров из раздела &quot;Бытовая техника и интерьер&quot; &mdash; с 10:00 до 13:00 и с 16:00 до 21:00, с понедельника по субботу.<br />
<br />
Обычно если вы разместили заказ до 12:00 &mdash; мы доставим его в тот же день. В любом случае во время заказа наши менеджеры сразу согласуют с вами время доставки.<br />
<br />
Наши сотрудники оперативно доставят заказ по указанному вами адресу в удобное для вас время и продемонстрируют целостность, комплектность и работоспособность товара (для устройств, работающих автономно), а также оформят все необходимые документы. Из соображений безопасности проверка товара и товарно-денежный обмен производятся в автомобиле курьера.<br />
<br />
Крупногабаритные товары из разделов &quot;Фитнес&quot;, и &quot;Детский мир&quot; (тренажеры, детские кроватки, детская мебель и т. д.) доставляются с 15:00 до 21:00 в будние дни до квартиры. При наличии лифта занос товара бесплатный, при отсутствии стоимость подъема определяется на месте в зависимости от габаритов, массы и сложности (20-50 грн/этаж).<br />
<br />
Товары из раздела &laquo;Бытовая техника и интерьер&raquo; доставляются до квартиры. Подъём крупногабаритных товаров (от 50 кг) в квартиру бесплатный, если товар в упаковке помещается и поднимается на лифте. Стоимость ручного подъёма зависит от габаритов техники и сложности подъёма и составляет от 20 до 60 гривен. Крупногабаритная техника весом свыше 90 кг поднимается платно с учётом первого этажа (подачи к лифту, подъезду).<br />
<br />
Доставка по Киевской области производится в следующие населенные пункты:<br />
<br />
Барышевка, Белая Церковь, Белогородка, Березань, Бобрица, Богуслав, Борисполь, Борова, Бородянка, Бортничи, Боярка, Бровары, Буча, Бышев, Васильков, Велика Дымерка, Вишневое, Володарка, Ворзель, Вышгород, Гавриловка, Глеваха, Гоголев, Горенка, Гостомель, Гребени, Гребенки, Демидов, Дениховка, Дибровка, Дослидныцьке, Дымер, Загальцы, Згуровка, Иванков, Ирпень, Кагарлык, Калиновка, Калита, Кожанка, Козин, Коцюбинское, Красиловка, Лесники, Лукаши, Лютеж, Макаров, Медвин, Мироновка, Мотовиловка, Небелица, Новые Петровцы, Обухов, Панфилы, Переяслав-Хмельницкий, Пискивка, Ракитное, Ржищев, Розкишна, Русанов, Семиполки, Сквыра, Ставище, Старые Петровцы, Тараща, Тетиев, Требухов, Узин, Украинка, Устиновка, Фастов, Чайка, Шпитьки, Яготин.<br />
<br />
Сроки доставки уточняйте, пожалуйста, у менеджера.<br />
<br />
Стоимость доставки по Киевской области составляет 35 гривен.<br />
<br />
Стоимость доставки товаров из раздела <strong>Бытовая техника и интерьер</strong> по Киевской области рассчитывается индивидуально.</p>

<h3>Доставка из точки выдачи</h3>

<p>&nbsp;</p>

<p>Время и дату доставки товара в Ваш город уточняйте, пожалуйста, при оформлении заказа. После получения заказа вы сможете осмотреть, проверить комплектацию и работоспособность товара (для устройств, работающих автономно) в офисе представительства в вашем городе, после чего на месте оплатить покупку.</p>

<p>Наши представительства работают в Виннице, Владимире-Волынском, Донецке, Днепропетровске, Житомире, Запорожье, Ивано-Франковске, Кировограде, Кременчуге, Кривом Роге, Луцке, Луганске, Львове, Мариуполе, Николаеве, Одессе, Полтаве, Ровно, Симферополе, Севастополе, Сумах, Тернополе, Ужгороде, Харькове, Херсоне, Хмельницком, Черкассах, Чернигове, Черновцах.</p>

<p><strong>Стоимость доставки по Украине в пункт самовывоза составляет 35 грн.</strong><br />
&nbsp;</p>
');

INSERT INTO static_page (id, title, description, url, location, published, reserved, content)
VALUES (7, 'Уцінка', NULL, '/markdown', 'TOP_MENU', true, true, NULL);

INSERT INTO static_page (id, title, description, url, location, published, reserved, content)
VALUES (200, 'Test bottom page', 'tewqfdsfgrfgfdsg', 'test-bottom', 'BOTTOM_MENU', false, false, NULL);

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
-- Data for sequence public.client_id_seq (OID = 34773)
--
SELECT pg_catalog.setval('client_id_seq', 94, true);
--
-- Data for sequence public.comment_id_seq (OID = 34775)
--
SELECT pg_catalog.setval('comment_id_seq', 29, true);
--
-- Data for sequence public.product_id_seq (OID = 34777)
--
SELECT pg_catalog.setval('product_id_seq', 73, true);
--
-- Data for sequence public.product_category_id_seq (OID = 34779)
--
SELECT pg_catalog.setval('product_category_id_seq', 74, true);
--
-- Data for sequence public.product_settings_id_seq (OID = 34781)
--
SELECT pg_catalog.setval('product_settings_id_seq', 86, true);
--
-- Data for sequence public.user_id_seq (OID = 34783)
--
SELECT pg_catalog.setval('user_id_seq', 75, true);
--
-- Data for sequence public.user_role_id_seq (OID = 34785)
--
SELECT pg_catalog.setval('user_role_id_seq', 10, true);
--
-- Data for sequence public.category_settings_id_seq (OID = 34842)
--
SELECT pg_catalog.setval('category_settings_id_seq', 40, true);
--
-- Data for sequence public.producer_id_seq (OID = 34850)
--
SELECT pg_catalog.setval('producer_id_seq', 23, true);
--
-- Data for sequence public.range_id_seq (OID = 34864)
--
SELECT pg_catalog.setval('range_id_seq', 3, true);
--
-- Data for sequence public.static_page_id_seq (OID = 34872)
--
SELECT pg_catalog.setval('static_page_id_seq', 8, true);
--
-- Data for sequence public.notification_id_seq (OID = 35022)
--
SELECT pg_catalog.setval('notification_id_seq', 1, false);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
