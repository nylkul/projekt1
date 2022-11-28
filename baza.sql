--
-- PostgreSQL database dump
--

-- Dumped from database version 10.22 (Ubuntu 10.22-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.22 (Ubuntu 10.22-0ubuntu0.18.04.1)

-- Started on 2022-11-28 23:01:28 CET

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

SET default_with_oids = false;

--
-- TOC entry 207 (class 1259 OID 29224)
-- Name: assign_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assign_category (
    id_word_en integer NOT NULL,
    id_ca integer NOT NULL
);


--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE assign_category; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.assign_category IS 'Tabela przypisująca kategorię do słowa angielskiego.';


--
-- TOC entry 204 (class 1259 OID 29163)
-- Name: attempt; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attempt (
    id_at integer NOT NULL,
    id_us integer,
    score integer
);


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE attempt; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.attempt IS 'Tabela zawierająca podejścia i wyniki.';


--
-- TOC entry 203 (class 1259 OID 29161)
-- Name: attempt_id_at_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.attempt_id_at_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 203
-- Name: attempt_id_at_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.attempt_id_at_seq OWNED BY public.attempt.id_at;


--
-- TOC entry 206 (class 1259 OID 29215)
-- Name: category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.category (
    id_ca integer NOT NULL,
    cat_name text
);


--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE category; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.category IS 'Tabela zawierająca listę kategorii.';


--
-- TOC entry 205 (class 1259 OID 29213)
-- Name: category_id_ca_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.category_id_ca_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 205
-- Name: category_id_ca_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.category_id_ca_seq OWNED BY public.category.id_ca;


--
-- TOC entry 197 (class 1259 OID 28963)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id_us integer NOT NULL,
    user_name text,
    password text,
    is_admin boolean DEFAULT false NOT NULL,
    e_mail text NOT NULL
);


--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 197
-- Name: TABLE users; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.users IS 'Tabela zawierająca dane użytkowników.';


--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN users.is_admin; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.is_admin IS 'określa czy użytkownik jest adminem';


--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN users.e_mail; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.e_mail IS 'e-mail użytkownika';


--
-- TOC entry 196 (class 1259 OID 28961)
-- Name: users_id_us_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_us_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 196
-- Name: users_id_us_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_us_seq OWNED BY public.users.id_us;


--
-- TOC entry 202 (class 1259 OID 28996)
-- Name: word_relation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.word_relation (
    id_word_pl integer NOT NULL,
    id_word_en integer NOT NULL
);


--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE word_relation; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.word_relation IS 'relacja między słowami, zawiera tłumaczenia słów między językami.';


--
-- TOC entry 201 (class 1259 OID 28987)
-- Name: words_en; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.words_en (
    id_word_en integer NOT NULL,
    word_en text
);


--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE words_en; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.words_en IS 'Tabela zawierająca angielskie słowa.';


--
-- TOC entry 200 (class 1259 OID 28985)
-- Name: words_en_id_word_en_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.words_en_id_word_en_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 200
-- Name: words_en_id_word_en_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.words_en_id_word_en_seq OWNED BY public.words_en.id_word_en;


--
-- TOC entry 199 (class 1259 OID 28976)
-- Name: words_pl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.words_pl (
    id_word_pl integer NOT NULL,
    word_pl text
);


--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 199
-- Name: TABLE words_pl; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.words_pl IS 'Tabela zawierająca polskie słowa.';


--
-- TOC entry 198 (class 1259 OID 28974)
-- Name: words_pl_id_word_pl_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.words_pl_id_word_pl_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 198
-- Name: words_pl_id_word_pl_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.words_pl_id_word_pl_seq OWNED BY public.words_pl.id_word_pl;


--
-- TOC entry 2792 (class 2604 OID 29166)
-- Name: attempt id_at; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attempt ALTER COLUMN id_at SET DEFAULT nextval('public.attempt_id_at_seq'::regclass);


--
-- TOC entry 2793 (class 2604 OID 29218)
-- Name: category id_ca; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category ALTER COLUMN id_ca SET DEFAULT nextval('public.category_id_ca_seq'::regclass);


--
-- TOC entry 2788 (class 2604 OID 28966)
-- Name: users id_us; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id_us SET DEFAULT nextval('public.users_id_us_seq'::regclass);


--
-- TOC entry 2791 (class 2604 OID 28990)
-- Name: words_en id_word_en; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.words_en ALTER COLUMN id_word_en SET DEFAULT nextval('public.words_en_id_word_en_seq'::regclass);


--
-- TOC entry 2790 (class 2604 OID 28979)
-- Name: words_pl id_word_pl; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.words_pl ALTER COLUMN id_word_pl SET DEFAULT nextval('public.words_pl_id_word_pl_seq'::regclass);


--
-- TOC entry 2958 (class 0 OID 29224)
-- Dependencies: 207
-- Data for Name: assign_category; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.assign_category VALUES (11, 1);
INSERT INTO public.assign_category VALUES (10, 4);
INSERT INTO public.assign_category VALUES (24, 1);
INSERT INTO public.assign_category VALUES (22, 1);
INSERT INTO public.assign_category VALUES (18, 1);
INSERT INTO public.assign_category VALUES (17, 1);
INSERT INTO public.assign_category VALUES (29, 1);
INSERT INTO public.assign_category VALUES (13, 1);
INSERT INTO public.assign_category VALUES (28, 1);
INSERT INTO public.assign_category VALUES (26, 1);
INSERT INTO public.assign_category VALUES (15, 1);
INSERT INTO public.assign_category VALUES (20, 1);
INSERT INTO public.assign_category VALUES (16, 1);
INSERT INTO public.assign_category VALUES (3, 4);
INSERT INTO public.assign_category VALUES (31, 4);
INSERT INTO public.assign_category VALUES (33, 4);
INSERT INTO public.assign_category VALUES (32, 4);
INSERT INTO public.assign_category VALUES (34, 4);
INSERT INTO public.assign_category VALUES (35, 4);
INSERT INTO public.assign_category VALUES (36, 4);
INSERT INTO public.assign_category VALUES (37, 4);
INSERT INTO public.assign_category VALUES (40, 4);
INSERT INTO public.assign_category VALUES (42, 4);
INSERT INTO public.assign_category VALUES (43, 4);


--
-- TOC entry 2955 (class 0 OID 29163)
-- Dependencies: 204
-- Data for Name: attempt; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.attempt VALUES (1, 1, 20);
INSERT INTO public.attempt VALUES (2, 1, 11);
INSERT INTO public.attempt VALUES (3, 1, -6);
INSERT INTO public.attempt VALUES (4, 1, 24);
INSERT INTO public.attempt VALUES (5, 1, 24);
INSERT INTO public.attempt VALUES (6, 1, 24);
INSERT INTO public.attempt VALUES (7, 1, 24);
INSERT INTO public.attempt VALUES (8, 1, 24);
INSERT INTO public.attempt VALUES (9, 1, 24);
INSERT INTO public.attempt VALUES (10, 1, 24);
INSERT INTO public.attempt VALUES (11, 1, 24);
INSERT INTO public.attempt VALUES (12, 1, 24);
INSERT INTO public.attempt VALUES (13, 1, 24);
INSERT INTO public.attempt VALUES (14, 1, 24);
INSERT INTO public.attempt VALUES (15, 1, 24);
INSERT INTO public.attempt VALUES (16, 1, 24);
INSERT INTO public.attempt VALUES (17, 1, 24);
INSERT INTO public.attempt VALUES (18, 1, 24);
INSERT INTO public.attempt VALUES (19, 1, 24);
INSERT INTO public.attempt VALUES (20, 1, 24);
INSERT INTO public.attempt VALUES (21, 1, 24);
INSERT INTO public.attempt VALUES (22, 1, 24);
INSERT INTO public.attempt VALUES (23, 1, 24);
INSERT INTO public.attempt VALUES (24, 1, 24);
INSERT INTO public.attempt VALUES (25, 1, 24);
INSERT INTO public.attempt VALUES (26, 1, 24);
INSERT INTO public.attempt VALUES (27, 1, 24);
INSERT INTO public.attempt VALUES (28, 1, 24);
INSERT INTO public.attempt VALUES (29, 1, 24);
INSERT INTO public.attempt VALUES (30, 1, 24);
INSERT INTO public.attempt VALUES (31, 1, 24);
INSERT INTO public.attempt VALUES (32, 1, 24);
INSERT INTO public.attempt VALUES (33, 1, 24);
INSERT INTO public.attempt VALUES (34, 1, 24);
INSERT INTO public.attempt VALUES (35, 1, 24);
INSERT INTO public.attempt VALUES (36, 1, 24);
INSERT INTO public.attempt VALUES (37, 1, 24);
INSERT INTO public.attempt VALUES (38, 1, 24);
INSERT INTO public.attempt VALUES (39, 1, 24);
INSERT INTO public.attempt VALUES (40, 1, 24);
INSERT INTO public.attempt VALUES (41, 1, 24);
INSERT INTO public.attempt VALUES (42, 1, 24);
INSERT INTO public.attempt VALUES (43, 1, 24);
INSERT INTO public.attempt VALUES (44, 1, 24);
INSERT INTO public.attempt VALUES (45, 1, 24);
INSERT INTO public.attempt VALUES (46, 1, 24);
INSERT INTO public.attempt VALUES (47, 1, 24);
INSERT INTO public.attempt VALUES (48, 1, 24);
INSERT INTO public.attempt VALUES (49, 1, 24);
INSERT INTO public.attempt VALUES (50, 1, 24);
INSERT INTO public.attempt VALUES (51, 1, 24);
INSERT INTO public.attempt VALUES (52, 1, 24);
INSERT INTO public.attempt VALUES (53, 1, 24);
INSERT INTO public.attempt VALUES (54, 1, 24);
INSERT INTO public.attempt VALUES (55, 1, 24);
INSERT INTO public.attempt VALUES (56, 1, 24);
INSERT INTO public.attempt VALUES (57, 1, 24);
INSERT INTO public.attempt VALUES (58, 1, 24);
INSERT INTO public.attempt VALUES (59, 1, 24);
INSERT INTO public.attempt VALUES (60, 1, 24);
INSERT INTO public.attempt VALUES (61, 1, 24);
INSERT INTO public.attempt VALUES (62, 1, 24);
INSERT INTO public.attempt VALUES (63, 1, 24);
INSERT INTO public.attempt VALUES (64, 1, 24);
INSERT INTO public.attempt VALUES (65, 1, 24);
INSERT INTO public.attempt VALUES (66, 1, 24);
INSERT INTO public.attempt VALUES (67, 1, 24);
INSERT INTO public.attempt VALUES (68, 1, 24);
INSERT INTO public.attempt VALUES (69, 1, 24);
INSERT INTO public.attempt VALUES (70, 1, 24);
INSERT INTO public.attempt VALUES (71, 1, 24);
INSERT INTO public.attempt VALUES (72, 1, 24);
INSERT INTO public.attempt VALUES (73, 1, 24);
INSERT INTO public.attempt VALUES (74, 1, 24);
INSERT INTO public.attempt VALUES (75, 1, 24);
INSERT INTO public.attempt VALUES (76, 1, 24);
INSERT INTO public.attempt VALUES (77, 1, 24);
INSERT INTO public.attempt VALUES (78, 1, 24);
INSERT INTO public.attempt VALUES (79, 1, 24);
INSERT INTO public.attempt VALUES (80, 1, 24);
INSERT INTO public.attempt VALUES (81, 1, 24);
INSERT INTO public.attempt VALUES (82, 1, 24);
INSERT INTO public.attempt VALUES (83, 1, 24);
INSERT INTO public.attempt VALUES (84, 1, 24);
INSERT INTO public.attempt VALUES (85, 1, 24);
INSERT INTO public.attempt VALUES (86, 1, 24);
INSERT INTO public.attempt VALUES (87, 1, 24);
INSERT INTO public.attempt VALUES (88, 1, 24);
INSERT INTO public.attempt VALUES (89, 1, 24);
INSERT INTO public.attempt VALUES (90, 1, 24);
INSERT INTO public.attempt VALUES (91, 1, 24);
INSERT INTO public.attempt VALUES (92, 1, 24);
INSERT INTO public.attempt VALUES (93, 1, 24);
INSERT INTO public.attempt VALUES (94, 1, 24);
INSERT INTO public.attempt VALUES (95, 1, 24);
INSERT INTO public.attempt VALUES (96, 1, 24);
INSERT INTO public.attempt VALUES (97, 1, 24);
INSERT INTO public.attempt VALUES (98, 1, 24);
INSERT INTO public.attempt VALUES (99, 1, 24);
INSERT INTO public.attempt VALUES (100, 1, 24);
INSERT INTO public.attempt VALUES (101, 1, 24);
INSERT INTO public.attempt VALUES (102, 1, 24);
INSERT INTO public.attempt VALUES (103, 1, 24);
INSERT INTO public.attempt VALUES (104, 1, 24);
INSERT INTO public.attempt VALUES (105, 1, 0);
INSERT INTO public.attempt VALUES (106, 1, 6);
INSERT INTO public.attempt VALUES (107, 1, 6);
INSERT INTO public.attempt VALUES (108, 1, 6);
INSERT INTO public.attempt VALUES (109, 1, 5);
INSERT INTO public.attempt VALUES (110, 1, 6);
INSERT INTO public.attempt VALUES (111, 1, 6);
INSERT INTO public.attempt VALUES (112, 1, 6);
INSERT INTO public.attempt VALUES (113, 1, 6);
INSERT INTO public.attempt VALUES (114, 1, 6);
INSERT INTO public.attempt VALUES (115, 1, 6);
INSERT INTO public.attempt VALUES (116, 1, 4);
INSERT INTO public.attempt VALUES (117, 1, 5);
INSERT INTO public.attempt VALUES (118, 1, 6);
INSERT INTO public.attempt VALUES (119, 1, 6);
INSERT INTO public.attempt VALUES (120, 1, 6);
INSERT INTO public.attempt VALUES (121, 1, 5);
INSERT INTO public.attempt VALUES (122, 1, 5);
INSERT INTO public.attempt VALUES (123, 1, 5);
INSERT INTO public.attempt VALUES (124, 1, 5);
INSERT INTO public.attempt VALUES (125, 1, 4);
INSERT INTO public.attempt VALUES (126, 9, 21);
INSERT INTO public.attempt VALUES (127, 9, 6);
INSERT INTO public.attempt VALUES (128, 1, 0);
INSERT INTO public.attempt VALUES (129, 1, 6);
INSERT INTO public.attempt VALUES (130, 1, 0);
INSERT INTO public.attempt VALUES (131, 1, 3);
INSERT INTO public.attempt VALUES (132, 12, 5);
INSERT INTO public.attempt VALUES (133, 12, 0);
INSERT INTO public.attempt VALUES (134, 13, 21);
INSERT INTO public.attempt VALUES (135, 14, 24);
INSERT INTO public.attempt VALUES (136, 14, 21);
INSERT INTO public.attempt VALUES (137, 12, 0);
INSERT INTO public.attempt VALUES (138, 12, 0);
INSERT INTO public.attempt VALUES (139, 12, 0);
INSERT INTO public.attempt VALUES (140, 14, 24);
INSERT INTO public.attempt VALUES (141, 12, 24);
INSERT INTO public.attempt VALUES (142, 13, 0);
INSERT INTO public.attempt VALUES (143, 1, 0);
INSERT INTO public.attempt VALUES (144, 1, 20);
INSERT INTO public.attempt VALUES (145, 1, 0);
INSERT INTO public.attempt VALUES (146, 1, 24);
INSERT INTO public.attempt VALUES (147, 1, 0);
INSERT INTO public.attempt VALUES (148, 1, 0);


--
-- TOC entry 2957 (class 0 OID 29215)
-- Dependencies: 206
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.category VALUES (1, 'fruit');
INSERT INTO public.category VALUES (4, 'vegetable');
INSERT INTO public.category VALUES (5, 'jargon');
INSERT INTO public.category VALUES (12, 'test1');
INSERT INTO public.category VALUES (13, 'test2');
INSERT INTO public.category VALUES (14, 'test3');
INSERT INTO public.category VALUES (15, 'test4');
INSERT INTO public.category VALUES (16, 'test5');
INSERT INTO public.category VALUES (17, 'test6');
INSERT INTO public.category VALUES (18, 'test7');
INSERT INTO public.category VALUES (19, 'test8');
INSERT INTO public.category VALUES (20, 'test9');


--
-- TOC entry 2948 (class 0 OID 28963)
-- Dependencies: 197
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (6, 'Cebularz', '76f551ea84768a9bc369c5a58789b38d', false, 'cebula@gmail.com');
INSERT INTO public.users VALUES (2, 'kartofel', '76f551ea84768a9bc369c5a58789b38d', false, 'kartofel@gmail.com');
INSERT INTO public.users VALUES (9, 'Koko', 'f4ec6b5cbf016ac1ea3c2291f6969f7c', false, 'bruh@elo.pl');
INSERT INTO public.users VALUES (7, 'pyra', '76f551ea84768a9bc369c5a58789b38d', false, 'pyra@gmail.com');
INSERT INTO public.users VALUES (12, 'Haba', '3fc0a7acf087f549ac2b266baf94b8b1', true, 'mira.exoplanet@gmail.com');
INSERT INTO public.users VALUES (13, 'KarinaCh', '5cd9207a240c205c7ba2accd5ebbdda2', true, 'kkchirva@gmail.com');
INSERT INTO public.users VALUES (14, 'Dodo', 'a51847c403c94433b488dfddc5ec10aa', false, 'Dodo@o2.pl');
INSERT INTO public.users VALUES (15, 'Seler', '76f551ea84768a9bc369c5a58789b38d', false, 'a@a.wp.pl');
INSERT INTO public.users VALUES (16, 'jurek', 'c9be4e40147e80419c460aea2179e6c9', false, 'wp@wp.pl');
INSERT INTO public.users VALUES (1, 'admin', 'a289ec81aaf3cae3e091936797f406d8', true, 'nikodem.fiedorow@gmail.com');


--
-- TOC entry 2953 (class 0 OID 28996)
-- Dependencies: 202
-- Data for Name: word_relation; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.word_relation VALUES (4, 10);
INSERT INTO public.word_relation VALUES (9, 23);
INSERT INTO public.word_relation VALUES (11, 25);
INSERT INTO public.word_relation VALUES (14, 22);
INSERT INTO public.word_relation VALUES (15, 27);
INSERT INTO public.word_relation VALUES (16, 15);
INSERT INTO public.word_relation VALUES (10, 16);
INSERT INTO public.word_relation VALUES (17, 26);
INSERT INTO public.word_relation VALUES (12, 18);
INSERT INTO public.word_relation VALUES (18, 17);
INSERT INTO public.word_relation VALUES (19, 29);
INSERT INTO public.word_relation VALUES (23, 13);
INSERT INTO public.word_relation VALUES (13, 21);
INSERT INTO public.word_relation VALUES (24, 3);
INSERT INTO public.word_relation VALUES (21, 19);
INSERT INTO public.word_relation VALUES (22, 14);
INSERT INTO public.word_relation VALUES (8, 20);
INSERT INTO public.word_relation VALUES (20, 28);
INSERT INTO public.word_relation VALUES (26, 11);
INSERT INTO public.word_relation VALUES (27, 24);
INSERT INTO public.word_relation VALUES (29, 31);
INSERT INTO public.word_relation VALUES (30, 33);
INSERT INTO public.word_relation VALUES (31, 32);
INSERT INTO public.word_relation VALUES (32, 34);
INSERT INTO public.word_relation VALUES (34, 36);
INSERT INTO public.word_relation VALUES (35, 37);
INSERT INTO public.word_relation VALUES (38, 40);
INSERT INTO public.word_relation VALUES (39, 31);
INSERT INTO public.word_relation VALUES (40, 42);
INSERT INTO public.word_relation VALUES (41, 43);
INSERT INTO public.word_relation VALUES (42, 35);


--
-- TOC entry 2952 (class 0 OID 28987)
-- Dependencies: 201
-- Data for Name: words_en; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.words_en VALUES (3, 'potato');
INSERT INTO public.words_en VALUES (10, 'tomato');
INSERT INTO public.words_en VALUES (11, 'apple');
INSERT INTO public.words_en VALUES (13, 'pineapple');
INSERT INTO public.words_en VALUES (14, 'sweet potato');
INSERT INTO public.words_en VALUES (15, 'kiwi');
INSERT INTO public.words_en VALUES (16, 'lemon');
INSERT INTO public.words_en VALUES (17, 'orange');
INSERT INTO public.words_en VALUES (18, 'mango');
INSERT INTO public.words_en VALUES (19, 'strawberry');
INSERT INTO public.words_en VALUES (20, 'watermelon');
INSERT INTO public.words_en VALUES (21, 'plum');
INSERT INTO public.words_en VALUES (22, 'fig');
INSERT INTO public.words_en VALUES (23, 'cherry');
INSERT INTO public.words_en VALUES (24, 'blackberry');
INSERT INTO public.words_en VALUES (25, 'coconut');
INSERT INTO public.words_en VALUES (26, 'lime');
INSERT INTO public.words_en VALUES (27, 'grape');
INSERT INTO public.words_en VALUES (28, 'pear');
INSERT INTO public.words_en VALUES (29, 'peach');
INSERT INTO public.words_en VALUES (31, 'carrot');
INSERT INTO public.words_en VALUES (32, 'garlic');
INSERT INTO public.words_en VALUES (33, 'onion');
INSERT INTO public.words_en VALUES (34, 'bean');
INSERT INTO public.words_en VALUES (35, 'beet');
INSERT INTO public.words_en VALUES (36, 'cabbage');
INSERT INTO public.words_en VALUES (37, 'cucumber');
INSERT INTO public.words_en VALUES (38, 'pumpkin');
INSERT INTO public.words_en VALUES (40, 'parsley');
INSERT INTO public.words_en VALUES (42, 'corn');
INSERT INTO public.words_en VALUES (43, 'radish');


--
-- TOC entry 2950 (class 0 OID 28976)
-- Dependencies: 199
-- Data for Name: words_pl; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.words_pl VALUES (3, 'kartofel');
INSERT INTO public.words_pl VALUES (4, 'pomidor');
INSERT INTO public.words_pl VALUES (8, 'arbuz');
INSERT INTO public.words_pl VALUES (9, 'czereśnia');
INSERT INTO public.words_pl VALUES (10, 'cytryna');
INSERT INTO public.words_pl VALUES (11, 'kokos');
INSERT INTO public.words_pl VALUES (12, 'mango');
INSERT INTO public.words_pl VALUES (13, 'śliwka');
INSERT INTO public.words_pl VALUES (14, 'figa');
INSERT INTO public.words_pl VALUES (15, 'winogrono');
INSERT INTO public.words_pl VALUES (16, 'kiwi');
INSERT INTO public.words_pl VALUES (17, 'limonka');
INSERT INTO public.words_pl VALUES (18, 'pomarańcza');
INSERT INTO public.words_pl VALUES (19, 'brzoskwinia');
INSERT INTO public.words_pl VALUES (20, 'gruszka');
INSERT INTO public.words_pl VALUES (21, 'truskawka');
INSERT INTO public.words_pl VALUES (22, 'batat');
INSERT INTO public.words_pl VALUES (23, 'ananas');
INSERT INTO public.words_pl VALUES (24, 'ziemniak');
INSERT INTO public.words_pl VALUES (26, 'jabłko');
INSERT INTO public.words_pl VALUES (27, 'borówka');
INSERT INTO public.words_pl VALUES (29, 'marchewka');
INSERT INTO public.words_pl VALUES (30, 'cebula');
INSERT INTO public.words_pl VALUES (31, 'czosnek');
INSERT INTO public.words_pl VALUES (32, 'fasola');
INSERT INTO public.words_pl VALUES (34, 'kapusta');
INSERT INTO public.words_pl VALUES (35, 'ogórek');
INSERT INTO public.words_pl VALUES (36, 'dynia');
INSERT INTO public.words_pl VALUES (38, 'pietruszka');
INSERT INTO public.words_pl VALUES (39, 'marchew');
INSERT INTO public.words_pl VALUES (40, 'kukurydza');
INSERT INTO public.words_pl VALUES (41, 'rzodkiewka');
INSERT INTO public.words_pl VALUES (42, 'burak');


--
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 203
-- Name: attempt_id_at_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.attempt_id_at_seq', 148, true);


--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 205
-- Name: category_id_ca_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.category_id_ca_seq', 21, true);


--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 196
-- Name: users_id_us_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_us_seq', 16, true);


--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 200
-- Name: words_en_id_word_en_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.words_en_id_word_en_seq', 43, true);


--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 198
-- Name: words_pl_id_word_pl_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.words_pl_id_word_pl_seq', 42, true);


--
-- TOC entry 2819 (class 2606 OID 29479)
-- Name: assign_category assign_category_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assign_category
    ADD CONSTRAINT assign_category_pk PRIMARY KEY (id_ca, id_word_en);


--
-- TOC entry 2815 (class 2606 OID 29223)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id_ca);


--
-- TOC entry 2817 (class 2606 OID 29481)
-- Name: category category_un; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_un UNIQUE (cat_name);


--
-- TOC entry 2795 (class 2606 OID 29160)
-- Name: users e-mail_index; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "e-mail_index" UNIQUE (e_mail);


--
-- TOC entry 2813 (class 2606 OID 29168)
-- Name: attempt id_at_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attempt
    ADD CONSTRAINT id_at_pk PRIMARY KEY (id_at);


--
-- TOC entry 2797 (class 2606 OID 28973)
-- Name: users user_name_index; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_name_index UNIQUE (user_name);


--
-- TOC entry 2799 (class 2606 OID 28971)
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id_us);


--
-- TOC entry 2811 (class 2606 OID 29000)
-- Name: word_relation word_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.word_relation
    ADD CONSTRAINT word_relation_pkey PRIMARY KEY (id_word_pl, id_word_en);


--
-- TOC entry 2805 (class 2606 OID 28995)
-- Name: words_en words_en_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.words_en
    ADD CONSTRAINT words_en_pkey PRIMARY KEY (id_word_en);


--
-- TOC entry 2807 (class 2606 OID 29475)
-- Name: words_en words_en_un; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.words_en
    ADD CONSTRAINT words_en_un UNIQUE (word_en);


--
-- TOC entry 2801 (class 2606 OID 29002)
-- Name: words_pl words_pl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.words_pl
    ADD CONSTRAINT words_pl_pkey PRIMARY KEY (id_word_pl);


--
-- TOC entry 2803 (class 2606 OID 29477)
-- Name: words_pl words_pl_un; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.words_pl
    ADD CONSTRAINT words_pl_un UNIQUE (word_pl);


--
-- TOC entry 2820 (class 1259 OID 29237)
-- Name: fki_id_ca_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_id_ca_fk ON public.assign_category USING btree (id_ca);


--
-- TOC entry 2808 (class 1259 OID 29014)
-- Name: fki_id_en_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_id_en_fk ON public.word_relation USING btree (id_word_en);


--
-- TOC entry 2809 (class 1259 OID 29008)
-- Name: fki_id_pl_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_id_pl_fk ON public.word_relation USING btree (id_word_pl);


--
-- TOC entry 2825 (class 2606 OID 29482)
-- Name: assign_category id_ca_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assign_category
    ADD CONSTRAINT id_ca_fk FOREIGN KEY (id_ca) REFERENCES public.category(id_ca) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2821 (class 2606 OID 29462)
-- Name: word_relation id_en_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.word_relation
    ADD CONSTRAINT id_en_fk FOREIGN KEY (id_word_en) REFERENCES public.words_en(id_word_en) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2822 (class 2606 OID 29467)
-- Name: word_relation id_pl_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.word_relation
    ADD CONSTRAINT id_pl_fk FOREIGN KEY (id_word_pl) REFERENCES public.words_pl(id_word_pl) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2823 (class 2606 OID 29169)
-- Name: attempt id_us_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attempt
    ADD CONSTRAINT id_us_fk FOREIGN KEY (id_us) REFERENCES public.users(id_us);


--
-- TOC entry 2824 (class 2606 OID 29457)
-- Name: assign_category id_word_en_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assign_category
    ADD CONSTRAINT id_word_en_fk FOREIGN KEY (id_word_en) REFERENCES public.words_en(id_word_en) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2022-11-28 23:01:29 CET

--
-- PostgreSQL database dump complete
--

