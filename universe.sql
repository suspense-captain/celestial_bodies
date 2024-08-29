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
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years numeric(15,2),
    galaxy_types character varying(100)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_cluster (
    galaxy_cluster_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_cluster OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_cluster_galaxy_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq OWNED BY public.galaxy_cluster.galaxy_cluster_id;


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    radius numeric(10,2),
    description text,
    has_life boolean,
    age_in_millions_of_years numeric(15,2),
    moon_types character varying(100),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    radius numeric(10,2),
    no_of_moons integer,
    description text,
    has_life boolean,
    age_in_millions_of_years numeric(15,2),
    planet_types character varying(100),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    no_of_planets integer,
    description text,
    age_in_millions_of_years numeric(15,2),
    star_types character varying(100),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_cluster galaxy_cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster ALTER COLUMN galaxy_cluster_id SET DEFAULT nextval('public.galaxy_cluster_galaxy_cluster_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'The nearest spiral galaxy to the Milky Way, known for its large size and brightness.', 10000.00, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'The galaxy that contains our solar system, characterized by its barred spiral structure.', 13000.00, 'Barred Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A small spiral galaxy that is part of the Local Group of galaxies, known for its faint appearance.', 3000.00, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'A classic spiral galaxy located in the constellation Canes Venatici, known for its distinct spiral arms.', 10000.00, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'A giant elliptical galaxy located in the Virgo Cluster, notable for its supermassive black hole.', 13000.00, 'Elliptical');
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'A spiral galaxy with a bright nucleus and a large central bulge, resembling a sombrero hat.', 10000.00, 'Spiral');


--
-- Data for Name: galaxy_cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_cluster VALUES (1, 'Local Group', 'A collection of more than 50 galaxies, including the Milky Way, Andromeda, and Triangulum, bound by mutual gravitational attraction.');
INSERT INTO public.galaxy_cluster VALUES (2, 'Virgo Cluster', 'One of the nearest and most massive galaxy clusters to the Milky Way, located in the constellation Virgo, containing thousands of galaxies.');
INSERT INTO public.galaxy_cluster VALUES (3, 'Coma Cluster', 'A large galaxy cluster in the constellation Coma Berenices, notable for its high density of galaxies and significant X-ray emission.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (27, 'Calypso', 9.50, 'A small irregularly shaped moon with a cratered surface.', false, 4600.00, 'Irregular', 1);
INSERT INTO public.moon VALUES (28, 'Moon', 1737.40, 'Earth’s only natural satellite, known for its surface craters and phases.', false, 4600.00, 'Terrestrial', 3);
INSERT INTO public.moon VALUES (29, 'Phobos', 11.00, 'A small, irregularly shaped moon with a cratered surface.', false, 4600.00, 'Irregular', 2);
INSERT INTO public.moon VALUES (30, 'Deimos', 6.20, 'The smaller and more distant of Mars’s two moons, irregularly shaped.', false, 4600.00, 'Irregular', 2);
INSERT INTO public.moon VALUES (31, 'Io', 1821.60, 'One of Jupiter’s largest moons, known for its intense volcanic activity.', false, 4600.00, 'Galilean', 5);
INSERT INTO public.moon VALUES (32, 'Europa', 1560.80, 'A moon with a smooth ice-covered surface, thought to have a subsurface ocean.', false, 4600.00, 'Galilean', 5);
INSERT INTO public.moon VALUES (33, 'Ganymede', 2634.10, 'The largest moon in the Solar System, with a magnetic field.', false, 4600.00, 'Galilean', 5);
INSERT INTO public.moon VALUES (34, 'Callisto', 2400.00, 'A heavily cratered moon with a very old surface.', false, 4600.00, 'Galilean', 5);
INSERT INTO public.moon VALUES (35, 'Titan', 2575.00, 'Saturn’s largest moon, known for its thick atmosphere and lakes of liquid methane.', false, 4600.00, 'Satellite', 6);
INSERT INTO public.moon VALUES (36, 'Rhea', 764.60, 'A mid-sized moon with a heavily cratered surface and thin rings.', false, 4600.00, 'Satellite', 6);
INSERT INTO public.moon VALUES (37, 'Iapetus', 735.60, 'A moon known for its two-tone coloration and equatorial ridge.', false, 4600.00, 'Satellite', 6);
INSERT INTO public.moon VALUES (38, 'Enceladus', 252.10, 'A small moon known for its geysers and possible subsurface ocean.', false, 4600.00, 'Satellite', 6);
INSERT INTO public.moon VALUES (39, 'Titania', 788.00, 'Uranus’s largest moon, with a surface of ice and rock.', false, 4600.00, 'Satellite', 7);
INSERT INTO public.moon VALUES (40, 'Oberon', 761.40, 'Another large moon of Uranus, known for its heavily cratered surface.', false, 4600.00, 'Satellite', 7);
INSERT INTO public.moon VALUES (41, 'Miranda', 235.80, 'A small moon with a very varied surface including canyons and ridges.', false, 4600.00, 'Satellite', 7);
INSERT INTO public.moon VALUES (42, 'Ariel', 578.90, 'A moon with a surface of ice and rock, with many craters and valleys.', false, 4600.00, 'Satellite', 7);
INSERT INTO public.moon VALUES (43, 'Triton', 1353.00, 'Neptune’s largest moon, known for its retrograde orbit and geysers.', false, 4600.00, 'Satellite', 8);
INSERT INTO public.moon VALUES (44, 'Proteus', 418.00, 'A large, irregularly shaped moon with a heavily cratered surface.', false, 4600.00, 'Satellite', 8);
INSERT INTO public.moon VALUES (45, 'Nereid', 170.00, 'A moon with a highly elliptical orbit and a heavily cratered surface.', false, 4600.00, 'Satellite', 8);
INSERT INTO public.moon VALUES (46, 'Charon', 606.00, 'The largest moon of Pluto, with a similar size and density.', false, 4600.00, 'Satellite', 4);
INSERT INTO public.moon VALUES (47, 'Styx', 10.00, 'One of Pluto’s smaller moons, with a roughly spherical shape.', false, 4600.00, 'Satellite', 4);
INSERT INTO public.moon VALUES (48, 'Nix', 45.00, 'Another small moon of Pluto, known for its irregular shape and rotation.', false, 4600.00, 'Satellite', 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2439.70, 0, 'The smallest and closest planet to the Sun, with a very thin atmosphere.', false, 4600.00, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 6051.80, 0, 'The second planet from the Sun, known for its thick, toxic atmosphere and extreme surface temperatures.', false, 4600.00, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 6371.00, 1, 'The third planet from the Sun, known for its liquid water and diverse life forms.', true, 4600.00, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3389.50, 2, 'The fourth planet from the Sun, known as the Red Planet due to iron oxide on its surface.', false, 4600.00, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 69911.00, 79, 'The largest planet in the Solar System, known for its Great Red Spot and numerous moons.', false, 4600.00, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 58232.00, 83, 'Famous for its prominent ring system and many moons.', false, 4600.00, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 25362.00, 27, 'An ice giant with a unique tilt that causes extreme seasonal variations.', false, 4600.00, 'Ice Giant', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 24622.00, 14, 'The farthest planet from the Sun, known for its strong winds and deep blue color.', false, 4600.00, 'Ice Giant', 1);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 13900.00, 0, 'A potentially habitable exoplanet in the habitable zone of its star.', false, 600.00, 'Exoplanet', 2);
INSERT INTO public.planet VALUES (10, 'HD 209458 b', 11700.00, 0, 'Known as “Osiris,” it is a hot Jupiter located close to its star.', false, 500.00, 'Exoplanet', 2);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 11400.00, 0, 'An exoplanet in the habitable zone of Proxima Centauri.', false, 4000.00, 'Exoplanet', 3);
INSERT INTO public.planet VALUES (12, '51 Pegasi b', 10000.00, 0, 'One of the first exoplanets discovered around a Sun-like star.', false, 600.00, 'Exoplanet', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 'The star at the center of the Solar System, essential for life on Earth.', 4600.00, 'G-type Main-sequence', 1);
INSERT INTO public.star VALUES (2, 'Sirius', 0, 'The brightest star in the night sky, part of the constellation Canis Major.', 200.00, 'A-type Main-sequence', 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 0, 'A red supergiant star in the constellation Orion, known for its large size and bright color.', 100.00, 'Red Supergiant', 2);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 0, 'The closest known star to the Sun, part of the Alpha Centauri star system.', 4500.00, 'Red Dwarf', 3);
INSERT INTO public.star VALUES (5, 'Polaris', 0, 'The North Star, located nearly at the celestial North Pole, important for navigation.', 7000.00, 'F-type Supergiant', 4);
INSERT INTO public.star VALUES (6, 'Altair', 0, 'A bright star in the constellation Aquila, known for its rapid rotation and blue-white color.', 1000.00, 'A-type Main-sequence', 5);


--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_cluster_galaxy_cluster_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 48, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_cluster galaxy_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_name_key UNIQUE (name);


--
-- Name: galaxy_cluster galaxy_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_pkey PRIMARY KEY (galaxy_cluster_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

