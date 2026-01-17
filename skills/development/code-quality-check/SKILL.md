---
name: code-quality-check
description: Analisa código para identificar problemas de qualidade, anti-patterns e sugestões de melhoria.
usage: "cat src/main.py | fabric -p code_quality_check -g=pt-br"
license: MIT
compatibility: opencode,claude
metadata:
  author: peixoto-ops
  version: 1.0.0
  category: development
  requires: fabric-cli
  pattern: code_quality_check
  output_format: markdown
---

# Code Quality Check Skill

Esta skill atua como um **Code Quality Assistant**, analisando código para identificar problemas de qualidade, anti-patterns, violações de boas práticas e sugestões de refatoração. Ela utiliza o pattern `code_quality_check` para fornecer feedback construtivo e acionável.

## 🛠️ Sobre as Ferramentas

### 1. O Motor: Fabric
* **Repo Oficial:** [danielmiessler/fabric](https://github.com/danielmiessler/fabric)

### 2. O Cérebro: Custom Patterns
* **Repo Fonte:** [peixoto-ops/costum_patterns](https://github.com/peixoto-ops/costum_patterns)
* **Pattern Alvo:** `code_quality_check`

## 🎯 Como Utilizar

Esta skill é ideal para revisões de código, code reviews, ou antes de commitar mudanças.

### Comandos Padrão

```bash
# Análise direta de arquivo
cat src/main.py | fabric -p code_quality_check -g=pt-br

# Análise com contexto (múltiplos arquivos)
cat src/**/*.py | fabric -p code_quality_check -g=pt-br

# Analisar diff de mudanças
git diff HEAD~1 | fabric -p code_quality_check -g=pt-br

# Salvar análise em arquivo
cat src/main.py | fabric -p code_quality_check -g=pt-br > code-review.md
```

## 📊 Formato de Saída

A skill fornece uma análise estruturada em 4 seções principais:

1. **Resumo Executivo:** 3-5 bullets com os problemas principais
2. **Problemas Identificados:** Por categoria (performance, segurança, manutenibilidade)
3. **Sugestões de Refatoração:** Exemplos de código "antes" e "depois"
4. **Priorização de Correções:** Alta, média e baixa prioridade

### Exemplo de Output

```markdown
## Resumo Executivo

- Uso de `var` em vez de `const`/`let` (obsoleto)
- Loop `for` tradicional pode ser substituído por métodos de array
- Falta validação de input
- Nome de função genérico sem contexto

## Problemas Identificados

### Manutenibilidade
- **Variável `var`:** `var` é obsoleto. Use `const` para valores imutáveis ou `let` para mutáveis.
- **Loop tradicional:** Métodos de array (`map`, `filter`) são mais declarativos e fáceis de ler.

### Segurança
- **Validação de input:** A função não verifica se o input é válido antes de processá-lo.

## Sugestões de Refatoração

### Antes:
```javascript
function processData(data){
  var result = [];
  for(var i=0; i<data.length; i++){
    result.push(data[i].value * 2);
  }
  return result;
}
```

### Depois:
```javascript
function processData(data) {
  if (!Array.isArray(data) || data.length === 0) {
    return [];
  }

  return data
    .filter(item => item?.value !== undefined)
    .map(item => item.value * 2);
}
```

## Priorização de Correções

1. **Alta prioridade:** Validação de input (segurança)
2. **Média prioridade:** Substituir `var` por `const`/`let` (modernização)
3. **Baixa prioridade:** Refatorar para métodos de array (estilo)
```

## 📚 Casos de Uso

### Cenário 1: Code Review Automático

Analise Pull Requests automaticamente para identificar problemas antes da revisão humana:

```bash
# Pegar diff do PR
git diff main feature/new-auth | fabric -p code_quality_check -g=pt-br
```

### Cenário 2: Refatoração de Código Legado

Identifique padrões problemáticos em código antigo e obtenha sugestões de melhoria:

```bash
# Analisar arquivo legado
cat src/legacy/service.js | fabric -p code_quality_check -g=pt-br
```

### Cenário 3: Learning On-Demand

Use a skill para aprender boas práticas durante o desenvolvimento:

```bash
# Analisar código que você escreveu para ver como melhorar
cat src/my-new-feature.ts | fabric -p code_quality_check -g=pt-br
```

## 📝 Categorias de Problemas Identificados

A skill analisa problemas nas seguintes categorias:

### Performance
- Loops ineficientes
- Consultas N+1
- Falta de caching
- Algoritmos ineficientes

### Manutenibilidade
- Código duplicado (DRY violations)
- Funções muito longas
- Nomes pouco claros
- Comentários desnecessários

### Segurança
- Validação de input ausente
- SQL Injection
- XSS vulnerabilities
- Hardcoded credentials

### Estilo e Convenções
- Naming conventions violadas
- Falta de consistência
- Código morto (dead code)
- Variáveis não utilizadas

## 🔧 Integração com Ferramentas

### Com Linters/Formaters

Use esta skill em conjunto com ferramentas automáticas:

```bash
# Passo 1: Rodar linter (eslint, flake8)
npm run lint

# Passo 2: Análise manual com pattern
cat src/main.ts | fabric -p code_quality_check -g=pt-br

# Passo 3: Combinar resultados
# Corrija problemas identificados pelo linter e pela skill
```

### Pre-commit Hooks

Adicione a skill ao seu hook pre-commit:

```bash
#!/bin/bash
# .git/hooks/pre-commit

# Arquivos modificados
FILES=$(git diff --cached --name-only --diff-filter=ACM '*.js' '*.ts' '*.py')

# Analisar cada arquivo
for FILE in $FILES; do
  cat "$FILE" | fabric -p code_quality_check -g=pt-br
done
```

## 🔍 Troubleshooting

* **Sem problemas identificados:** Isso pode indicar código bem escrito ou que o pattern não reconhece certos padrões.
* **False positives:** O pattern é baseado em heurísticas. Sempre reviwe manualmente as sugestões.
* **Conflitos com linter:** Priorize o linter para problemas de sintaxe, e esta skill para arquitetura e design.

## 📈 Práticas de Desenvolvimento

A skill promove as seguintes boas práticas:

- **SOLID Principles:** Single Responsibility, Open/Closed, etc.
- **Clean Code:** Nomes claros, funções pequenas, sem duplicação
- **DRY (Don't Repeat Yourself):** Elimine código duplicado
- **KISS (Keep It Simple):** Evite complexidade desnecessária
- **Performance First:** Considere impacto de performance nas mudanças