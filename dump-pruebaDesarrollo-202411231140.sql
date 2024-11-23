PGDMP      (            
    |            pruebaDesarrollo    17.2    17.2 )    7           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            8           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            9           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            :           1262    16388    pruebaDesarrollo    DATABASE     �   CREATE DATABASE "pruebaDesarrollo" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Latin America.utf8';
 "   DROP DATABASE "pruebaDesarrollo";
                     postgres    false            �            1259    16470    habitacionacomodacion    TABLE     �   CREATE TABLE public.habitacionacomodacion (
    idhabitacionacomodacion integer NOT NULL,
    habitaciontipoid integer NOT NULL,
    tipoacomodacionid integer NOT NULL
);
 )   DROP TABLE public.habitacionacomodacion;
       public         heap r       postgres    false            �            1259    16469 1   habitacionacomodacion_idhabitacionacomodacion_seq    SEQUENCE       ALTER TABLE public.habitacionacomodacion ALTER COLUMN idhabitacionacomodacion ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.habitacionacomodacion_idhabitacionacomodacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    224            �            1259    16486    habitaciones    TABLE     �   CREATE TABLE public.habitaciones (
    idhabitacion integer NOT NULL,
    hotelid integer NOT NULL,
    habitacionacomodacionid integer NOT NULL,
    cantidad integer NOT NULL
);
     DROP TABLE public.habitaciones;
       public         heap r       postgres    false            �            1259    16485    habitaciones_idhabitacion_seq    SEQUENCE     �   ALTER TABLE public.habitaciones ALTER COLUMN idhabitacion ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.habitaciones_idhabitacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    226            �            1259    16444    hoteles    TABLE       CREATE TABLE public.hoteles (
    idhotel integer NOT NULL,
    nombrehotel character varying NOT NULL,
    direccionhotel character varying NOT NULL,
    nit character varying NOT NULL,
    numerohabitaciones integer NOT NULL,
    ciudad character varying NOT NULL
);
    DROP TABLE public.hoteles;
       public         heap r       postgres    false            �            1259    16443    hoteles_idhotel_seq    SEQUENCE     �   ALTER TABLE public.hoteles ALTER COLUMN idhotel ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.hoteles_idhotel_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    218            �            1259    16502 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap r       postgres    false            �            1259    16501    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public               postgres    false    228            ;           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public               postgres    false    227            �            1259    16462    tipoacomodacion    TABLE     �   CREATE TABLE public.tipoacomodacion (
    idtipoacomodacion integer NOT NULL,
    tipoacomodacion character varying NOT NULL
);
 #   DROP TABLE public.tipoacomodacion;
       public         heap r       postgres    false            �            1259    16461 %   tipoacomodacion_idtipoacomodacion_seq    SEQUENCE     �   ALTER TABLE public.tipoacomodacion ALTER COLUMN idtipoacomodacion ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.tipoacomodacion_idtipoacomodacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    222            �            1259    16454    tipohabitacion    TABLE     }   CREATE TABLE public.tipohabitacion (
    idhabitaciontipo integer NOT NULL,
    tipohabitacion character varying NOT NULL
);
 "   DROP TABLE public.tipohabitacion;
       public         heap r       postgres    false            �            1259    16453 #   tipohabitacion_idhabitaciontipo_seq    SEQUENCE     �   ALTER TABLE public.tipohabitacion ALTER COLUMN idhabitaciontipo ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.tipohabitacion_idhabitaciontipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    220            �           2604    16505    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    228    227    228            0          0    16470    habitacionacomodacion 
   TABLE DATA           m   COPY public.habitacionacomodacion (idhabitacionacomodacion, habitaciontipoid, tipoacomodacionid) FROM stdin;
    public               postgres    false    224   _3       2          0    16486    habitaciones 
   TABLE DATA           `   COPY public.habitaciones (idhabitacion, hotelid, habitacionacomodacionid, cantidad) FROM stdin;
    public               postgres    false    226   �3       *          0    16444    hoteles 
   TABLE DATA           h   COPY public.hoteles (idhotel, nombrehotel, direccionhotel, nit, numerohabitaciones, ciudad) FROM stdin;
    public               postgres    false    218   �3       4          0    16502 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public               postgres    false    228   "4       .          0    16462    tipoacomodacion 
   TABLE DATA           M   COPY public.tipoacomodacion (idtipoacomodacion, tipoacomodacion) FROM stdin;
    public               postgres    false    222   w4       ,          0    16454    tipohabitacion 
   TABLE DATA           J   COPY public.tipohabitacion (idhabitaciontipo, tipohabitacion) FROM stdin;
    public               postgres    false    220   �4       <           0    0 1   habitacionacomodacion_idhabitacionacomodacion_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public.habitacionacomodacion_idhabitacionacomodacion_seq', 1, false);
          public               postgres    false    223            =           0    0    habitaciones_idhabitacion_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.habitaciones_idhabitacion_seq', 1, false);
          public               postgres    false    225            >           0    0    hoteles_idhotel_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.hoteles_idhotel_seq', 1, false);
          public               postgres    false    217            ?           0    0    migrations_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.migrations_id_seq', 3, true);
          public               postgres    false    227            @           0    0 %   tipoacomodacion_idtipoacomodacion_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.tipoacomodacion_idtipoacomodacion_seq', 1, false);
          public               postgres    false    221            A           0    0 #   tipohabitacion_idhabitaciontipo_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.tipohabitacion_idhabitaciontipo_seq', 1, false);
          public               postgres    false    219            �           2606    16474 .   habitacionacomodacion habitacionacomodacion_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.habitacionacomodacion
    ADD CONSTRAINT habitacionacomodacion_pk PRIMARY KEY (idhabitacionacomodacion);
 X   ALTER TABLE ONLY public.habitacionacomodacion DROP CONSTRAINT habitacionacomodacion_pk;
       public                 postgres    false    224            �           2606    16490    habitaciones habitaciones_pk 
   CONSTRAINT     d   ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT habitaciones_pk PRIMARY KEY (idhabitacion);
 F   ALTER TABLE ONLY public.habitaciones DROP CONSTRAINT habitaciones_pk;
       public                 postgres    false    226            �           2606    16450    hoteles hoteles_pk 
   CONSTRAINT     U   ALTER TABLE ONLY public.hoteles
    ADD CONSTRAINT hoteles_pk PRIMARY KEY (idhotel);
 <   ALTER TABLE ONLY public.hoteles DROP CONSTRAINT hoteles_pk;
       public                 postgres    false    218            �           2606    16452    hoteles hoteles_unique 
   CONSTRAINT     P   ALTER TABLE ONLY public.hoteles
    ADD CONSTRAINT hoteles_unique UNIQUE (nit);
 @   ALTER TABLE ONLY public.hoteles DROP CONSTRAINT hoteles_unique;
       public                 postgres    false    218            �           2606    16507    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public                 postgres    false    228            �           2606    16468 "   tipoacomodacion tipoacomodacion_pk 
   CONSTRAINT     o   ALTER TABLE ONLY public.tipoacomodacion
    ADD CONSTRAINT tipoacomodacion_pk PRIMARY KEY (idtipoacomodacion);
 L   ALTER TABLE ONLY public.tipoacomodacion DROP CONSTRAINT tipoacomodacion_pk;
       public                 postgres    false    222            �           2606    16460     tipohabitacion tipohabitacion_pk 
   CONSTRAINT     l   ALTER TABLE ONLY public.tipohabitacion
    ADD CONSTRAINT tipohabitacion_pk PRIMARY KEY (idhabitaciontipo);
 J   ALTER TABLE ONLY public.tipohabitacion DROP CONSTRAINT tipohabitacion_pk;
       public                 postgres    false    220            �           2606    16480 >   habitacionacomodacion habitacionacomodacion_tipoacomodacion_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.habitacionacomodacion
    ADD CONSTRAINT habitacionacomodacion_tipoacomodacion_fk FOREIGN KEY (tipoacomodacionid) REFERENCES public.tipoacomodacion(idtipoacomodacion);
 h   ALTER TABLE ONLY public.habitacionacomodacion DROP CONSTRAINT habitacionacomodacion_tipoacomodacion_fk;
       public               postgres    false    224    4749    222            �           2606    16475 =   habitacionacomodacion habitacionacomodacion_tipohabitacion_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.habitacionacomodacion
    ADD CONSTRAINT habitacionacomodacion_tipohabitacion_fk FOREIGN KEY (habitaciontipoid) REFERENCES public.tipohabitacion(idhabitaciontipo);
 g   ALTER TABLE ONLY public.habitacionacomodacion DROP CONSTRAINT habitacionacomodacion_tipohabitacion_fk;
       public               postgres    false    220    224    4747            �           2606    16496 2   habitaciones habitaciones_habitacionacomodacion_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT habitaciones_habitacionacomodacion_fk FOREIGN KEY (habitacionacomodacionid) REFERENCES public.habitacionacomodacion(idhabitacionacomodacion);
 \   ALTER TABLE ONLY public.habitaciones DROP CONSTRAINT habitaciones_habitacionacomodacion_fk;
       public               postgres    false    224    226    4751            �           2606    16491 $   habitaciones habitaciones_hoteles_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT habitaciones_hoteles_fk FOREIGN KEY (hotelid) REFERENCES public.hoteles(idhotel);
 N   ALTER TABLE ONLY public.habitaciones DROP CONSTRAINT habitaciones_hoteles_fk;
       public               postgres    false    226    4743    218            0   .   x�ȱ  ��?wq,��s�F�J��Ѵ�f���͍�[��h�      2   "   x�3�4B#S.# e�ih�e�s�r��qqq >��      *   C   x�3�tIMN�M-��SpN,*ILO�K�tN��IU02V0��52�4426153�е�41�+����� ��      4   E   x�3�4000��"0�O.JM,I�/-N-*�/IL�I�4�2�PhS�����
Wh����0+?	a`� ��$      .   1   x�3�N�K���I�2�t�O�I�2�)�, 2L8�KS�JA�=... 3��      ,   )   x�3�t-.I�KI,�2��*���/�2�.�,I����� ��	+     