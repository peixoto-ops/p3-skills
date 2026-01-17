---
name: classify_citations
description: Extrai e normaliza citações jurisprudenciais de textos não estruturados em JSON. Ideal para triagem de acórdãos, súmulas e precedentes.
usage: "cat texto_bruto.txt | fabric -p extract_jurisprudence_citation -g=pt-br"
license: MIT
compatibility: opencode,claude
metadata:
  author: peixoto-ops
  version: 1.0.0
  category: document-analysis
  requires: fabric-cli, jq
  pattern: extract_jurisprudence_citation
  output_format: json
---

# Classify Citations Skill

Esta skill atua como um **Parser Jurídico**, transformando texto desestruturado (copy-paste de PDFs, sites, Diários Oficiais) em dados estruturados (JSON). Ela utiliza o pattern `extract_jurisprudence_citation` para identificar, limpar e classificar referências a julgamentos.

## 🛠️ Sobre as Ferramentas

### 1. O Motor: Fabric
Executa a extração usando IA.
* **Repo Oficial:** [danielmiessler/fabric](https://github.com/danielmiessler/fabric)

### 2. O Cérebro: Custom Patterns
A lógica de extração reside no repositório de patterns do usuário.
* **Repo Fonte:** [peixoto-ops/costum_patterns](https://github.com/peixoto-ops/costum_patterns)
* **Pattern Alvo:** `extract_jurisprudence_citation`

## 📊 Saída Estruturada (JSON Schema)

A skill retorna uma **Lista de Objetos JSON**. Este formato é ideal para ingestão automática em bancos de dados (Obsidian/Zotero) ou filtragem via scripts.

**Campos Principais:**
```json
[
  {
    "tribunal": "STJ",
    "orgao_julgador": "3ª Turma",
    "tipo_precedente": "acordao | sumula | tema_rg | informativo",
    "classe_processual": "REsp",
    "numero_processo": "1.850.512",
    "relator": "Min. Nancy Andrighi",
    "data_julgamento": "2024-02-20",
    "ementa_tese": "A tese jurídica extraída...",
    "fundamento_utilizado_no_texto": "Como o texto original usou esse precedente",
    "nivel_precisao": "alta | media"
  }
]
```

## 🚀 Como Utilizar

Use esta skill na **Fase de Triagem (1.5)**, logo após a coleta de documentos brutos e antes da análise profunda.

### Formatos de Entrada Aceitos

A skill aceita textos em formato **.txt** ou **.md**:

```bash
# Entrada via arquivo .txt
cat acordao_bruto.txt | fabric -p extract_jurisprudence_citation -g=pt-br

# Entrada via arquivo .md (Markdown)
cat peticao_inicial.md | fabric -p extract_jurisprudence_citation -g=pt-br
```

### Comandos Básicos

```bash
# 1. Extração direta para tela (Debug)
cat texto.txt | fabric -p extract_jurisprudence_citation -g=pt-br

# 2. Salvar em JSON limpo (Produção)
cat texto.md | fabric -p extract_jurisprudence_citation -g=pt-br > extractions.json
```

### ⚡ Power User: Filtragem com `jq`

Como a saída é JSON puro, você pode usar `jq` para criar pipelines de automação instantâneos.

```bash
# Listar apenas os números dos processos encontrados
cat texto.txt | fabric -p extract_jurisprudence_citation -g=pt-br | jq -r '.[].numero_processo'

# Filtrar apenas Súmulas
cat texto.md | fabric -p extract_jurisprudence_citation -g=pt-br | jq '.[] | select(.tipo_precedente == "sumula")'

# Gerar CSV rápido (Tribunal, Processo, Relator)
cat texto.txt | fabric -p extract_jurisprudence_citation -g=pt-br | jq -r '.[] | [.tribunal, .numero_processo, .relator] | @csv'
```

## 📚 Casos de Uso

### Cenário 1: Triagem de Diário Oficial

Você recebe um recorte do DJE com 50 publicações.

* **Ação:** Passar o texto (`.txt` ou `.md`) pela skill.
* **Resultado:** Um JSON identificando quais publicações são sentenças de mérito vs. despachos de mero expediente (baseado na citação de jurisprudência ou falta dela).

### Cenário 2: Engenharia Reversa de Peças

Você tem a petição inicial da parte contrária (PDF -> Texto em `.md` ou `.txt`).

* **Ação:** Extrair todas as jurisprudências que eles citaram.
* **Resultado:** Uma lista pronta para verificar se os precedentes citados foram superados (*overruling*) ou não se aplicam (*distinguishing*).

### Cenário 3: Integração com Obsidian/Zotero

O JSON gerado pode ser lido por scripts (como o plugin *JSON Import*) para criar notas automáticas no Obsidian para cada precedente citado.

## 🔄 Workflow Integrado

Esta skill é ideal para processar o **output bruto** de uma etapa de pesquisa planejada pelo `deep_research_planner`.

```bash
# 1. Planejar pesquisa (deep_research_planner)
echo "Tema jurídico" | fabric -p deep_research_metaprompt -g=pt-br -o research/01_plano.md

# 2. Coletar documentos brutos e converter para .txt ou .md

# 3. Classificar citações (classify_citations)
cat research/documentos.md | fabric -p extract_jurisprudence_citation -g=pt-br -o research/02_citations.json

# 4. Filtrar resultados com jq
jq '.[] | select(.nivel_precisao == "alta")' research/02_citations.json
```

## 📝 Notas Técnicas

* **Robustez:** O pattern foi treinado para ignorar doutrina e focar apenas em decisões de tribunais.
* **Precisão:** O campo `nivel_precisao` indica se o modelo achou o número exato do processo ("alta") ou apenas uma menção vaga ("media"). Use isso para filtrar alucinações.
* **Formatos:** Aceita entrada em `.txt` ou `.md` (Markdown) para máxima flexibilidade.
* **Saída:** Sempre retorna JSON estruturado, independente do formato de entrada.