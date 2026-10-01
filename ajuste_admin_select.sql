-- Opcional/recomendado: confira se a política pública de leitura existe.
-- NÃO execute CREATE se ela já existir, ou o Supabase acusará política duplicada.

-- A vitrine pública precisa conseguir ler somente produtos ativos:
-- CREATE POLICY "Produtos visiveis publicamente"
-- ON public.produtos FOR SELECT TO anon, authenticated
-- USING (ativo = true);

-- Observação:
-- O painel admin precisa visualizar também produtos com ativo=false.
-- Crie esta política adicional, restrita ao UID do administrador:

DROP POLICY IF EXISTS "Admin pode visualizar todos os produtos" ON public.produtos;

CREATE POLICY "Admin pode visualizar todos os produtos"
ON public.produtos
FOR SELECT
TO authenticated
USING (
  auth.uid() = '5679fdda-515c-4e08-ad2e-61285478fe78'::uuid
);
