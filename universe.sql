--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    type text,
    distance_in_million_of_ly numeric,
    diameter_in_ly integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    discovery_century text,
    is_retrograde boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: moon_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_planet (
    name character varying NOT NULL,
    planet character varying,
    star character varying,
    galaxy character varying,
    moon_planet_id integer NOT NULL
);


ALTER TABLE public.moon_planet OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon_planet.moon_planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer NOT NULL,
    has_life boolean,
    orbital_period_in_days integer,
    has_satellite boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_class text,
    temperature_k integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: moon_planet moon_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet ALTER COLUMN moon_planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'SBbc', 0.0265, 87400);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 'Irr', 0.025, 220);
INSERT INTO public.galaxy VALUES (3, 'Draco II', NULL, 0.0701, 120);
INSERT INTO public.galaxy VALUES (4, 'Tucana III', NULL, 0.075, NULL);
INSERT INTO public.galaxy VALUES (5, 'Segue 1', 'dSph/E7', 0.078, 10000);
INSERT INTO public.galaxy VALUES (6, 'Sagittarius Dwarf Sphr', NULL, 0.0907, 200);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (11, 'Pasiphae', 5, 'XX', true);
INSERT INTO public.moon VALUES (12, 'Sinope', 5, 'XX', true);
INSERT INTO public.moon VALUES (14, 'Carme', 5, 'XX', true);
INSERT INTO public.moon VALUES (15, 'Ananke', 5, 'XX', true);
INSERT INTO public.moon VALUES (20, 'Callirrhoe', 5, 'XX', true);
INSERT INTO public.moon VALUES (24, 'Triton', 8, 'XIX', true);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'XIX', false);
INSERT INTO public.moon VALUES (13, 'Lysithea', 5, 'XX', false);
INSERT INTO public.moon VALUES (16, 'Leda', 5, 'XX', false);
INSERT INTO public.moon VALUES (17, 'Thebe', 5, 'XX', false);
INSERT INTO public.moon VALUES (18, 'Adrastea', 5, 'XX', false);
INSERT INTO public.moon VALUES (19, 'Metis', 5, 'XX', false);
INSERT INTO public.moon VALUES (21, 'Titan', 6, 'XVII', false);
INSERT INTO public.moon VALUES (22, 'Rhea', 6, 'XVII', false);
INSERT INTO public.moon VALUES (23, 'Iapetus', 6, 'XVII', false);
INSERT INTO public.moon VALUES (25, 'Titania', 7, 'XVIII', false);
INSERT INTO public.moon VALUES (26, 'Oberon', 7, 'XVIII', false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'XIX', false);
INSERT INTO public.moon VALUES (1, 'Moon', 3, NULL, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'XVII', false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'XVII', false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'XVII', false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'XVII', false);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 'XIX', false);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 'XX', false);
INSERT INTO public.moon VALUES (10, 'Elara', 5, 'XX', false);


--
-- Data for Name: moon_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_planet VALUES ('Pasiphae', 'Jupiter', 'Sun', 'Milky Way', 1);
INSERT INTO public.moon_planet VALUES ('Sinope', 'Jupiter', 'Sun', 'Milky Way', 2);
INSERT INTO public.moon_planet VALUES ('Carme', 'Jupiter', 'Sun', 'Milky Way', 3);
INSERT INTO public.moon_planet VALUES ('Ananke', 'Jupiter', 'Sun', 'Milky Way', 4);
INSERT INTO public.moon_planet VALUES ('Callirrhoe', 'Jupiter', 'Sun', 'Milky Way', 5);
INSERT INTO public.moon_planet VALUES ('Triton', 'Neptune', 'Sun', 'Milky Way', 6);
INSERT INTO public.moon_planet VALUES ('Deimos', 'Mars', 'Sun', 'Milky Way', 7);
INSERT INTO public.moon_planet VALUES ('Lysithea', 'Jupiter', 'Sun', 'Milky Way', 8);
INSERT INTO public.moon_planet VALUES ('Leda', 'Jupiter', 'Sun', 'Milky Way', 9);
INSERT INTO public.moon_planet VALUES ('Thebe', 'Jupiter', 'Sun', 'Milky Way', 10);
INSERT INTO public.moon_planet VALUES ('Adrastea', 'Jupiter', 'Sun', 'Milky Way', 11);
INSERT INTO public.moon_planet VALUES ('Metis', 'Jupiter', 'Sun', 'Milky Way', 12);
INSERT INTO public.moon_planet VALUES ('Titan', 'Saturn', 'Sun', 'Milky Way', 13);
INSERT INTO public.moon_planet VALUES ('Rhea', 'Saturn', 'Sun', 'Milky Way', 14);
INSERT INTO public.moon_planet VALUES ('Iapetus', 'Saturn', 'Sun', 'Milky Way', 15);
INSERT INTO public.moon_planet VALUES ('Titania', 'Uranus', 'Sun', 'Milky Way', 16);
INSERT INTO public.moon_planet VALUES ('Oberon', 'Uranus', 'Sun', 'Milky Way', 17);
INSERT INTO public.moon_planet VALUES ('Phobos', 'Mars', 'Sun', 'Milky Way', 18);
INSERT INTO public.moon_planet VALUES ('Moon', 'Earth', 'Sun', 'Milky Way', 19);
INSERT INTO public.moon_planet VALUES ('Io', 'Jupiter', 'Sun', 'Milky Way', 20);
INSERT INTO public.moon_planet VALUES ('Europa', 'Jupiter', 'Sun', 'Milky Way', 21);
INSERT INTO public.moon_planet VALUES ('Ganymede', 'Jupiter', 'Sun', 'Milky Way', 22);
INSERT INTO public.moon_planet VALUES ('Callisto', 'Jupiter', 'Sun', 'Milky Way', 23);
INSERT INTO public.moon_planet VALUES ('Amalthea', 'Jupiter', 'Sun', 'Milky Way', 24);
INSERT INTO public.moon_planet VALUES ('Himalia', 'Jupiter', 'Sun', 'Milky Way', 25);
INSERT INTO public.moon_planet VALUES ('Elara', 'Jupiter', 'Sun', 'Milky Way', 26);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 4, false, 11, NULL);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri d', 4, false, 5, NULL);
INSERT INTO public.planet VALUES (13, 'Lalande 21185 b', 7, false, 13, NULL);
INSERT INTO public.planet VALUES (14, 'Lalande 21185 c', 7, false, 3188, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 1, false, 365, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, true, 687, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, 4333, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, 10759, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, 30687, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, 60190, true);
INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, 88, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, 225, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'Lalande 21185', 1, 'M2V', 3828);
INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 5778);
INSERT INTO public.star VALUES (2, 'Vega', 1, 'A0V', 9602);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'A0mA1 Va', 9940);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'M5.5 Ve', 3042);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 'M2lab', 3500);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 'B8lab', 11000);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 53, true);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 26, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 14, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unq UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon_planet moon_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_pkey PRIMARY KEY (moon_planet_id);


--
-- Name: moon_planet moon_planet_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_unq UNIQUE (name);


--
-- Name: moon moon_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unq UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unq UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unq UNIQUE (name);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
