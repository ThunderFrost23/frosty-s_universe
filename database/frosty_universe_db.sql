PGDMP      '                |           frosty_universe %   14.13 (Ubuntu 14.13-0ubuntu0.22.04.1)    16.4     
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16385    frosty_universe    DATABASE     w   CREATE DATABASE frosty_universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';
    DROP DATABASE frosty_universe;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false                       0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    16387    artist    TABLE     �   CREATE TABLE public.artist (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    genre integer NOT NULL,
    logo character varying(255) NOT NULL,
    software character varying(50) NOT NULL
);
    DROP TABLE public.artist;
       public         heap    postgres    false    4            �            1259    16386    artist_id_seq    SEQUENCE     �   CREATE SEQUENCE public.artist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.artist_id_seq;
       public          postgres    false    210    4                       0    0    artist_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.artist_id_seq OWNED BY public.artist.id;
          public          postgres    false    209            �            1259    16414    genre    TABLE     `   CREATE TABLE public.genre (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.genre;
       public         heap    postgres    false    4            �            1259    16413    genre_id_seq    SEQUENCE     �   CREATE SEQUENCE public.genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.genre_id_seq;
       public          postgres    false    4    214                       0    0    genre_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.genre_id_seq OWNED BY public.genre.id;
          public          postgres    false    213            �            1259    16406    music    TABLE     
  CREATE TABLE public.music (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    artist integer NOT NULL,
    "time" time without time zone NOT NULL,
    year integer NOT NULL,
    genre integer NOT NULL
);
    DROP TABLE public.music;
       public         heap    postgres    false    4            �            1259    16405    music_id_seq    SEQUENCE     �   CREATE SEQUENCE public.music_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.music_id_seq;
       public          postgres    false    4    212                       0    0    music_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.music_id_seq OWNED BY public.music.id;
          public          postgres    false    211            k           2604    16390 	   artist id    DEFAULT     f   ALTER TABLE ONLY public.artist ALTER COLUMN id SET DEFAULT nextval('public.artist_id_seq'::regclass);
 8   ALTER TABLE public.artist ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            m           2604    16417    genre id    DEFAULT     d   ALTER TABLE ONLY public.genre ALTER COLUMN id SET DEFAULT nextval('public.genre_id_seq'::regclass);
 7   ALTER TABLE public.genre ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            l           2604    16409    music id    DEFAULT     d   ALTER TABLE ONLY public.music ALTER COLUMN id SET DEFAULT nextval('public.music_id_seq'::regclass);
 7   ALTER TABLE public.music ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212                      0    16387    artist 
   TABLE DATA           A   COPY public.artist (id, name, genre, logo, software) FROM stdin;
    public          postgres    false    210   O                 0    16414    genre 
   TABLE DATA           )   COPY public.genre (id, name) FROM stdin;
    public          postgres    false    214   l                 0    16406    music 
   TABLE DATA           K   COPY public.music (id, name, url, artist, "time", year, genre) FROM stdin;
    public          postgres    false    212   �                  0    0    artist_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.artist_id_seq', 1, false);
          public          postgres    false    209                       0    0    genre_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.genre_id_seq', 1, false);
          public          postgres    false    213                       0    0    music_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.music_id_seq', 1, false);
          public          postgres    false    211            o           2606    16421    artist artist_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.artist DROP CONSTRAINT artist_pkey;
       public            postgres    false    210            s           2606    16423    genre genre_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.genre DROP CONSTRAINT genre_pkey;
       public            postgres    false    214            q           2606    16419    music music_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.music
    ADD CONSTRAINT music_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.music DROP CONSTRAINT music_pkey;
       public            postgres    false    212            t           2606    16434    artist fk_artist_genre    FK CONSTRAINT     s   ALTER TABLE ONLY public.artist
    ADD CONSTRAINT fk_artist_genre FOREIGN KEY (genre) REFERENCES public.genre(id);
 @   ALTER TABLE ONLY public.artist DROP CONSTRAINT fk_artist_genre;
       public          postgres    false    214    210    3187            u           2606    16424    music fk_music_artist    FK CONSTRAINT     t   ALTER TABLE ONLY public.music
    ADD CONSTRAINT fk_music_artist FOREIGN KEY (artist) REFERENCES public.artist(id);
 ?   ALTER TABLE ONLY public.music DROP CONSTRAINT fk_music_artist;
       public          postgres    false    212    210    3183            v           2606    16429    music fk_music_genre    FK CONSTRAINT     q   ALTER TABLE ONLY public.music
    ADD CONSTRAINT fk_music_genre FOREIGN KEY (genre) REFERENCES public.genre(id);
 >   ALTER TABLE ONLY public.music DROP CONSTRAINT fk_music_genre;
       public          postgres    false    3187    214    212                  x������ � �            x������ � �            x������ � �     