--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    distance_light_years integer,
    number_of_stars bigint,
    type character varying(60) NOT NULL
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
-- Name: launches; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.launches (
    launches_id integer NOT NULL,
    name character varying(30) NOT NULL,
    launch_year integer NOT NULL,
    mission_duration_days integer,
    launch_site character varying(255)
);


ALTER TABLE public.launches OWNER TO freecodecamp;

--
-- Name: launches_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.launches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.launches_id_seq OWNER TO freecodecamp;

--
-- Name: launches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.launches_id_seq OWNED BY public.launches.launches_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km double precision,
    discovery_year integer
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    orbital_period_day integer,
    diameter_km numeric,
    star_id integer
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    spectral_type character varying(50),
    apparent_magnitude double precision
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
-- Name: launches launches_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.launches ALTER COLUMN launches_id SET DEFAULT nextval('public.launches_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 100000000, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000, 100000000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000, 40000000, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 53500000, 1000000000, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 23000000, 100000000, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic', 160000, 10000000, 'Irregular');


--
-- Data for Name: launches; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.launches VALUES (1, 'Apollo 11', 1969, 8, 'Kennedy Space Center');
INSERT INTO public.launches VALUES (2, 'Yuri Gagarin Vostok 1', 1961, 1, 'Baikonur Cosmodrome');
INSERT INTO public.launches VALUES (3, 'Space Shuttle Program', 1981, 135, 'Kennedy Space Center');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Europa', 1, 3121, 1610);
INSERT INTO public.moon VALUES (2, 'Titan', 2, 5150, 1655);
INSERT INTO public.moon VALUES (3, 'Phobos', 3, 22.4, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 1, 3643, 1610);
INSERT INTO public.moon VALUES (5, 'Ganymede', 1, 5262, 1610);
INSERT INTO public.moon VALUES (6, 'Callisto', 1, 4821, 1610);
INSERT INTO public.moon VALUES (7, 'Rhea', 2, 1528, 1672);
INSERT INTO public.moon VALUES (8, 'Enceladus', 2, 504, 1789);
INSERT INTO public.moon VALUES (9, 'Mimas', 2, 396, 1789);
INSERT INTO public.moon VALUES (10, 'Deimos', 3, 12.4, 1877);
INSERT INTO public.moon VALUES (11, 'Titania', 7, 1578, 1787);
INSERT INTO public.moon VALUES (12, 'Oberon', 7, 1522, 1787);
INSERT INTO public.moon VALUES (13, 'Miranda', 7, 471, 1985);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 1162, 1851);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 1177, 1851);
INSERT INTO public.moon VALUES (16, 'Triton', 8, 2706, 1846);
INSERT INTO public.moon VALUES (17, 'Nereid', 8, 170, 1981);
INSERT INTO public.moon VALUES (18, 'Proteus', 8, 418, 1989);
INSERT INTO public.moon VALUES (19, 'Charon', 10, 1212, 1978);
INSERT INTO public.moon VALUES (20, 'Haumea', 11, 2320, 2008);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Jupyter', 'The largest planet in the Solar System, known for its Great Red Spot and many moons', false, true, 4600, 4333, 139.8, 1);
INSERT INTO public.planet VALUES (2, 'Saturn', 'Known for its prominent ring system, it is the second-largest planet in the Solar System.', false, true, 4500, 10759, 116460, 1);
INSERT INTO public.planet VALUES (3, 'Mars', 'The fourth planet from the Sun, known for its reddish appearance and potential for past water.', false, true, 4600, 687, 6779, 1);
INSERT INTO public.planet VALUES (4, 'Mercury', 'The closest planet to the Sun, known for its extreme temperature variations.', false, true, 4600, 88, 4879, 1);
INSERT INTO public.planet VALUES (5, 'Venus', 'The second planet from the Sun, similar in size to Earth but with a thick, toxic atmosphere.', false, true, 4600, 225, 12104, 1);
INSERT INTO public.planet VALUES (6, 'Earth', 'The third planet from the Sun, known for its water and life-supporting environment.', true, true, 4600, 365, 12742, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'The seventh planet from the Sun, known for its blue color and unique tilt.', false, true, 4600, 365, 50724, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The eighth planet from the Sun, known for its strong winds and deep blue color.', false, true, 4600, 365, 49244, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Once classified as the ninth planet, now considered a dwarf planet.', false, true, 4600, 90560, 2376, 1);
INSERT INTO public.planet VALUES (10, 'Eris', 'A dwarf planet located in the scattered disc region, known for its highly elliptical orbit.', false, true, 4600, 56100, 2326, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 'A dwarf planet known for its elongated shape due to its rapid rotation.', false, true, 4600, 10300, 1630, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', 'A dwarf planet with a bright surface and one of the largest objects in the Kuiper Belt.', false, true, 4600, 11100, 1430, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', -26.74);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type', -1.46);
INSERT INTO public.star VALUES (3, 'Polaris', 1, 'F-type', 1.98);
INSERT INTO public.star VALUES (4, 'Mirach', 2, 'K-type', 1.92);
INSERT INTO public.star VALUES (5, 'Almach', 2, 'K-type', 2.13);
INSERT INTO public.star VALUES (6, 'M31 Massive Star', 2, 'B-type', 1.3);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: launches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.launches_id_seq', 3, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 3, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 3, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: launches launches_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.launches
    ADD CONSTRAINT launches_pkey PRIMARY KEY (launches_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: launches unique_launch_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.launches
    ADD CONSTRAINT unique_launch_name UNIQUE (name, launch_year);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

