CREATE TABLE IF NOT EXISTS public.earthquakes
(
    id serial,
	date_time date,
	depth numeric,
	magnitude numeric,
	mag_type character varying(100),
	nb_station character varying(100),
	source character varying(100),
	latitude numeric,
	longitude numeric
)
ALTER TABLE IF EXISTS public.earthquakes OWNER to postgres;

select * from earthquakes

select 
	*,
	ST_Buffer(ST_SetSRID(ST_MakePoint(longitude, latitude),4326), .25, 'quad_segs=2') as shape
from earthquakes