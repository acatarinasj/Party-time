-- Marca de "pronto" em cada item da tab Comida.
alter table public.pt_food add column done boolean not null default false;
