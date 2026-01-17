---
name: generate_abstract
description: Gera um Abstract Acadêmico estruturado (ABNT) a partir de PDFs, formatado para ingestão no Zotero.
usage: "pdftotext -layout artigo.pdf - | fabric -p create_abstract -g=pt-br"
license: MIT
compatibility: opencode,claude
metadata:
  author: peixoto-ops
  version: 1.0.0
  category: academic-drafting
  requires: fabric-cli, poppler-utils
  pattern: create_abstract
  output_format: text
  output_structure: single_paragraph_with_keywords
  word_limit: 250
---

# Generate Abstract Skill

Esta skill é a **Peça Central** de um pipeline de processamento acadêmico. Ela utiliza o pattern `create_abstract` para sintetizar textos longos (PDFs de artigos, teses, acórdãos) em um resumo denso e estruturado, pronto para metadados.

## 🛠️ Sobre as Ferramentas

### 1. O Motor: Fabric
* **Repo Oficial:** [danielmiessler/fabric](https://github.com/danielmiessler/fabric)

### 2. O Cérebro: Custom Patterns
* **Repo Fonte:** [peixoto-ops/costum_patterns](https://github.com/peixoto-ops/costum_patterns)
* **Pattern Alvo:** `create_abstract`

## 📋 Formato de Saída (ABNT Rigoroso)

A skill gera um **Parágrafo Único** (sem quebras de linha) seguido de **Palavras-chave**, contendo obrigatoriamente estes 5 elementos na ordem:
1.  **Contextualização/Problema:** (1-2 frases) Problema de pesquisa, lacuna de conhecimento ou importância do tema
2.  **Objetivos:** (1 frase) Objetivo(s) principal(is) do trabalho. O que a pesquisa se propôs a fazer ou analisar?
3.  **Metodologia:** (1-2 frases) Como a pesquisa foi conduzida. Métodos de coleta e análise? Amostra ou corpus?
4.  **Resultados:** (2-3 frases) Principais achados, descobertas e resultados. Seja direto e, se possível, quantitativo
5.  **Conclusão:** (1-2 frases) Principal conclusão do estudo. Implicações dos resultados?

### Exemplo de Output Completo
> "O presente estudo analisa a responsabilidade civil no desvio produtivo do consumidor (Contexto), objetivando delimitar os parâmetros para fixação de dano moral (Objetivo). Utilizou-se o método dedutivo através da revisão de jurisprudência do STJ nos últimos 5 anos (Metodologia). Os resultados indicam uma consolidação da tese de que o tempo perdido constitui bem jurídico indenizável autônomo (Resultados). Conclui-se pela necessidade de critérios objetivos para evitar o enriquecimento sem causa, sugerindo uma tabela referencial (Conclusão)."
>
> **Palavras-chave:** Desvio produtivo. Dano moral. Consumidor. Responsabilidade civil. STJ.

## 🚀 Como Utilizar

Esta skill brilha quando encadeada com ferramentas de extração de texto (`pdftotext`) e ingestão de dados (Zotero MCP).

### Pipeline Padrão (Linux/Mac)

```bash
# 1. Extrair e Gerar (Visualizar na tela)
pdftotext -layout artigo_bruto.pdf - | fabric -p create_abstract -g=pt-br

# 2. Salvar para Nota (Para importar no Zotero depois)
pdftotext -layout artigo_bruto.pdf - | fabric -p create_abstract -g=pt-br > resumo_zotero.txt
```

## 🔄 Integração Zotero (MCP)

O output desta skill foi desenhado para alimentar o **Zotero Model Context Protocol**.

**Instruções para o Agente:**
Ao receber o pedido "Adicione o resumo ao item X no Zotero", o agente deve:
1. Rodar esta skill para gerar o texto
2. Usar a ferramenta `zotero_create_note` do MCP
3. Passar o texto gerado (abstract + palavras-chave) como conteúdo da nota
4. As **palavras-chave** podem ser usadas como tags no Zotero

## 🔄 Workflow Acadêmico Completo

```bash
# Passo 1: Extrair texto do PDF
pdftotext -layout artigo.pdf - > texto.txt

# Passo 2: Gerar abstract
cat texto.txt | fabric -p create_abstract -g=pt-br > resumo_zotero.txt

# Passo 3: Ingerir no Zotero (via MCP zotero_create_note)
# O agente usa o conteúdo de resumo_zotero.txt para criar a nota
```

## 📚 Casos de Uso

### Cenário 1: Processamento de Artigos Acadêmicos
Transformar artigos de revistas jurídicas em abstracts estruturados para revisão bibliográfica.

### Cenário 2: Análise de Dissertações/Teses
Gerar resumos densos de teses e dissertações para triagem de conteúdo relevante.

### Cenário 3: Resumos para Revisão Bibliográfica
Criar uma coleção de abstracts padronizados para pesquisa sistemática.

## 📝 Notas Técnicas

* **Formato:** Abstract em parágrafo único (sem quebras de linha) + Palavras-chave
* **Limite de Palavras:** 250 palavras (padrão ABNT). Ajustável via input do usuário
* **Tom:** Formal, objetivo, impessoal (voz passiva ou 3ª pessoa)
* **Palavras-chave:** O pattern gera automaticamente 3-5 termos ao final do resumo
* **Base Exclusiva:** Síntese fiel do material fornecido, sem informações externas

## 🔧 Troubleshooting

* **Saída Vazia ou Lixo:** O PDF provavelmente é uma imagem (scan).
  * **Solução:** Rode um OCR antes. Ex: `ocrmypdf input.pdf output.pdf` e tente novamente.

* **Texto Cortado:** O pattern tem limite de tokens. Se o PDF for um livro inteiro, extraia apenas a introdução e conclusão antes de passar para o fabric.
  * Ex: `pdftotext -f 1 -l 10 livro.pdf - | fabric ...` (Extrai apenas páginas 1 a 10).