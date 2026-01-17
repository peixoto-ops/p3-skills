---
name: debug-analyzer
description: Analisa stack traces, mensagens de erro e logs para identificar causas e sugerir correções.
usage: "cat error.log | fabric -p debug_analyzer -g=pt-br"
license: MIT
compatibility: opencode,claude
metadata:
  author: peixoto-ops
  version: 1.0.0
  category: development
  requires: fabric-cli
  pattern: debug_analyzer
  output_format: markdown
---

# Debug Analyzer Skill

Esta skill atua como um **Debug Assistant Especializado**, analisando stack traces, mensagens de erro ou logs para identificar a causa raiz e sugerir soluções. Ela utiliza o pattern `debug_analyzer` para fornecer diagnósticos precisos e acionáveis.

## 🛠️ Sobre as Ferramentas

### 1. O Motor: Fabric
* **Repo Oficial:** [danielmiessler/fabric](https://github.com/danielmiessler/fabric)

### 2. O Cérebro: Custom Patterns
* **Repo Fonte:** [peixoto-ops/costum_patterns](https://github.com/peixoto-ops/costum_patterns)
* **Pattern Alvo:** `debug_analyzer`

## 🎯 Como Utilizar

Esta skill é ideal quando você está enfrentando erros, exceções ou comportamentos inesperados no código.

### Comandos Padrão

```bash
# Analisar stack trace completo
cat error.log | fabric -p debug_analyzer -g=pt-br

# Analisar traceback específico
echo "Stacktrace aqui..." | fabric -p debug_analyzer -g=pt-br

# Analisar log de aplicação
cat app.log | grep -A 20 "ERROR" | fabric -p debug_analyzer -g=pt-br

# Analisar erro de terminal (paste direto)
fabric -p debug_analyzer -g=pt-br <<< "Erro copiado aqui"
```

## 📊 Formato de Saída

A skill fornece uma análise estruturada em 6 seções principais:

1. **Diagnóstico Rápido:** 1-2 frases com o problema identificado
2. **Análise Detalhada:** Stack trace, logs e contexto
3. **Causa Raiz Identificada:** O que causou o erro
4. **Solução Proposta:** Correções com exemplos de código
5. **Medidas Preventivas:** Como evitar o erro no futuro
6. **Ferramentas/Comandos Úteis:** Ferramentas para investigação adicional

### Exemplo de Output

```markdown
## Diagnóstico Rápido

Ocorreu um `TypeError` ao tentar acessar a chave `'email'` de um objeto `None`. Isso indica que `user_data` não foi preenchido corretamente.

## Análise Detalhada

**Stack Trace:**
- Line 45 em `app.py`: Acesso a `user_data['email']`
- Erro: `'NoneType' object is not subscriptable`

**Contexto:**
A função `process_user_data` espera que `user_data` seja um dicionário, mas recebeu `None`.

## Causa Raiz

A causa raiz é que a fonte de dados não retornou um usuário válido, mas o código não valida isso antes de tentar acessar as chaves do dicionário.

## Solução Proposta

### Antes:
```python
def process_user_data(user_id):
    user_data = database.get_user(user_id)
    result = user_data['email'].split('@')
    return result
```

### Depois:
```python
def process_user_data(user_id):
    user_data = database.get_user(user_id)
    
    # Validação de input
    if user_data is None:
        raise ValueError(f"Usuário {user_id} não encontrado")
    
    # Validação de campos
    if 'email' not in user_data:
        raise ValueError("Usuário não possui email cadastrado")
    
    return user_data['email'].split('@')
```

## Medidas Preventivas

1. **Validação de Input:** Sempre valide se objetos não são `None` antes de acessá-los.
2. **Type Hints:** Use type hints para documentar o tipo esperado.
3. **Early Returns:** Retorne ou levante exceções logo no início da função se os dados forem inválidos.

## Ferramentas/Comandos Úteis

```bash
# Verificar tipos de objetos durante debug
print(type(user_data))

# Usar debugger interativo
import pdb; pdb.set_trace()

# Verificar chaves do dicionário
print(user_data.keys() if user_data else "None")

# Analisar com breakpoint (Python 3.7+)
import ipdb; ipdb.set_trace()
```
```

## 📚 Casos de Uso

### Cenário 1: Stack Trace de Exceção em Python

```bash
cat error.log | fabric -p debug_analyzer -g=pt-br
```

### Cenário 2: Error Message de JavaScript

```bash
console.log("Erro aqui") | fabric -p debug_analyzer -g=pt-br
```

### Cenário 3: Log de Aplicação (Generic)

```bash
tail -n 50 app.log | fabric -p debug_analyzer -g=pt-br
```

### Cenário 4: Panic do Go

```bash
cat crash.log | fabric -p debug_analyzer -g=pt-br
```

## 🐛 Tipos Comuns de Erros

### TypeError

**Causa:** Operação em tipo inesperado (ex: string + number)

**Solução:**
```python
# Antes
result = "Total: " + price

# Depois
result = "Total: " + str(price)
```

### AttributeError

**Causa:** Acessar atributo/método que não existe

**Solução:**
```python
# Verificar se objeto existe
if user and hasattr(user, 'email'):
    print(user.email)
```

### KeyError (Python) / ReferenceError (JavaScript)

**Causa:** Acessar chave em dicionário/objeto que não existe

**Solução:**
```python
# Usar .get() com valor padrão
email = user_data.get('email', 'default@example.com')

# Ou verificar antes
if 'email' in user_data:
    email = user_data['email']
```

### IndexError / Out of Bounds

**Causa:** Acessar índice fora do array/lista

**Solução:**
```python
# Verificar tamanho antes
if len(items) > index:
    return items[index]
else:
    return None
```

### ConnectionError / Timeout

**Causa:** Falha de conexão com serviço externo

**Solução:**
```python
try:
    response = api_call()
except requests.Timeout:
    log.error("Timeout após 30 segundos")
    return None
```

## 🔗 Stack Trace Analysis

A skill analisa stack traces seguindo a pilha de chamadas:

```
Traceback (most recent call last):
  File "app.py", line 45, in process_user_data      # ← Função onde ocorreu
    result = user_data['email'].split('@')        # ← Linha do erro
TypeError: 'NoneType' object is not subscriptable  # ← Tipo do erro
```

**Interpretação:**
1. **Topo da stack:** Última função chamada antes do erro
2. **Linha do erro:** Exatamente onde ocorreu
3. **Tipo do erro:** O que aconteceu
4. **Mensagem:** Detalhes específicos

## 🛠️ Ferramentas de Debug

### Python

```bash
# pdb (Python Debugger)
import pdb; pdb.set_trace()

# ipdb (melhor que pdb)
import ipdb; ipdb.set_trace()

# pdb++ (melhor ainda)
import pdbpp; pdbpp.set_trace()

# breakpoint (Python 3.7+)
breakpoint()
```

### JavaScript/Node.js

```javascript
// debugger (Chrome DevTools)
debugger;

// console.log estruturado
console.log({ user_data, error: err.stack });
```

### Go

```go
// Delve Debugger
import "github.com/go-delve/delve"
dlv debug main.go
```

## 🔬 Técnicas de Debug

### Binary Search (Bissection)

Quando não sabe onde está o erro, divida o problema ao meio:

```python
# Adicionar logs intermediários
print("Debug 1")
function_part_1()
print("Debug 2")
function_part_2()
print("Debug 3")
```

### Rubber Duck Debugging

Explique o problema em voz alta para um "pato de borracha":
- Muitas vezes você encontra a solução explicando
- O ato de formular o problema ajuda a identificar inconsistências

### Print Debugging

Adicione prints estratégicos (não substitui debugger real):

```python
print(f"DEBUG: user_data type={type(user_data)}, value={user_data}")
print(f"DEBUG: len(items)={len(items)}")
```

### Logging Estruturado

Use logging em vez de print para maior flexibilidade:

```python
import logging

logger = logging.getLogger(__name__)
logger.error("Error processing user %s", user_id, exc_info=True)
```

## 🔧 Troubleshooting

* **Erro não identificado:** O pattern pode não reconhecer certos tipos de erro
* **Contexto insuficiente:** Forneça mais código ao redor do erro
* **Múltiplas causas:** Stack traces podem ter causas compostas (root cause + side effects)
* **Erro intermitente:** Use logging detalhado para capturar contexto quando ocorrer

## 📈 Boas Práticas de Debug

### 1. Reproduzir o Erro

Antes de corrigir, garanta que consegue reproduzir consistentemente:
- Anote passos exatos
- Identifique dependências (dados, configuração, ambiente)
- Capture estado do sistema

### 2. Isolar o Problema

Reduza o código ao mínimo que ainda reproduz o erro:
- Mova código para script isolado
- Use inputs simplificados
- Remove dependências não essenciais

### 3. Adicionar Logs Estratégicos

Não adicione logs em todo lugar:
- Foque em pontos de decisão
- Logue estados antes e depois de operações críticas
- Logue valores de variáveis importantes

### 4. Testar a Correção

Após aplicar correção:
- Reproduza o erro novamente (não deve mais ocorrer)
- Teste edge cases relacionados
- Verifique se não introduziu novos erros

### 5. Documentar

Documente o bug e a solução:
- Causa raiz
- Código de correção
- Como prevenir no futuro
- Testes adicionados

## 🔄 Workflow de Debug Sugerido

```bash
# Passo 1: Capturar o erro
tail -f app.log | tee error.log

# Passo 2: Analisar com debug_analyzer
cat error.log | fabric -p debug_analyzer -g=pt-br > analysis.md

# Passo 3: Adicionar logs/prints baseados na análise
vim src/app.py  # Adicionar debug logs

# Passo 4: Reproduzir com logs
pytest -xvs test_case.py

# Passo 5: Corrigir baseado na análise
vim src/app.py  # Aplicar correção

# Passo 6: Testar novamente
pytest test_case.py

# Passo 7: Remover logs de debug
vim src/app.py  # Remover prints de debug
```