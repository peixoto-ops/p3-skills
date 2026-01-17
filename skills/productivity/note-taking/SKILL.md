---
name: note-taking
description: Cria fichamentos estruturados de decisões judiciais, textos jurídicos e materiais de pesquisa.
usage: "cat decisao.txt | fabric -p fichamento -g=pt-br"
license: MIT
compatibility: opencode,claude
metadata:
  author: peixoto-ops
  version: 1.0.0
  category: productivity
  requires: fabric-cli
  pattern: fichamento
  output_format: markdown
---

# Note Taking Skill

Esta skill atua como um **Fichamento Jurídico Assistido**, extraindo e organizando informações de decisões judiciais, textos jurídicos e materiais de pesquisa em fichamentos estruturados. Ela utiliza o pattern `fichamento` para identificar elementos-chave como tribunal, processo, partes, fundamentos e citações.

## 🛠️ Sobre as Ferramentas

### 1. O Motor: Fabric
* **Repo Oficial:** [danielmiessler/fabric](https://github.com/danielmiessler/fabric)

### 2. O Cérebro: Custom Patterns
* **Repo Fonte:** [peixoto-ops/costum_patterns](https://github.com/peixoto-ops/costum_patterns)
* **Pattern Alvo:** `fichamento`

## 🎯 Como Utilizar

Esta skill é ideal para criar fichamentos jurídicos estruturados que podem ser usados como notas em sistemas como Obsidian, Zotero ou para referência futura.

### Comandos Padrão

```bash
# Fichamento de decisão judicial
cat acordao.txt | fabric -p fichamento -g=pt-br

# Fichamento de doutrina
cat doutrina.pdf | pdftotext -layout - | fabric -p fichamento -g=pt-br

# Fichamento de petição
cat peticao.txt | fabric -p fichamento -g=pt-br

# Salvar fichamento para uso posterior
cat texto.txt | fabric -p fichamento -g=pt-br > fichamento.md
```

## 📊 Formato de Saída

A skill gera um fichamento estruturado em 7 seções principais:

1. **Identificação da Decisão/Texto**: Tribunal, processo, data, partes
2. **Contexto**: Informações de contexto sobre o caso
3. **Fundamentos Legais**: Leis, artigos citados, jurisprudência
4. **Decisão/Conclusão**: O que foi decidido e o porquê
5. **Votos Divergentes** (se houver): Votos em sentido contrário
6. **Críticas e Comentários**: Observações sobre a decisão
7. **Citações e Referências**: Bibliografia e referências citadas

### Exemplo de Output

```markdown
## Identificação da Decisão

- **Tribunal**: Tribunal de Justiça do Estado de São Paulo
- **Número do Processo**: 1000000-00.2023.8.26.0000
- **Data da Decisão**: 2023-03-15
- **Partes Envolvidas**: João da Silva (Autor) x Maria da Silva (Ré)
- **Juízes**: Desembargador José da Silva, Desembargadora Maria da Silva

## Contexto

A decisão trata de uma ação de divórcio litigioso. O casal, João e Maria, era casado há 10 anos e possuía um filho menor. O pedido de divórcio foi feito pelo autor alegando deterioração irreversível da relação conjugal.

## Fundamentos Legais

A decisão se baseia no Código Civil, no Código de Processo Civil e na Lei do Divórcio:
- Art. 1.571, § 1º do Código Civil (deterioração irreversível)
- Art. 311 do Código de Processo Civil (interesse do menor)
- Lei 6.515/77 (Lei do Divórcio)

## Decisão

O Tribunal decidiu, por maioria de votos, deferir o pedido de divórcio litigioso. Considerou que a relação conjugal havia se deteriorado de forma irreversível e que o melhor interesse do filho menor seria a preservação do vínculo com ambos os genitores.

## Votos Divergentes

O Desembargador Pedro da Silva votou em sentido contrário, argumentando que a separação não seria definitiva e que o casal poderia se reconciliar.

## Críticas e Comentários

A decisão foi criticada por alguns juristas que consideraram que a fundamentação sobre o interesse do menor foi insuficientemente motivada.

## Citações e Referências

"O divórcio é um direito fundamental, mas deve ser analisado com cautela, principalmente quando envolve menores."

- Código Civil, Art. 1.571, § 1º
- Código de Processo Civil, Art. 311
- Lei 6.515/77 (Lei do Divórcio)
```

## 📚 Casos de Uso

### Cenário 1: Fichamento de Acórdão

Criar fichamento estruturado de acórdão para uso em pareceres ou teses:

```bash
# Texto do acórdão
cat acordao_stj.txt | fabric -p fichamento -g=pt-br > fichamentos/acordao_1234.md
```

### Cenário 2: Fichamento de Doutrina

Criar fichamento de texto doutrinário para referência futura:

```bash
# Texto doutrinário
cat doutrina_desvio_produtivo.pdf | pdftotext -layout - | fabric -p fichamento -g=pt-br > fichamentos/doutrina.md
```

### Cenário 3: Fichamento de Petição

Criar fichamento de petição inicial ou contestação:

```bash
# Texto da petição
cat peticao_inicial.txt | fabric -p fichamento -g=pt-br > fichamentos/peticao.md
```

### Cenário 4: Fichamento de Multiple Textos

Criar fichamentos de múltiplos textos para revisão bibliográfica:

```bash
# Loop sobre múltiplos arquivos
for arquivo in textos/*.txt; do
  cat "$arquivo" | fabric -p fichamento -g=pt-br > "fichamentos/$(basename $arquivo .txt).md"
done
```

## 🔗 Integração com Sistemas

### Obsidian

Os fichamentos gerados podem ser usados diretamente no Obsidian:

```bash
# Copiar para vault do Obsidian
cp fichamentos/*.md ~/Documents/ObsidianVault/Fichamentos/

# Ou criar symlinks para manter sincronização
ln -s /path/to/p3-skills/fichamentos ~/Documents/ObsidianVault/Fichamentos
```

### Zotero

Importar fichamentos como notas no Zotero para referência em pesquisas:

```bash
# Zotero pode importar arquivos Markdown
# Use a ferramenta "Nova Nota" para cada fichamento
```

### Notion

Criar páginas no Notion com o conteúdo dos fichamentos:

```bash
# Exportar para Notion via API ou copiar manualmente
```

## 📝 Notas Técnicas

* **Estrutura:** Cada fichamento segue uma estrutura padronizada para fácil navegação
* **Citações:** Referências são extraídas e formatadas de forma consistente
* **Votos Divergentes:** Incluídos quando presentes na decisão
* **Contexto:** Informações de contexto são preservadas para melhor entendimento
* **Keywords:** Palavras-chave são implicitamente incluídas em cada seção

## 🔧 Troubleshooting

* **Informações Incompletas:** Se o texto não tiver todas as informações, o fichamento será parcial. Forneça textos mais completos.
* **Votos Divergentes Ausentes:** Se não houver votos divergentes, a seção será omitida.
* **Citações Mal Formatadas:** Verifique se as citações extraídas correspondem ao texto original.
* **Caracteres Especiais:** Alguns caracteres podem não ser interpretados corretamente. Revise manualmente.

## 🔄 Workflow Sugerido

### 1. Coleta de Materiais
```bash
# Baixar acórdãos do STJNet, TJSP, etc
# Extrair texto de PDFs
# Organizar por tema
```

### 2. Fichamento em Lote
```bash
# Processar múltiplos textos
for arquivo in materiais/*.txt; do
  cat "$arquivo" | fabric -p fichamento -g=pt-br > fichamentos/$(basename $arquivo .txt).md
done
```

### 3. Organização por Tema
```bash
# Criar pastas por tema
mkdir -p fichamentos/{desvio_produtivo,divorcio,consumidor,contratos}

# Mover fichamentos para temas apropriados
mv fichamentos/acordao_*.md fichamentos/divorcio/
```

### 4. Revisão e Atualização
```bash
# Revisar fichamentos periodicamente
# Adicionar novos insights ou conexões
# Atualizar se houver novas decisões relacionadas
```

## 📈 Métricas de Qualidade

Os fichamentos gerados atendem aos seguintes critérios:

| Critério | Padrão | Como Garantir |
|-----------|----------|---------------|
| **Completude** | Todas seções preenchidas | Revisar saída |
| **Precisão** | Citações corretas e completas | Verificar contra original |
| **Clareza** | Linguagem objetiva e clara | Revisar estilo |
| **Estrutura** | Organização lógica com headings | Verificar formatação |
| **Contexto** | Informações de contexto preservadas | Fornecer textos completos |