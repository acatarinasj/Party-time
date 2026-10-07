-- Convidados: marca de convite recusado.
alter table public.pt_guests add column declined boolean not null default false;
