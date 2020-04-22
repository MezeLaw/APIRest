-- Table: public.rol

-- DROP TABLE public.rol;

CREATE TABLE public.rol
(
    id bigint NOT NULL DEFAULT nextval('rol_id_seq'::regclass),
    name character varying(60) COLLATE pg_catalog."default",
    CONSTRAINT rol_pkey PRIMARY KEY (id),
    CONSTRAINT uk_3q333a31vqas37tvjmwii0jiq UNIQUE (name)

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.rol
    OWNER to postgres;
    
    
    
    
    -- Table: public.usuario

-- DROP TABLE public.usuario;

CREATE TABLE public.usuario
(
    id bigint NOT NULL DEFAULT nextval('usuario_id_seq'::regclass),
    email character varying(50) COLLATE pg_catalog."default",
    name character varying(50) COLLATE pg_catalog."default",
    password character varying(100) COLLATE pg_catalog."default",
    username character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT usuario_pkey PRIMARY KEY (id),
    CONSTRAINT uk5171l57faosmj8myawaucatdw UNIQUE (email)
,
    CONSTRAINT uk863n1y3x0jalatoir4325ehal UNIQUE (username)

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.usuario
    OWNER to postgres;
    
    
    
    
    -- Table: public.usuario_rol

-- DROP TABLE public.usuario_rol;

CREATE TABLE public.usuario_rol
(
    usuario_id bigint NOT NULL,
    rol_id bigint NOT NULL,
    CONSTRAINT usuario_rol_pkey PRIMARY KEY (usuario_id, rol_id),
    CONSTRAINT fk610kvhkwcqk2pxeewur4l7bd1 FOREIGN KEY (rol_id)
        REFERENCES public.rol (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fkbyfgloj439r9wr9smrms9u33r FOREIGN KEY (usuario_id)
        REFERENCES public.usuario (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.usuario_rol
    OWNER to postgres;