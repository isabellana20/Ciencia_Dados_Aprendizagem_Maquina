"""Gera MVC_Finance_Analysis.pdf no formato do Pizza_Analysis.pdf:
capa, uma consulta por página (título, SQL colorido e resultado em grade) e página final.
As consultas vêm do mvc_finance.sql e são executadas no DuckDB sobre os CSVs de mvc_finance_data/."""
import html
import re
import sys
import duckdb
from playwright.sync_api import sync_playwright

repo = sys.argv[1] if len(sys.argv) > 1 else '.'
sql = open(f'{repo}/mvc_finance.sql', encoding='utf-8').read()
sql = re.sub(r'/\*.*?\*/', '', sql, flags=re.S)
con = duckdb.connect()
arquivos = {'TipoOperacao': 'tipo_operacao', 'Categoria': 'categoria', 'MetodoPagamento': 'metodo_pagamento',
            'Usuario': 'usuario', 'Operacao': 'operacao'}

KW = {'SELECT', 'FROM', 'WHERE', 'JOIN', 'ON', 'GROUP', 'BY', 'ORDER', 'HAVING', 'AS', 'AND', 'OR', 'CASE', 'WHEN',
      'THEN', 'ELSE', 'END', 'WITH', 'CREATE', 'VIEW', 'LIMIT', 'DESC', 'ASC', 'IS', 'NULL', 'NOT', 'DISTINCT',
      'OVER', 'WITHIN', 'DATE', 'CAST', 'IN'}
FN = {'SUM', 'COUNT', 'AVG', 'ROUND', 'MIN', 'MAX', 'PERCENTILE_CONT', 'DATE_TRUNC', 'NULLIF'}
TOKEN = re.compile(r"('[^']*')|(\"[^\"]*\")|(\b\d+(?:\.\d+)?\b)|(\b[A-Za-z_]+\b)|(\s+)|(.)")


def colorir(codigo):
    out = []
    for s, ident, num, word, ws, other in TOKEN.findall(codigo):
        if s:
            out.append(f'<span class="str">{html.escape(s)}</span>')
        elif ident:
            out.append(html.escape(ident))
        elif num:
            out.append(f'<span class="num">{num}</span>')
        elif word:
            u = word.upper()
            cls = 'kw' if u in KW else ('fn' if u in FN else None)
            out.append(f'<span class="{cls}">{html.escape(word)}</span>' if cls else html.escape(word))
        else:
            out.append(html.escape(ws or other))
    return ''.join(out)


def fmt(v):
    if isinstance(v, float):
        return f'{v:,.2f}'.replace(',', 'X').replace('.', ',').replace('X', '.')
    if isinstance(v, int):
        return f'{v:,}'.replace(',', '.')
    return html.escape(str(v)[:10] if hasattr(v, 'year') else str(v))


DECOR = '''<div class="faixa"></div><div class="moldura"></div>
<div class="moedas"><span></span><span></span><span></span></div>
<div class="barras"><i style="height:38%"></i><i style="height:58%"></i><i style="height:46%"></i><i style="height:74%"></i><i style="height:92%"></i></div>'''

paginas = [f'''<section class="pagina capa">{DECOR}
<div class="capa-texto"><h1>MVC Finance<br>Análise<br>SQL</h1>
<p class="capa-sub">Validações, base limpa e KPIs do CRISP-DM</p>
<p class="capa-info">Ciência de Dados e Aprendizagem de Máquina (A1) · UDF<br>Profa. Kadidja Valéria</p>
<p class="capa-info">Isabella Ana Dutra de Sousa (P1)<br>Kauane Braga dos Santos Silva de Sousa (P2)</p>
<p class="capa-aviso">Dados simulados com a estrutura e as regras do MVC Finance:<br>400 usuários e 60.527 operações (jan.–dez. 2026).</p></div>
</section>''']

for stmt in [s.strip() for s in sql.split(';') if s.strip()]:
    linhas = stmt.splitlines()
    if 'CREATE TABLE' in stmt:
        con.execute(stmt)
        t = re.search(r'CREATE TABLE "(\w+)"', stmt).group(1)
        con.execute(f'INSERT INTO "{t}" SELECT * FROM read_csv(\'{repo}/mvc_finance_data/{arquivos[t]}.csv\', header=true)')
        continue
    comentarios = [l.strip()[2:].strip() for l in linhas if l.strip().startswith('--') and not l.strip().startswith('-- =')]
    comentarios = [c for c in comentarios if c and not c.isupper()]
    codigo = '\n'.join(l for l in linhas if not l.strip().startswith('--')).strip()
    if 'CREATE VIEW' in stmt:
        con.execute(stmt)
        titulo, nota = 'View operacao_limpa -- base limpa usada pelos KPIs (Fase 3)', ' '.join(c for c in comentarios if c.startswith('-'))
        resultado = '<p class="obs">A view não retorna uma tabela: ela é a base que os KPIs consultam a seguir.</p>'
    else:
        ini = next((i for i, c in enumerate(comentarios) if re.match(r'^(V\d|KPI \d|[AB]\.)', c)), 0)
        titulo, nota = comentarios[ini], ' '.join(comentarios[ini + 1:])
        df = con.execute(codigo).df()
        cab = '<th></th>' + ''.join(f'<th>{html.escape(str(c))}</th>' for c in df.columns)
        rows = ''.join(f'<tr><td class="n">{i}</td>' + ''.join(f'<td>{fmt(v)}</td>' for v in r) + '</tr>'
                       for i, r in enumerate(df.itertuples(index=False), 1))
        largo = ' class="largo"' if len(df.columns) > 5 else ''
        resultado = f'<table{largo}><tr>{cab}</tr>{rows}</table>'
        m = re.match(r'^(V\d|KPI \d|[AB])\.?\s*(.*)$', titulo)
        titulo = f'{m.group(1)} -- {m.group(2)}'
    nota_html = f'<p class="nota">-- {html.escape(nota)}</p>' if nota else ''
    pequeno = ' pequeno' if codigo.count('\n') > 18 else ''
    paginas.append(f'''<section class="pagina">{DECOR}<div class="conteudo">
<p class="titulo">-- {html.escape(titulo)}</p>{nota_html}
<pre class="sql{pequeno}">{colorir(codigo)}</pre><div class="res">{resultado}</div></div></section>''')

paginas.append(f'<section class="pagina capa">{DECOR}<div class="capa-texto fim"><h1>Obrigado!</h1>'
               '<p class="capa-sub">MVC Finance · Análise SQL</p></div></section>')

css = '''
@page { size: A4; margin: 0; }
* { box-sizing: border-box; }
body { margin: 0; font-family: 'DejaVu Sans', Arial, sans-serif; }
.pagina { position: relative; width: 210mm; height: 297mm; overflow: hidden; page-break-after: always;
          background: linear-gradient(#eaf2fb 0 22mm, #f4f8fc 22mm 100%); }
.faixa { position: absolute; top: 0; left: 0; right: 0; height: 22mm;
         background: repeating-linear-gradient(90deg, #14365d 0 18mm, #2a78d6 18mm 36mm, #1baf7a 36mm 40mm); }
.moldura { position: absolute; inset: 8mm; border: 1.6px solid #2a78d6; border-radius: 2mm; }
.moedas span { position: absolute; width: 26mm; height: 26mm; border-radius: 50%; background: #f2b632;
               border: 3mm solid #e3a21a; box-shadow: inset 0 0 0 1.4mm #f7cd6a; }
.moedas span:nth-child(1) { right: 14mm; bottom: 58mm; }
.moedas span:nth-child(2) { right: 34mm; bottom: 44mm; width: 20mm; height: 20mm; border-width: 2.4mm; }
.moedas span:nth-child(3) { left: 14mm; bottom: 70mm; width: 16mm; height: 16mm; border-width: 2mm; }
.barras { position: absolute; right: 16mm; bottom: 14mm; width: 58mm; height: 34mm; display: flex; gap: 3mm; align-items: flex-end; }
.barras i { flex: 1; background: #2a78d6; border-radius: 1.5mm 1.5mm 0 0; opacity: .85; }
.barras i:nth-child(5) { background: #1baf7a; }
.conteudo { position: absolute; top: 36mm; left: 20mm; right: 20mm; }
.titulo { font-family: 'DejaVu Sans Mono', monospace; color: #0f7a3d; font-weight: bold; font-size: 14pt; margin: 0 0 3mm; line-height: 1.35; }
.nota { font-family: 'DejaVu Sans Mono', monospace; color: #0f7a3d; font-size: 9.5pt; margin: 0 0 4mm; }
pre.sql { font-family: 'DejaVu Sans Mono', monospace; font-weight: bold; font-size: 10.2pt; line-height: 1.45;
          color: #111; margin: 0 0 6mm; white-space: pre-wrap; }
pre.sql.pequeno { font-size: 8.6pt; }
.kw { color: #2b2bd6; } .fn { color: #d6249f; } .str { color: #c0392b; } .num { color: #0f7a3d; }
.res { margin-left: 18mm; }
table { border-collapse: collapse; background: white; font-size: 9.5pt; font-family: Arial, sans-serif; }
th { background: #f0f0f0; font-weight: normal; text-align: left; border: 1px solid #c9c9c9; padding: 2px 8px; }
td { border: 1px solid #dcdcdc; padding: 2px 8px; }
td.n { background: #f0f0f0; color: #444; text-align: center; }
tr:nth-child(2) td:not(.n) { outline: 1px dotted #555; outline-offset: -2px; background: #e8f0fb; }
table.largo { font-size: 7.4pt; } table.largo th, table.largo td { padding: 2px 4px; }
.res:has(table.largo) { margin-left: 0; }
.obs { color: #52514e; font-size: 10pt; }
.capa-texto { position: absolute; top: 92mm; left: 30mm; right: 30mm; }
.capa-texto h1 { color: #14365d; font-size: 40pt; line-height: 1.12; margin: 0 0 8mm; }
.capa-sub { color: #2a78d6; font-size: 15pt; font-weight: bold; margin: 0 0 10mm; }
.capa-info { color: #333; font-size: 11pt; line-height: 1.5; margin: 0 0 5mm; }
.capa-aviso { display: inline-block; background: white; border: 1px solid #c9d9ee; padding: 3mm 4mm; color: #444; font-size: 9.5pt; line-height: 1.45; }
.fim { top: 120mm; }
'''
with open('/tmp/mvc_consultas.html', 'w', encoding='utf-8') as f:
    f.write(f'<!DOCTYPE html><html lang="pt-BR"><head><meta charset="utf-8"><style>{css}</style></head><body>{"".join(paginas)}</body></html>')
with sync_playwright() as p:
    b = p.chromium.launch(); pg = b.new_page()
    pg.goto('file:///tmp/mvc_consultas.html')
    pg.pdf(path=f'{repo}/MVC_Finance_Analysis.pdf', format='A4', print_background=True, margin={'top': '0', 'bottom': '0', 'left': '0', 'right': '0'})
    b.close()
print(f'ok: {len(paginas)} páginas')
