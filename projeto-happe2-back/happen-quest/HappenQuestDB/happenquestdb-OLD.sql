PGDMP                         y            happenquestdb    12.5    12.5                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    25472    happenquestdb    DATABASE     ?   CREATE DATABASE happenquestdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE happenquestdb;
                postgres    false            ?            1259    25490    answers    TABLE       CREATE TABLE public.answers (
    answersid integer NOT NULL,
    participantid integer,
    questionorder integer,
    answer1 boolean,
    answer2 boolean,
    answer3 boolean,
    answer4 boolean,
    answer5 boolean,
    weight1 integer,
    weight2 integer,
    weight3 integer,
    weight4 integer,
    weight5 bigint[],
    cat1 character varying(50),
    cat2 character varying(50),
    cat3 character varying(50),
    cat4 character varying(50),
    cat5 character varying(50),
    dateanswer time without time zone
);
    DROP TABLE public.answers;
       public         heap    postgres    false            ?            1259    25488    answers_answersid_seq    SEQUENCE     ?   CREATE SEQUENCE public.answers_answersid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.answers_answersid_seq;
       public          postgres    false    205                       0    0    answers_answersid_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.answers_answersid_seq OWNED BY public.answers.answersid;
          public          postgres    false    204            ?            1259    25479    participants    TABLE     ?  CREATE TABLE public.participants (
    participantid integer NOT NULL,
    name character varying(200) NOT NULL,
    email character varying(100) NOT NULL,
    telephone character varying(25),
    companyname character varying(200) NOT NULL,
    companyincome character varying(16),
    totalemployee integer,
    rhemployee integer,
    datequest timestamp without time zone NOT NULL,
    codequest character varying(6)
);
     DROP TABLE public.participants;
       public         heap    postgres    false            ?            1259    25477    participants_participantid_seq    SEQUENCE     ?   CREATE SEQUENCE public.participants_participantid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.participants_participantid_seq;
       public          postgres    false    203                       0    0    participants_participantid_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.participants_participantid_seq OWNED BY public.participants.participantid;
          public          postgres    false    202            ?
           2604    25493    answers answersid    DEFAULT     v   ALTER TABLE ONLY public.answers ALTER COLUMN answersid SET DEFAULT nextval('public.answers_answersid_seq'::regclass);
 @   ALTER TABLE public.answers ALTER COLUMN answersid DROP DEFAULT;
       public          postgres    false    204    205    205            ?
           2604    25482    participants participantid    DEFAULT     ?   ALTER TABLE ONLY public.participants ALTER COLUMN participantid SET DEFAULT nextval('public.participants_participantid_seq'::regclass);
 I   ALTER TABLE public.participants ALTER COLUMN participantid DROP DEFAULT;
       public          postgres    false    203    202    203                      0    25490    answers 
   TABLE DATA           ?   COPY public.answers (answersid, participantid, questionorder, answer1, answer2, answer3, answer4, answer5, weight1, weight2, weight3, weight4, weight5, cat1, cat2, cat3, cat4, cat5, dateanswer) FROM stdin;
    public          postgres    false    205   d                 0    25479    participants 
   TABLE DATA           ?   COPY public.participants (participantid, name, email, telephone, companyname, companyincome, totalemployee, rhemployee, datequest, codequest) FROM stdin;
    public          postgres    false    203   ?                  0    0    answers_answersid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.answers_answersid_seq', 1, false);
          public          postgres    false    204                       0    0    participants_participantid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.participants_participantid_seq', 1, false);
          public          postgres    false    202            ?
           2606    25498    answers answers_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (answersid);
 >   ALTER TABLE ONLY public.answers DROP CONSTRAINT answers_pkey;
       public            postgres    false    205            ?
           2606    25487    participants participants_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_pkey PRIMARY KEY (participantid);
 H   ALTER TABLE ONLY public.participants DROP CONSTRAINT participants_pkey;
       public            postgres    false    203            ?
           1259    25504    fki_participantid    INDEX     N   CREATE INDEX fki_participantid ON public.answers USING btree (participantid);
 %   DROP INDEX public.fki_participantid;
       public            postgres    false    205            ?
           2606    25499    answers participantid    FK CONSTRAINT     ?   ALTER TABLE ONLY public.answers
    ADD CONSTRAINT participantid FOREIGN KEY (participantid) REFERENCES public.participants(participantid) ON UPDATE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public.answers DROP CONSTRAINT participantid;
       public          postgres    false    203    2698    205                  x?????? ? ?            x?????? ? ?     