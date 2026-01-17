---
name: documentation-generator
description: Gera documentação técnica (API docs, README, guias) baseada em código e comentários.
usage: "cat src/api.py | fabric -p documentation_generator -g=pt-br"
license: MIT
compatibility: opencode,claude
metadata:
  author: peixoto-ops
  version: 1.0.0
  category: development
  requires: fabric-cli
  pattern: documentation_generator
  output_format: markdown
---

# Documentation Generator Skill

Esta skill atua como um **Documentation Generator Assistant**, criando documentação técnica clara, completa e mantível para código, APIs ou features desenvolvidas. Ela utiliza o pattern `documentation_generator` para transformar código e comentários em documentação profissional.

## 🛠️ Sobre as Ferramentas

### 1. O Motor: Fabric
* **Repo Oficial:** [danielmiessler/fabric](https://github.com/danielmiessler/fabric)

### 2. O Cérebro: Custom Patterns
* **Repo Fonte:** [peixoto-ops/costum_patterns](https://github.com/peixoto-ops/costum_patterns)
* **Pattern Alvo:** `documentation_generator`

## 🎯 Como Utilizar

Esta skill é ideal para gerar documentação técnica para código, APIs, bibliotecas ou features que você desenvolveu.

### Comandos Padrão

```bash
# Gerar documentação de arquivo específico
cat src/main.py | fabric -p documentation_generator -g=pt-br

# Gerar documentação de múltiplos arquivos
cat src/**/*.py | fabric -p documentation_generator -g=pt-br

# Gerar documentação baseada em comentários do código
cat src/auth/service.ts | fabric -p documentation_generator -g=pt-br

# Salvar documentação em arquivo
cat src/api.py | fabric -p documentation_generator -g=pt-br > API_DOCS.md
```

## 📊 Formato de Saída

A skill gera documentação em 7 seções principais:

1. **Título e Descrição Breve:** O que faz, para quem serve
2. **Seção de Instalação/Configuração:** Como instalar e configurar
3. **Guia de Uso Básico:** Exemplos de código simples
4. **Referência de API/Documentação Detalhada:** Parâmetros, retorno, exceções
5. **Exemplos Avançados e Casos de Uso:** Cenários mais complexos
6. **Notas Importantes e Considerações:** Edge cases, boas práticas
7. **Especificação OpenAPI/Swagger** (se apropriado)

### Exemplo de Output

```markdown
# Calculadora de Impostos

Esta biblioteca fornece uma função simples para cálculo de impostos sobre renda, com suporte a alíquotas personalizadas e validação de input.

## Instalação

```python
# Clonar repositório
git clone https://github.com/example/tax-calculator.git
cd tax-calculator

# Instalar dependências
pip install -r requirements.txt
```

## Uso Básico

### Exemplo 1: Cálculo Padrão

```python
from tax_calculator import calculate_tax

# Calcular imposto com alíquota padrão (15%)
tax = calculate_tax(income=50000)
print(f"Taxa de imposto: {tax:.2f}")
# Saída: Taxa de imposto: 7500.00
```

## Referência da API

### `calculate_tax(income, tax_rate=0.15)`

Calcula o valor do imposto baseado na renda informada.

**Parâmetros:**

| Parâmetro | Tipo | Descrição | Obrigatório | Valor Padrão |
|-----------|-------|-------------|--------------|---------------|
| `income` | float | Renda bruta sobre a qual calcular o imposto | Sim | - |
| `tax_rate` | float | Alíquota do imposto (0.0 a 1.0) | Não | `0.15` (15%) |

**Retorno:**

| Tipo | Descrição |
|-------|-----------|
| `float` | Valor do imposto a pagar |

**Exceções:**

| Exceção | Quando é Lançada |
|----------|-------------------|
| `ValueError` | Quando `income` é negativo |

## Notas Importantes

### Validação de Input

A função valida que a renda não é negativa. Valores negativos lançam uma `ValueError`.

### Precisão

O retorno é um `float` com precisão padrão do Python. Para aplicações financeiras, considere arredondar para 2 casas decimais.

### Uso em Produção

Para cálculos de imposto em produção, recomenda-se:

1. Armazenar alíquotas em configuração/database
2. Implementar cache de cálculos para valores repetidos
3. Adicionar logging para auditoria

## Especificação OpenAPI

Se esta função for exposta como endpoint REST:

```yaml
calculateTax:
  post:
    summary: Calcula imposto sobre renda
    requestBody:
      content:
        application/json:
          schema:
            type: object
            properties:
              income:
                type: number
                description: Renda bruta
                minimum: 0
              tax_rate:
                type: number
                description: Alíquota do imposto
                minimum: 0
                maximum: 1
                default: 0.15
    responses:
      '200':
        description: Cálculo realizado com sucesso
        content:
          application/json:
            schema:
              type: object
              properties:
                tax:
                  type: number
                  description: Valor do imposto
      '400':
        description: Input inválido (renda negativa)
```
```

## 📚 Casos de Uso

### Cenário 1: Documentação de API REST

Gere documentação completa para endpoints REST com exemplos de requisição/resposta:

```bash
# Código da API
cat src/api/endpoints.py | fabric -p documentation_generator -g=pt-br > API_DOCS.md
```

### Cenário 2: README de Projeto

Crie um README completo para um novo projeto ou biblioteca:

```bash
# Código principal + requirements
cat README.md requirements.txt src/ | fabric -p documentation_generator -g=pt-br > NEW_README.md
```

### Cenário 3: Guia de Integração

Documente como integrar sua biblioteca em outros projetos:

```bash
# Código da biblioteca
cat lib/integration.py | fabric -p documentation_generator -g=pt-br > INTEGRATION_GUIDE.md
```

### Cenário 4: Documentação Interna

Gere documentação para uso interno da equipe:

```bash
# Código + comentários detalhados
cat src/core/service.ts | fabric -p documentation_generator -g=pt-br > INTERNAL_DOCS.md
```

## 📝 Tipos de Documentação Gerados

### 1. README de Projeto

Documentação geral do projeto:
- Título e descrição
- Instalação
- Uso básico
- Exemplos
- Contribuição
- License

### 2. API Documentation

Documentação detalhada de APIs:
- Endpoints e métodos
- Parâmetros de requisição
- Formatos de resposta
- Códigos de status
- Exemplos de chamada

### 3. Library/Guide de Uso

Documentação de bibliotecas e ferramentas:
- Visão geral
- Instalação e configuração
- API detalhada
- Exemplos de código
- Troubleshooting

### 4. OpenAPI/Swagger Spec

Especificação de APIs em formato YAML/JSON:
- Endpoints
- Schemas de dados
- Autenticação
- Exemplos de requisição/resposta

## 🔗 Integração com Ferramentas

### Ferramentas de Documentação

Use a saída da skill para alimentar outras ferramentas:

```bash
# Gerar Markdown para mkdocs
cat src/api.py | fabric -p documentation_generator -g=pt-br > docs/api.md

# Gerar especificação OpenAPI
cat src/api.py | fabric -p documentation_generator -g=pt-br | jq . > openapi.yaml

# Gerar para Sphinx
cat src/ | fabric -p documentation_generator -g=pt-br > docs/index.rst
```

### Pre-commit Hooks

Gere automaticamente documentação antes do commit:

```bash
#!/bin/bash
# .git/hooks/pre-commit

FILES=$(git diff --cached --name-only --diff-filter=ACM '*.py' '*.ts' '*.js')

for FILE in $FILES; do
  # Gerar documentação para arquivos modificados
  cat "$FILE" | fabric -p documentation_generator -g=pt-br > "docs/$(basename $FILE .md).md"
done

git add docs/
```

## 🔧 Troubleshooting

* **Documentação incompleta:** O pattern pode não identificar todas as funcionalidades. Forneça mais contexto ou exemplos.
* **Exemplos genéricos:** Sempre revise os exemplos gerados e ajuste para seu caso específico.
* **Formatação incorreta:** A saída é Markdown, mas pode precisar de ajustes finais.

## 📈 Boas Práticas de Documentação

A skill promove as seguintes boas práticas:

1. **Clareza:** Use linguagem acessível, evite jargões desnecessários
2. **Estrutura:** Organize em seções lógicas com headings
3. **Exemplos:** Sempre forneça exemplos práticos e executáveis
4. **Atualização:** Mantenha documentação sincronizada com o código
5. **Completude:** Documente todos os parâmetros públicos, retornos e exceções
6. **Autossuficiência:** Cada página deve ser compreensível independentemente

## 🔄 Workflow de Documentação Sugerido

```bash
# Passo 1: Desenvolver feature
vim src/new-feature.py

# Passo 2: Adicionar comentários/docstrings
vim src/new-feature.py  # Adicionar docstrings detalhadas

# Passo 3: Gerar documentação
cat src/new-feature.py | fabric -p documentation_generator -g=pt-br > docs/new-feature.md

# Passo 4: Revisar e ajustar
vim docs/new-feature.md  # Ajustar exemplos e formatar

# Passo 5: Commitar código + docs
git add src/new-feature.py docs/new-feature.md
git commit -m "feat: add new feature with documentation"
```

## 📊 Métricas de Qualidade de Documentação

A skill gera documentação que atende aos seguintes critérios:

| Critério | Padrão | Como Garantir |
|-----------|----------|---------------|
| **Completude** | Todos os métodos públicos documentados | Revisar saída |
| **Clareza** | Linguagem acessível e objetiva | Testar com novos usuários |
| **Exemplos** | Código executável e funcional | Rodar exemplos |
| **Estrutura** | Seções lógicas e navegáveis | Verificar headings |
| **Atualização** | Documentação reflete código atual | Revisar vs implementação |
| **Formatação** | Markdown válido e legível | Validar em preview |