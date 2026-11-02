"""executa o mvc_finance.sql no DuckDB, carregando os CSVs de mvc_finance_data. Uso: python scripts/rodar_sql_duckdb.py"""
import duckdb, re, sys
repo = sys.argv[1] if len(sys.argv) > 1 else "."
sql = open(f'{repo}/mvc_finance.sql').read()
sql = re.sub(r'/\*.*?\*/', '', sql, flags=re.S)
con = duckdb.connect()
loads = {'TipoOperacao':'tipo_operacao','Categoria':'categoria','MetodoPagamento':'metodo_pagamento','Usuario':'usuario','Operacao':'operacao'}
stmts = [s.strip() for s in sql.split(';') if s.strip() and not all(l.strip().startswith('--') or not l.strip() for l in s.splitlines())]
for s in stmts:
    head = [l for l in s.splitlines() if l.strip().startswith('--')]
    title = head[-1] if head else ''
    body = s
    if body.lstrip('- \n').upper().startswith('CREATE TABLE') or 'CREATE TABLE' in body:
        con.execute(body)
        t = re.search(r'CREATE TABLE "(\w+)"', body).group(1)
        con.execute(f'INSERT INTO "{t}" SELECT * FROM read_csv(\'{repo}/mvc_finance_data/{loads[t]}.csv\', header=true)')
        print('loaded', t, con.execute(f'select count(*) from "{t}"').fetchone())
        continue
    if 'CREATE VIEW' in body:
        con.execute(body); print('view ok'); continue
    print('\n', title); print(con.execute(body).df().to_string())
