--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7
-- Dumped by pg_dump version 12.7

-- Started on 2021-06-05 10:20:24

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
-- TOC entry 1 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2853 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 16484)
-- Name: answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.answers (
    answersid integer NOT NULL,
    participantid integer,
    cat1 character varying(50),
    cat2 character varying(50),
    cat3 character varying(50),
    cat4 character varying(50),
    cat5 character varying(50),
    cat6 character varying(50),
    cat7 character varying(50),
    cat8 character varying(50),
    cat9 character varying(50),
    cat10 character varying(50)
);


ALTER TABLE public.answers OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16490)
-- Name: answers_answersid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.answers_answersid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_answersid_seq OWNER TO postgres;

--
-- TOC entry 2854 (class 0 OID 0)
-- Dependencies: 204
-- Name: answers_answersid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.answers_answersid_seq OWNED BY public.answers.answersid;


--
-- TOC entry 205 (class 1259 OID 16492)
-- Name: participants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.participants (
    participantid integer NOT NULL,
    name character varying(200) NOT NULL,
    email character varying(100) NOT NULL,
    telephone character varying(25),
    companyname character varying(200) NOT NULL,
    companyincome character varying(16),
    totalemployee integer,
    rhemployee integer
);


ALTER TABLE public.participants OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16498)
-- Name: participants_participantid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.participants_participantid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.participants_participantid_seq OWNER TO postgres;

--
-- TOC entry 2855 (class 0 OID 0)
-- Dependencies: 206
-- Name: participants_participantid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.participants_participantid_seq OWNED BY public.participants.participantid;


--
-- TOC entry 207 (class 1259 OID 16500)
-- Name: qanda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qanda (
    questiontext character varying(200),
    answertext1 character varying(200),
    answertext2 character varying(200),
    answertext3 character varying(200),
    answertext4 character varying(200),
    answertext5 character varying(200),
    qandaid integer NOT NULL
);


ALTER TABLE public.qanda OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16506)
-- Name: qanda_qandaid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.qanda_qandaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qanda_qandaid_seq OWNER TO postgres;

--
-- TOC entry 2856 (class 0 OID 0)
-- Dependencies: 208
-- Name: qanda_qandaid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.qanda_qandaid_seq OWNED BY public.qanda.qandaid;


--
-- TOC entry 2703 (class 2604 OID 16508)
-- Name: answers answersid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers ALTER COLUMN answersid SET DEFAULT nextval('public.answers_answersid_seq'::regclass);


--
-- TOC entry 2704 (class 2604 OID 16509)
-- Name: participants participantid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participants ALTER COLUMN participantid SET DEFAULT nextval('public.participants_participantid_seq'::regclass);


--
-- TOC entry 2705 (class 2604 OID 16510)
-- Name: qanda qandaid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qanda ALTER COLUMN qandaid SET DEFAULT nextval('public.qanda_qandaid_seq'::regclass);



--
-- TOC entry 2857 (class 0 OID 0)
-- Dependencies: 204
-- Name: answers_answersid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.answers_answersid_seq', 1, false);


--
-- TOC entry 2858 (class 0 OID 0)
-- Dependencies: 206
-- Name: participants_participantid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.participants_participantid_seq', 1, false);


--
-- TOC entry 2859 (class 0 OID 0)
-- Dependencies: 208
-- Name: qanda_qandaid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.qanda_qandaid_seq', 1, false);


--
-- TOC entry 2707 (class 2606 OID 16512)
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (answersid);


--
-- TOC entry 2711 (class 2606 OID 16514)
-- Name: participants participants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_pkey PRIMARY KEY (participantid);


--
-- TOC entry 2713 (class 2606 OID 16516)
-- Name: qanda qanda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qanda
    ADD CONSTRAINT qanda_pkey PRIMARY KEY (qandaid);


--
-- TOC entry 2708 (class 1259 OID 16517)
-- Name: fki_participantid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_participantid ON public.answers USING btree (participantid);


--
-- TOC entry 2709 (class 1259 OID 16518)
-- Name: fki_qandaid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_qandaid ON public.answers USING btree (qandaid);


--
-- TOC entry 2714 (class 2606 OID 16519)
-- Name: answers participantid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT participantid FOREIGN KEY (participantid) REFERENCES public.participants(participantid) ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 2715 (class 2606 OID 16524)
-- Name: answers qandaid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT qandaid FOREIGN KEY (qandaid) REFERENCES public.qanda(qandaid) NOT VALID;


-- Completed on 2021-06-05 10:20:25

--
-- PostgreSQL database dump complete
--

