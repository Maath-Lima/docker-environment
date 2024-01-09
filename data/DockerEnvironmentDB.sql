--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Categorias" (
    "CategoriaId" integer NOT NULL,
    "Nome" character varying(100) NOT NULL,
    "Descricao" character varying(150) NOT NULL
);


ALTER TABLE public."Categorias" OWNER TO postgres;

--
-- Name: Categorias_CategoriaId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Categorias" ALTER COLUMN "CategoriaId" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Categorias_CategoriaId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Produtos" (
    "Id" integer NOT NULL,
    "Nome" character varying(100) NOT NULL,
    "Descricao" character varying(150),
    "Preco" numeric(14,2) NOT NULL,
    "Estoque" integer NOT NULL,
    "CategoriaId" integer NOT NULL
);


ALTER TABLE public."Produtos" OWNER TO postgres;

--
-- Name: Produtos_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Produtos" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Produtos_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO postgres;

--
-- Data for Name: Categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Categorias" ("CategoriaId", "Nome", "Descricao") FROM stdin;
13	Livro	To read your dumb!!
\.


--
-- Data for Name: Produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Produtos" ("Id", "Nome", "Descricao", "Preco", "Estoque", "CategoriaId") FROM stdin;
\.


--
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
20231201011334_Initial	7.0.14
\.


--
-- Name: Categorias_CategoriaId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Categorias_CategoriaId_seq"', 13, true);


--
-- Name: Produtos_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Produtos_Id_seq"', 2, true);


--
-- Name: Categorias PK_Categorias; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categorias"
    ADD CONSTRAINT "PK_Categorias" PRIMARY KEY ("CategoriaId");


--
-- Name: Produtos PK_Produtos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Produtos"
    ADD CONSTRAINT "PK_Produtos" PRIMARY KEY ("Id");


--
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- Name: IX_Produtos_CategoriaId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Produtos_CategoriaId" ON public."Produtos" USING btree ("CategoriaId");


--
-- Name: Produtos FK_Produtos_Categorias_CategoriaId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Produtos"
    ADD CONSTRAINT "FK_Produtos_Categorias_CategoriaId" FOREIGN KEY ("CategoriaId") REFERENCES public."Categorias"("CategoriaId") ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

