--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Ubuntu 16.1-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: svobodno; Type: DATABASE; Schema: -; Owner: slava
--

CREATE DATABASE svobodno WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE svobodno OWNER TO slava;

\connect svobodno

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    family character(32) NOT NULL,
    name character(32) NOT NULL,
    mobile character(10) NOT NULL,
    email character(64),
    id_us integer,
    "createdAt" timestamp without time zone,
    "updatedAt" timestamp without time zone
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: contract; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contract (
    id_con integer NOT NULL,
    id_cli integer,
    id_store integer,
    date_con date,
    actual boolean,
    buh_number character(32),
    price numeric
);


ALTER TABLE public.contract OWNER TO postgres;

--
-- Name: storage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storage (
    id_store integer NOT NULL,
    number_store smallint,
    id_lock integer,
    size numeric,
    floor smallint,
    "full" boolean,
    number_day smallint
);


ALTER TABLE public.storage OWNER TO postgres;

--
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    id_tran integer NOT NULL,
    id_store integer,
    id_con integer,
    "timestamp" timestamp without time zone,
    payment_real date
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- Name: buhview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.buhview AS
 SELECT storage.number_store,
    storage.number_day,
    transaction.payment_real,
    contract.buh_number,
    contract.price,
    clients.family,
    clients.name,
    clients.email,
    clients.mobile
   FROM public.transaction,
    public.storage,
    public.contract,
    public.clients
  WHERE ((transaction.payment_real IS NULL) AND (transaction.id_store = storage.id_store) AND (transaction.id_con = contract.id_con) AND (contract.id_cli = clients.id));


ALTER VIEW public.buhview OWNER TO postgres;

--
-- Name: client_id_cli_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_cli_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.client_id_cli_seq OWNER TO postgres;

--
-- Name: client_id_cli_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_cli_seq OWNED BY public.clients.id;


--
-- Name: contract_id_con_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contract_id_con_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contract_id_con_seq OWNER TO postgres;

--
-- Name: contract_id_con_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contract_id_con_seq OWNED BY public.contract.id_con;


--
-- Name: lock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lock (
    id_lock integer NOT NULL,
    secret character varying(128)
);


ALTER TABLE public.lock OWNER TO postgres;

--
-- Name: lock_id_lock_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lock_id_lock_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lock_id_lock_seq OWNER TO postgres;

--
-- Name: lock_id_lock_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lock_id_lock_seq OWNED BY public.lock.id_lock;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id_role integer NOT NULL,
    name_role character(32)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_id_role_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_role_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_id_role_seq OWNER TO postgres;

--
-- Name: role_id_role_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_role_seq OWNED BY public.role.id_role;


--
-- Name: storage_id_store_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.storage_id_store_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.storage_id_store_seq OWNER TO postgres;

--
-- Name: storage_id_store_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.storage_id_store_seq OWNED BY public.storage.id_store;


--
-- Name: storview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.storview AS
 SELECT storage.number_store,
    storage.size,
    storage.floor,
    contract.buh_number,
    contract.price,
    storage.number_day,
    clients.family,
    clients.name
   FROM public.storage,
    public.contract,
    public.clients
  WHERE ((1 = 1) AND (storage."full" = true) AND (contract.id_store = storage.id_store) AND (clients.id = contract.id_cli));


ALTER VIEW public.storview OWNER TO postgres;

--
-- Name: transaction_id_tran_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_id_tran_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_id_tran_seq OWNER TO postgres;

--
-- Name: transaction_id_tran_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_id_tran_seq OWNED BY public.transaction.id_tran;


--
-- Name: tutorials; Type: TABLE; Schema: public; Owner: slava
--

CREATE TABLE public.tutorials (
    id integer NOT NULL,
    title character varying(255),
    description character varying(255),
    published boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.tutorials OWNER TO slava;

--
-- Name: tutorials_id_seq; Type: SEQUENCE; Schema: public; Owner: slava
--

CREATE SEQUENCE public.tutorials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tutorials_id_seq OWNER TO slava;

--
-- Name: tutorials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: slava
--

ALTER SEQUENCE public.tutorials_id_seq OWNED BY public.tutorials.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id_us integer NOT NULL,
    login character(32) NOT NULL,
    pass character(32),
    id_role integer
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_us_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_us_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_us_seq OWNER TO postgres;

--
-- Name: user_id_us_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_us_seq OWNED BY public."user".id_us;


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.client_id_cli_seq'::regclass);


--
-- Name: contract id_con; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract ALTER COLUMN id_con SET DEFAULT nextval('public.contract_id_con_seq'::regclass);


--
-- Name: lock id_lock; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lock ALTER COLUMN id_lock SET DEFAULT nextval('public.lock_id_lock_seq'::regclass);


--
-- Name: role id_role; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id_role SET DEFAULT nextval('public.role_id_role_seq'::regclass);


--
-- Name: storage id_store; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage ALTER COLUMN id_store SET DEFAULT nextval('public.storage_id_store_seq'::regclass);


--
-- Name: transaction id_tran; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id_tran SET DEFAULT nextval('public.transaction_id_tran_seq'::regclass);


--
-- Name: tutorials id; Type: DEFAULT; Schema: public; Owner: slava
--

ALTER TABLE ONLY public.tutorials ALTER COLUMN id SET DEFAULT nextval('public.tutorials_id_seq'::regclass);


--
-- Name: user id_us; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id_us SET DEFAULT nextval('public.user_id_us_seq'::regclass);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clients (id, family, name, mobile, email, id_us, "createdAt", "updatedAt") VALUES (1, 'Dorohov                         ', 'Denis                           ', '9687899966', 'doroh@mail.ru                                                   ', 1, '2024-01-19 12:19:10', '2024-01-19 19:06:31.085');
INSERT INTO public.clients (id, family, name, mobile, email, id_us, "createdAt", "updatedAt") VALUES (2, 'Fedosov                         ', 'Svyatoslav                      ', '9687514641', 'slava@gmail.com                                             ', 2, '2024-01-19 12:19:10', '2024-01-19 19:07:47.053');


--
-- Data for Name: contract; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contract (id_con, id_cli, id_store, date_con, actual, buh_number, price) VALUES (1, 1, 1, '2024-01-05', true, 'a-001/2023                      ', 3000);
INSERT INTO public.contract (id_con, id_cli, id_store, date_con, actual, buh_number, price) VALUES (2, 1, 3, '2024-01-05', true, 'a-001/2023                      ', 2500);
INSERT INTO public.contract (id_con, id_cli, id_store, date_con, actual, buh_number, price) VALUES (3, 1, 4, '2024-01-05', true, 'a-001/2023                      ', 1000);
INSERT INTO public.contract (id_con, id_cli, id_store, date_con, actual, buh_number, price) VALUES (4, 2, 5, '2024-01-06', true, 'a-002/2023                      ', 2700);
INSERT INTO public.contract (id_con, id_cli, id_store, date_con, actual, buh_number, price) VALUES (5, 2, 6, '2024-01-06', true, 'a-002/2023                      ', 3900);


--
-- Data for Name: lock; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lock (id_lock, secret) VALUES (1, 'cY10lZ3o1lYf2wvkmuE1j0nTAC1ub0kz');
INSERT INTO public.lock (id_lock, secret) VALUES (2, 'dY10lZ3o1lYf2wvkmuE1j0nTAC1ub0kz');
INSERT INTO public.lock (id_lock, secret) VALUES (3, 'gY10lZ3o1lYf2wvkmuE1j0nTAC1ub0kz');
INSERT INTO public.lock (id_lock, secret) VALUES (4, 'rY10lZ3o1lYf2wvkmuE1j0nTAC1ub0kz');
INSERT INTO public.lock (id_lock, secret) VALUES (5, '4Y10lZ3o1lYf2wvkmuE1j0nTAC1ub0kz');
INSERT INTO public.lock (id_lock, secret) VALUES (6, '9Y10lZ3o1lYf2wvkmuE1j0nTAC1ub0kz');


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.role (id_role, name_role) VALUES (1, 'admin                           ');
INSERT INTO public.role (id_role, name_role) VALUES (2, 'buh                             ');
INSERT INTO public.role (id_role, name_role) VALUES (3, 'user                            ');


--
-- Data for Name: storage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.storage (id_store, number_store, id_lock, size, floor, "full", number_day) VALUES (3, 3, 4, 3.1, 2, true, 5);
INSERT INTO public.storage (id_store, number_store, id_lock, size, floor, "full", number_day) VALUES (2, 2, 5, 2.5, 1, NULL, NULL);
INSERT INTO public.storage (id_store, number_store, id_lock, size, floor, "full", number_day) VALUES (1, 1, 6, 3, 1, true, 5);
INSERT INTO public.storage (id_store, number_store, id_lock, size, floor, "full", number_day) VALUES (5, 5, 2, 2.2, 2, true, 6);
INSERT INTO public.storage (id_store, number_store, id_lock, size, floor, "full", number_day) VALUES (6, 6, 1, 5.5, 1, true, 6);
INSERT INTO public.storage (id_store, number_store, id_lock, size, floor, "full", number_day) VALUES (4, 4, 3, 0.9, 3, true, 5);


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.transaction (id_tran, id_store, id_con, "timestamp", payment_real) VALUES (1, 1, 1, '2024-01-13 09:18:47', NULL);
INSERT INTO public.transaction (id_tran, id_store, id_con, "timestamp", payment_real) VALUES (3, 5, 4, '2024-01-13 09:22:39', '2024-01-11');
INSERT INTO public.transaction (id_tran, id_store, id_con, "timestamp", payment_real) VALUES (2, 3, 2, '2024-01-13 09:20:04', NULL);
INSERT INTO public.transaction (id_tran, id_store, id_con, "timestamp", payment_real) VALUES (4, 6, 5, '2024-01-13 09:23:01', '2024-01-11');


--
-- Data for Name: tutorials; Type: TABLE DATA; Schema: public; Owner: slava
--

INSERT INTO public.tutorials (id, title, description, published, "createdAt", "updatedAt") VALUES (1, 'zzz', 'zzz', false, '2024-01-18 17:45:41.166+00', '2024-01-18 17:45:41.166+00');
INSERT INTO public.tutorials (id, title, description, published, "createdAt", "updatedAt") VALUES (2, 'nfgn', 'nfgn', false, '2024-01-18 18:40:54.204+00', '2024-01-18 18:40:54.204+00');


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."user" (id_us, login, pass, id_role) VALUES (3, 'buh                             ', 'otus                            ', 3);
INSERT INTO public."user" (id_us, login, pass, id_role) VALUES (2, 'godmen                          ', 'otus                            ', 2);
INSERT INTO public."user" (id_us, login, pass, id_role) VALUES (1, 'badmen                          ', 'otus                            ', 2);
INSERT INTO public."user" (id_us, login, pass, id_role) VALUES (4, 'admin                           ', 'otus                            ', 1);


--
-- Name: client_id_cli_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_cli_seq', 22, true);


--
-- Name: contract_id_con_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contract_id_con_seq', 7, true);


--
-- Name: lock_id_lock_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lock_id_lock_seq', 6, true);


--
-- Name: role_id_role_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_role_seq', 3, true);


--
-- Name: storage_id_store_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.storage_id_store_seq', 6, true);


--
-- Name: transaction_id_tran_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_id_tran_seq', 1, false);


--
-- Name: tutorials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: slava
--

SELECT pg_catalog.setval('public.tutorials_id_seq', 2, true);


--
-- Name: user_id_us_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_us_seq', 6, true);


--
-- Name: clients client_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT client_pk PRIMARY KEY (id);


--
-- Name: contract contract_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_pk PRIMARY KEY (id_con);


--
-- Name: lock lock_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lock
    ADD CONSTRAINT lock_pk PRIMARY KEY (id_lock);


--
-- Name: role role_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pk PRIMARY KEY (id_role);


--
-- Name: storage storage_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage
    ADD CONSTRAINT storage_pk PRIMARY KEY (id_store);


--
-- Name: transaction transaction_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pk PRIMARY KEY (id_tran);


--
-- Name: tutorials tutorials_pkey; Type: CONSTRAINT; Schema: public; Owner: slava
--

ALTER TABLE ONLY public.tutorials
    ADD CONSTRAINT tutorials_pkey PRIMARY KEY (id);


--
-- Name: user user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pk PRIMARY KEY (id_us);


--
-- Name: contract_id_con_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX contract_id_con_uindex ON public.contract USING btree (id_con);


--
-- Name: contract_id_store_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX contract_id_store_uindex ON public.contract USING btree (id_store);


--
-- Name: lock_id_lock_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX lock_id_lock_uindex ON public.lock USING btree (id_lock);


--
-- Name: lock_secret_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX lock_secret_uindex ON public.lock USING btree (secret);


--
-- Name: role_id_role_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX role_id_role_uindex ON public.role USING btree (id_role);


--
-- Name: storage_id_lock_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX storage_id_lock_uindex ON public.storage USING btree (id_lock);


--
-- Name: storage_id_store_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX storage_id_store_uindex ON public.storage USING btree (id_store);


--
-- Name: transaction_id_tran_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX transaction_id_tran_uindex ON public.transaction USING btree (id_tran);


--
-- Name: user_id_us_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_id_us_uindex ON public."user" USING btree (id_us);


--
-- Name: user_login_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_login_uindex ON public."user" USING btree (login);


--
-- Name: contract contract_client_id_cli_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_client_id_cli_fk FOREIGN KEY (id_cli) REFERENCES public.clients(id);


--
-- Name: contract contract_storage_id_store_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_storage_id_store_fk FOREIGN KEY (id_store) REFERENCES public.storage(id_store);


--
-- Name: storage storage_lock_id_lock_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage
    ADD CONSTRAINT storage_lock_id_lock_fk FOREIGN KEY (id_lock) REFERENCES public.lock(id_lock);


--
-- Name: transaction transaction_contract_id_con_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_contract_id_con_fk FOREIGN KEY (id_con) REFERENCES public.contract(id_con);


--
-- Name: transaction transaction_storage_id_store_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_storage_id_store_fk FOREIGN KEY (id_store) REFERENCES public.storage(id_store);


--
-- Name: user user_role_id_role_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_role_id_role_fk FOREIGN KEY (id_role) REFERENCES public.role(id_role);


--
-- PostgreSQL database dump complete
--

