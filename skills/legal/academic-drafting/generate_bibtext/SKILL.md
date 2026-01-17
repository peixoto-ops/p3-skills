---
name: generate_bibtext
description: Extrai metadados de PDFs e gera entradas BibTeX validadas para importação no Zotero.
usage: "pdftotext -l 3 artigo.pdf - | fabric -p create_bibtext -g=pt-br"
license: MIT
compatibility: opencode,claude
metadata:
  author: peixoto-ops
  version: 1.0.0
  category: academic-drafting
  requires: fabric-cli, poppler-utils
  pattern: create_bibtext
  output_format: bibtex
---

# Generate BibTeX Skill

Esta skill atua como um **Conversor de Metadados**, transformando textos não estruturados (decisões judiciais, ementas, artigos acadêmicos) em entradas BibTeX (`.bib`) perfeitamente formatadas para importação imediata no Zotero.

## 🛠️ Sobre as Ferramentas

### 1. O Motor: Fabric
* **Repo Oficial:** [danielmiessler/fabric](https://github.com/danielmiessler/fabric)

### 2. O Cérebro: Custom Patterns
* **Repo Fonte:** [peixoto-ops/costum_patterns](https://github.com/peixoto-ops/costum_patterns)
* **Pattern Alvo:** `create_bibtext`

## 📊 Estratégia de Extração

O pattern `create_bibtext` analisa o texto de entrada e identifica se o documento é:

### Fonte Jurídica (Jurisprudência, Lei, Parecer)

**Metadados Extraídos:**
- `Author`: Nome do Relator (ex: "Moraes, Alexandre de")
- `Title`: Tipo de Recurso + Número (ex: "Recurso Extraordinário 123456")
- `Institution` / `Organization`: Tribunal (STF, STJ, TJSP)
- `Date`: Convertido para campos `year` e `month`
- `Note`: Detalhes como "Tribunal Pleno", "Julgado em...", "DJe"

**Tipo de Entrada:** `@misc` (preferido para Zotero genérico)

### Fonte Acadêmica (Artigo, Livro, Tese)

**Metadados Extraídos:**
- DOI, Volume, Issue, ISSN/ISBN, Páginas
- Autor, Título, Ano

**Tipo de Entrada:**
- `@article` para artigos
- `@book` para livros
- `@incollection` para capítulos

## 🚀 Como Utilizar

### Estratégia de Entrada

Para economizar tokens e melhorar a precisão, **não passe o PDF inteiro**. Geralmente as primeiras 3 páginas contêm os metadados necessários (título, autor, DOI).

```bash
# Extração eficiente (primeiras 3 páginas)
pdftotext -l 3 artigo.pdf - | fabric -p create_bibtext -g=pt-br
```

### Comandos Padrão

```bash
# 1. Extração Direta (Visualizar na tela)
pdftotext -l 3 artigo.pdf - | fabric -p create_bibtext -g=pt-br

# 2. Salvar Arquivo BibTeX (Para importar no Zotero)
pdftotext -l 3 artigo.pdf - | fabric -p create_bibtext -g=pt-br > entrada.bib
```

## 📋 Formato de Saída (BibTeX)

A saída é um bloco de código BibTeX pronto para importação, com as seguintes características:

- **Proteção de maiúsculas:** Siglas entre chaves `{STF}`, `{ABNT}`
- **Citation Key:** Chave única e lógica (ex: `sobrenome_tribunal_ano`)
- **Campos obrigatórios:** Se crítico e ausente, marcado como `MISSING`
- **Saída limpa:** Apenas o bloco de código, sem introduções ou explicações

### Exemplo de Output: Jurisprudência

**Input:**
> Acórdão do Superior Tribunal de Justiça. Recurso Especial nº 1.815.795/RJ. Relator: Ministro Paulo de Tarso Sanseverino. Julgado em 15/10/2020. Tema: Responsabilidade Civil e LGPD.

**Output:**
```bibtex
@misc{sanseverino_stj_2020,
  author       = {Sanseverino, Paulo de Tarso},
  title        = {{Recurso Especial 1.815.795/RJ}: Responsabilidade Civil e {LGPD}},
  howpublished = {Superior Tribunal de Justiça (STJ)},
  year         = {2020},
  month        = {oct},
  note         = {Julgado em 15/10/2020},
}
```

### Exemplo de Output: Artigo Acadêmico

**Input:**
> Silva, João. O Desvio Produtivo do Consumidor. Revista dos Tribunais, vol. 1024, pp. 123-145, 2024. DOI: 10.1234/rt.2024.01.

**Output:**
```bibtex
@article{silva_2024,
  author  = {Silva, João},
  title   = {O Desvio Produtivo do Consumidor},
  journal = {Revista dos Tribunais},
  volume  = {1024},
  pages   = {123--145},
  year    = {2024},
  doi     = {10.1234/rt.2024.01},
}
```

## 🔄 Integração Zotero

O MCP Zotero atual não possui `create_item`. O fluxo recomendado é:

```bash
# Passo 1: Gerar BibTeX
pdftotext -l 3 artigo.pdf - | fabric -p create_bibtext -g=pt-br > entrada.bib

# Passo 2: Importar manualmente no Zotero
# Arquivo → Importar → Selecionar entrada.bib

# Passo 3: Usar zotero_create_note (skill generate_abstract)
# para anexar o resumo ao item importado
```

## 🔄 Workflow Acadêmico Completo

```bash
# Passo 1: Gerar abstract (skill generate_abstract)
pdftotext -layout artigo.pdf - | fabric -p create_abstract -g=pt-br > resumo_zotero.txt

# Passo 2: Gerar BibTeX (skill generate_bibtext)
pdftotext -l 3 artigo.pdf - | fabric -p create_bibtext -g=pt-br > entrada.bib

# Passo 3: Importar BibTeX no Zotero (manual)
# Zotero → Arquivo → Importar → entrada.bib

# Passo 4: Anexar resumo via MCP zotero_create_note
# Usar skill generate_abstract → zotero_create_note
```

## 📚 Casos de Uso

### Cenário 1: Processamento de Acórdãos
Converter acórdãos do STJ/STF em entradas BibTeX para organização em coleções temáticas.

### Cenário 2: Catalogação de Artigos Acadêmicos
Extrair metadados de artigos jurídicos para importação em massa no Zotero.

### Cenário 3: Revisão Bibliográfica
Gerar entradas BibTeX padronizadas para referências em trabalhos acadêmicos.

## 📝 Notas Técnicas

* **Entrada Eficiente:** Use apenas as primeiras 3 páginas (`-l 3`) para economizar tokens
* **Proteção de Siglas:** O pattern protege automaticamente letras maiúsculas com chaves `{STF}`, `{ABNT}`
* **Citation Key:** Gerada automaticamente no formato `sobrenome_tribunal_ano` ou `sobrenome_ano`
* **Saída Limpa:** Apenas bloco de código BibTeX, sem introduções ou explicações
* **Campos MISSING:** Informações críticas ausentes são marcadas com `MISSING` para correção manual

## 🔧 Troubleshooting

* **Informações Insuficientes:** O pattern retorna "Informações insuficientes para gerar BibTeX."
  * **Solução:** Verifique se as primeiras páginas contêm metadados básicos (autor, título, ano)

* **PDF Scanado:** O texto extraído não contém informações estruturadas
  * **Solução:** Rode OCR antes: `ocrmypdf input.pdf output.pdf`

* **Tipo de Documento não Identificado:** O pattern não consegue classificar como jurídico ou acadêmico
  * **Solução:** Forneça mais contexto no input ou edite manualmente a entrada BibTeX gerada

* **Citation Key Duplicada:** Ao importar múltiplas entradas
  * **Solução:** O pattern gera chaves únicas, mas verifique duplicatas antes de importar