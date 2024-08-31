PGDMP         7                {        	   weatherDB    15.2    15.1 #               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16426 	   weatherDB    DATABASE     w   CREATE DATABASE "weatherDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE "weatherDB";
                doadmin    false            �            1255    16654    insertbulkuser() 	   PROCEDURE     �  CREATE PROCEDURE public.insertbulkuser()
    LANGUAGE plpgsql
    AS $$
DECLARE
randomNumberStartLimit INTEGER;
randomNumberEndLimit INTEGER;
randomNumberGenerated INTEGER;
BEGIN
randomNumberStartLimit=10000; 
randomNumberEndLimit=20000;
FOR _index IN 1..50 LOOP
randomNumberGenerated = floor(random() *
(randomNumberStartLimit-randomNumberEndLimit + 1)
+ randomNumberEndLimit);
INSERT INTO "User"("firstName","lastName","username","phone","emailId","password","emailVerified", "createdOn")
VALUES (CONCAT('firstName',_index),CONCAT('lastName', _index),CONCAT('username',_index),randomNumberGenerated,CONCAT('username',_index,'@email.com'),CONCAT('password',_index),false,NOW());
END LOOP;
END;
$$;
 (   DROP PROCEDURE public.insertbulkuser();
       public          doadmin    false            �            1255    16622 �   insertuser(character varying, character varying, character varying, character varying, character varying, character varying, boolean) 	   PROCEDURE       CREATE PROCEDURE public.insertuser(IN "_firstName" character varying, IN "_lastName" character varying, IN _username character varying, IN _phone character varying, IN "_emailId" character varying, IN _password character varying, IN "_emailVerified" boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO "User"("firstName","lastName","username","phone","emailId","password","emailVerified","createdOn") 
VALUES("_firstName","_lastName","_username","_phone","_emailId","_password","_emailVerified", NOW());
END;
$$;
   DROP PROCEDURE public.insertuser(IN "_firstName" character varying, IN "_lastName" character varying, IN _username character varying, IN _phone character varying, IN "_emailId" character varying, IN _password character varying, IN "_emailVerified" boolean);
       public          doadmin    false            �            1255    16623 �   insertuser(character varying, character varying, character varying, character varying, character varying, character varying, boolean, timestamp without time zone) 	   PROCEDURE     <  CREATE PROCEDURE public.insertuser(IN "_firstName" character varying, IN "_lastName" character varying, IN _username character varying, IN _phone character varying, IN "_emailId" character varying, IN _password character varying, IN "_emailVerified" boolean, IN "_createdOn" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO "User"("firstName","lastName","username","phone","emailId","password","emailVerified","createdOn") 
VALUES("_firstName","_lastName","_username","_phone","_emailId","_password","_emailVerified", NOW());
COMMIT;
END;
$$;
 /  DROP PROCEDURE public.insertuser(IN "_firstName" character varying, IN "_lastName" character varying, IN _username character varying, IN _phone character varying, IN "_emailId" character varying, IN _password character varying, IN "_emailVerified" boolean, IN "_createdOn" timestamp without time zone);
       public          doadmin    false            �            1255    16621 �   inseruser(character varying, character varying, character varying, character varying, character varying, character varying, boolean) 	   PROCEDURE       CREATE PROCEDURE public.inseruser(IN "_firstName" character varying, IN "_lastName" character varying, IN _username character varying, IN _phone character varying, IN "_emailId" character varying, IN _password character varying, IN "_emailVerified" boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO "User"("firstName","lastName","username","phone","emailId","password","emailVerified","createdOn") 
VALUES("_firstName","_lastName","_username","_phone","_emailId","_password","_emailVerified", NOW());
END;
$$;
   DROP PROCEDURE public.inseruser(IN "_firstName" character varying, IN "_lastName" character varying, IN _username character varying, IN _phone character varying, IN "_emailId" character varying, IN _password character varying, IN "_emailVerified" boolean);
       public          doadmin    false            �            1255    16641    totalrecordsinuser()    FUNCTION     �   CREATE FUNCTION public.totalrecordsinuser() RETURNS integer
    LANGUAGE plpgsql
    AS $$
   DECLARE
     total INTEGER;
   BEGIN
      SELECT COUNT(*) INTO total FROM "User";
   RETURN total;
   END; 
   $$;
 +   DROP FUNCTION public.totalrecordsinuser();
       public          doadmin    false            �            1259    16538    City    TABLE       CREATE TABLE public."City" (
    "cityId" integer NOT NULL,
    name character varying NOT NULL,
    timezone character varying NOT NULL,
    longitude numeric NOT NULL,
    latitude numeric NOT NULL,
    "weatherCityId" integer NOT NULL,
    "countryId" integer NOT NULL
);
    DROP TABLE public."City";
       public         heap    doadmin    false            �            1259    16537    City_cityId_seq    SEQUENCE     �   ALTER TABLE public."City" ALTER COLUMN "cityId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."City_cityId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          doadmin    false    219            �            1259    16530    Country    TABLE     r   CREATE TABLE public."Country" (
    "countryId" integer NOT NULL,
    "countryCode" character varying NOT NULL
);
    DROP TABLE public."Country";
       public         heap    doadmin    false            �            1259    16529    Country_countryId_seq    SEQUENCE     �   ALTER TABLE public."Country" ALTER COLUMN "countryId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Country_countryId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          doadmin    false    217            �            1259    16464    User    TABLE     �  CREATE TABLE public."User" (
    "userId" integer NOT NULL,
    "firstName" character varying NOT NULL,
    "lastName" character varying NOT NULL,
    username character varying NOT NULL,
    phone character varying NOT NULL,
    "emailId" character varying NOT NULL,
    password character varying NOT NULL,
    "emailVerified" boolean NOT NULL,
    "createdOn" timestamp without time zone NOT NULL
);
    DROP TABLE public."User";
       public         heap    doadmin    false            �            1259    16463    User_userId_seq    SEQUENCE     �   ALTER TABLE public."User" ALTER COLUMN "userId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."User_userId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          doadmin    false    215            �            1259    16596    Weather    TABLE     �  CREATE TABLE public."Weather" (
    "weatherId" integer NOT NULL,
    "cityId" integer NOT NULL,
    "userId" integer NOT NULL,
    "weatherStatusId" integer NOT NULL,
    description character varying NOT NULL,
    icon character varying NOT NULL,
    sunrise timestamp without time zone NOT NULL,
    sunset timestamp without time zone NOT NULL,
    temp numeric NOT NULL,
    "feelsLike" numeric NOT NULL,
    "tempMin" numeric NOT NULL,
    "tempMax" numeric NOT NULL,
    pressure numeric NOT NULL,
    humidity numeric NOT NULL,
    visibility numeric NOT NULL,
    "windSpeed" numeric NOT NULL,
    "windDirection" numeric NOT NULL,
    "cloudsAll" numeric NOT NULL,
    "updatedOn" timestamp without time zone NOT NULL
);
    DROP TABLE public."Weather";
       public         heap    doadmin    false            �            1259    16634    WeatherView    VIEW     h  CREATE VIEW public."WeatherView" AS
 SELECT c.name,
    cn."countryCode",
    w.description,
    w.temp,
    w."feelsLike",
    w.humidity,
    w.pressure,
    w.sunrise,
    w.sunset,
    w."updatedOn"
   FROM ((public."City" c
     JOIN public."Country" cn ON ((c."countryId" = cn."countryId")))
     JOIN public."Weather" w ON ((w."cityId" = c."cityId")));
     DROP VIEW public."WeatherView";
       public          doadmin    false    217    221    221    221    221    221    221    221    221    221    219    219    219    217            �            1259    16595    Weather_weatherId_seq    SEQUENCE     �   ALTER TABLE public."Weather" ALTER COLUMN "weatherId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Weather_weatherId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          doadmin    false    221                      0    16538    City 
   TABLE DATA           m   COPY public."City" ("cityId", name, timezone, longitude, latitude, "weatherCityId", "countryId") FROM stdin;
    public          doadmin    false    219   �8                 0    16530    Country 
   TABLE DATA           ?   COPY public."Country" ("countryId", "countryCode") FROM stdin;
    public          doadmin    false    217   �9                 0    16464    User 
   TABLE DATA           �   COPY public."User" ("userId", "firstName", "lastName", username, phone, "emailId", password, "emailVerified", "createdOn") FROM stdin;
    public          doadmin    false    215   �9                 0    16596    Weather 
   TABLE DATA           �   COPY public."Weather" ("weatherId", "cityId", "userId", "weatherStatusId", description, icon, sunrise, sunset, temp, "feelsLike", "tempMin", "tempMax", pressure, humidity, visibility, "windSpeed", "windDirection", "cloudsAll", "updatedOn") FROM stdin;
    public          doadmin    false    221   nB                  0    0    City_cityId_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."City_cityId_seq"', 8, true);
          public          doadmin    false    218                       0    0    Country_countryId_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Country_countryId_seq"', 5, true);
          public          doadmin    false    216                       0    0    User_userId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."User_userId_seq"', 76, true);
          public          doadmin    false    214                       0    0    Weather_weatherId_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Weather_weatherId_seq"', 14, true);
          public          doadmin    false    220            v           2606    16544    City City_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."City"
    ADD CONSTRAINT "City_pkey" PRIMARY KEY ("cityId");
 <   ALTER TABLE ONLY public."City" DROP CONSTRAINT "City_pkey";
       public            doadmin    false    219            t           2606    16536    Country Country_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Country"
    ADD CONSTRAINT "Country_pkey" PRIMARY KEY ("countryId");
 B   ALTER TABLE ONLY public."Country" DROP CONSTRAINT "Country_pkey";
       public            doadmin    false    217            n           2606    16472    User User_emailId_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_emailId_key" UNIQUE ("emailId");
 C   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_emailId_key";
       public            doadmin    false    215            p           2606    16470    User User_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("userId");
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            doadmin    false    215            r           2606    16474    User User_username_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_username_key" UNIQUE (username);
 D   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_username_key";
       public            doadmin    false    215            x           2606    16602    Weather Weather_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Weather"
    ADD CONSTRAINT "Weather_pkey" PRIMARY KEY ("weatherId");
 B   ALTER TABLE ONLY public."Weather" DROP CONSTRAINT "Weather_pkey";
       public            doadmin    false    221            y           2606    16545    City City_countryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."City"
    ADD CONSTRAINT "City_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES public."Country"("countryId");
 F   ALTER TABLE ONLY public."City" DROP CONSTRAINT "City_countryId_fkey";
       public          doadmin    false    4212    219    217            z           2606    16603    Weather Weather_cityId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Weather"
    ADD CONSTRAINT "Weather_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES public."City"("cityId");
 I   ALTER TABLE ONLY public."Weather" DROP CONSTRAINT "Weather_cityId_fkey";
       public          doadmin    false    4214    221    219            {           2606    16608    Weather Weather_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Weather"
    ADD CONSTRAINT "Weather_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"("userId");
 I   ALTER TABLE ONLY public."Weather" DROP CONSTRAINT "Weather_userId_fkey";
       public          doadmin    false    4208    221    215               �   x�M�MK1��s�_���y�+
�7/EE�-��7��{�&-�q^_��NX�� �j��E�0<����c����FsSa.�G#�F#~�(p��HQ8�u^�	��\Z�J�=����[���ø���&�-�V��~Zb�$�1�������ߵ�=ԲO�]�Z��/s;�P��5O�����)�p�Ǯo�r�-�k�otl����\K)߱NDG         &   x�3�tq�2���2�t�2�tv�2������ OK�         h  x���[Wۼ���_ы��UG��\�B 	�TNk�8�C��C�~���5|�F���5�x<�HV9-f99*R�������&��ƀ�?���k����h\dd���ۢ���� ��ڿ���: �F0�r��� MI���&���]��:6���E��`L��k���"Oפ*���x΅T��>�����	�S F�rHeS���_�:|a�#L���(�k)r���?��F]�&0�����k���l^�Ȩ��F�76�<vL���t_�u����Z�_4��߫#>�1d8_��GYls�Ys���������6�<D uӼ����{�%��տ���j"�U�eK<����,�l�<%��:-�Ŕ���#�p_�/L�a�H���u�w�H@�R���#	�$x#����΁V�]{$x@B:	�H�&���ѵGB$�����lBJ[�X�g!=2 ���j$TR�
����D�$t#����ޅ���#��Ič���J u�;�HğK u��0MHC�hJ'a<& ���Q7{.�5��R!�o�h@�8�q4�v�c�u�c�s@s�ܠ37��d*�9|:�a4��M;�Zk2
ݏo�Y`�M<s#�܌[��Oj������37���N>5�o�Y`��>s��P�T�|��o�Y  � �*�e��2F�N��(�
kA`���N ��90��E���x��� ��&�@@K���G< �p<�&
.�x p���/����]�<���x ��dR
$��x��� ��H�
��x��� `��9|:p�p< ��P�Kt�>@�� �� j�A7��x��� иX�u�� <��x (���Q����@ p�����Ti���m��;�M�5�1>� �w<�n,�ɴ�9|:�2������\ �O'��x�pX�
R"�O'��x��6ʚ�I��}<���x��i��7���@ p���X��=0x��;p�k2i(*��<��x�8j�z�p_�x�<����@8X�i��T�x <����@��{h@�N��@8�eZ��qT�x <����@������%r�t<��� ��k0�^"��H��x P�����D��@8�~}\ ��Z�x <����@8X��Ѻ-|<H��x P����9>� �p<(l�?���x <P��� m�e��W�x <P@.���)�]V�d1�-i��{��G��|m4������U�v�է��$���)/�"%O4�Y�����y���zU�t\}l��
�WF�NNN�7�O��ÃmO/_�`x�������U2��F���YԽ�\C�1��8A��c{˜G `7�-%�U����ײ�Y�/���{����΅�mJj�o�rt?�<7��`UE����l�^��Y{7<�F�QyWM/v��|<ks���m:&2��%o)Mn�59,�UZ��5m���h��&�2�,���yRQ��_�7����`�=�m�����;���G������3��i�"�1[j��He3��%��brY��+S���޿��|�>=%�bf��)�`XV���������h�/��&��/h�빚]'�N菫���m8�_���M�g��ߋ������]�I����<���ϓ���Ǡ���dSڤ�dZ��I��wZ��$k����i{ f���� ����|���a���h���ZU�k~�;ߪ�iՕb�"-�Qq�>�A��H�͓5������3�I��if}�$�;��!{�����yss0T'鋾ٴ�_��mտ�Ų��{��{�,�l��������P��Qa7в��QQΓ���tG�oJ�?M7GE������f��esw2�.�o��?~G:}{�����w|W�w.���,���Q�c2@;��]� ����~�V3r��s�6_�+�0R+a������O|ٿ-��P\�߭��ʛ�����MN�v�M���mq��o�����(`u����V��-mQdcyd�մYֆl�H�|^����1���i�=���f�:�1��a-v�����	���F^�޾��g��2?�و��桼.M,D�Q���U�W�         �  x����n�0����D�Q�u��؍�H�"�t��~�sr��(�o����?�ۿ�����i7?����uH{`d� o�{�M�!�5�W�,y�d0��+HŠ��_���x�Η���x�i���8o�)�N��}l��bh&k�J3thH��$�`��j`��] �E⫄�օ����79�~o��N�7��г4�Fv��)��('o�#K8��RR)AĐ˕���R�jUk�����E�w�%�n��Ħ��8nBq=R��YC�D�}$��7��r~�,5�SӜ�XG�B�p�=��t��ǚq��Tk-�w��T�r�~{�8Ɔ	2�x�?�wr�5r �.P�F��⦥�_�&����,������ ��"����L]��TE��     