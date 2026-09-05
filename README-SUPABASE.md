# RPJ Gestão de O.S. — versão online (Supabase + Vercel)

Esta versão mantém a interface da V5 e troca o armazenamento principal do navegador por um banco PostgreSQL do Supabase. O navegador mantém apenas um cache local.

## 1. Criar o banco
1. Crie um projeto no Supabase.
2. Abra **SQL Editor**.
3. Execute o arquivo `supabase-schema.sql`.
4. Em **Authentication > Providers > Email**, deixe Email habilitado. Para o primeiro teste, desative a exigência de confirmação de e-mail.
5. Em **Authentication > Users**, crie o primeiro usuário:
   - E-mail: `rpj@rpj.local`
   - Senha: `1234`

> O sistema mostra o login como `RPJ`. Internamente, ele converte `RPJ` para `rpj@rpj.local`.

## 2. Colocar as chaves no site
Abra `index.html` e substitua:
- `COLOQUE_AQUI_A_URL_DO_SUPABASE` pela **Project URL** do Supabase.
- `COLOQUE_AQUI_A_CHAVE_ANON` pela chave pública **anon** (Publishable/anon key).

Nunca coloque a **service_role key** no HTML.

## 3. Publicar na Vercel
Suba a pasta `RPJ-Gestao-OS` para um repositório GitHub e importe o projeto na Vercel. Como é um site estático, não precisa de build command.

## 4. Resultado
Depois de configurado:
- O.S., clientes e aparelhos ficam no banco online.
- O mesmo cadastro pode ser acessado de outros computadores/celulares autenticados.
- A impressão A4 e 80 mm continua sendo feita pelo navegador.
- O backup JSON continua disponível.

## Observação sobre usuários
A autenticação principal é feita pelo Supabase Auth. O cadastro de usuários do menu do sistema também tenta criar a conta no Auth. Para uma versão comercial multiempresa, o próximo passo recomendado é separar os dados por empresa (tenant) e aplicar RLS por empresa, além de administrar exclusões de usuários por uma função de servidor.
