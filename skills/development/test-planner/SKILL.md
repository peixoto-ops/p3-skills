---
name: test-planner
description: Planeja estratégias de testes (unit, integration, e2e) baseadas em código e requisitos.
usage: "cat src/main.py | fabric -p test_planner -g=pt-br"
license: MIT
compatibility: opencode,claude
metadata:
  author: peixoto-ops
  version: 1.0.0
  category: development
  requires: fabric-cli
  pattern: test_planner
  output_format: markdown
---

# Test Planner Skill

Esta skill atua como um **Test Planning Assistant**, criando estratégias de testes abrangentes para código ou features. Ela utiliza o pattern `test_planner` para gerar planos de testes completos, considerando diferentes níveis (unit, integration, e2e) e tipos de testes (functional, non-functional).

## 🛠️ Sobre as Ferramentas

### 1. O Motor: Fabric
* **Repo Oficial:** [danielmiessler/fabric](https://github.com/danielmiessler/fabric)

### 2. O Cérebro: Custom Patterns
* **Repo Fonte:** [peixoto-ops/costum_patterns](https://github.com/peixoto-ops/costum_patterns)
* **Pattern Alvo:** `test_planner`

## 🎯 Como Utilizar

Esta skill é ideal para planejar testes antes da implementação, revisar cobertura de testes existente, ou criar novos casos de teste para features.

### Comandos Padrão

```bash
# Planejar testes para função/classe específica
cat src/calculator.py | fabric -p test_planner -g=pt-br

# Planejar testes para feature completa
cat requirements.md feature-spec.md | fabric -p test_planner -g=pt-br

# Planejar testes baseados em código implementado
git diff main feature/auth | fabric -p test_planner -g=pt-br

# Salvar plano em arquivo
cat src/payment.py | fabric -p test_planner -g=pt-br > test-plan.md
```

## 📊 Formato de Saída

A skill fornece um plano de testes estruturado em 6 seções principais:

1. **Resumo da Estratégia:** Visão geral da abordagem de testes
2. **Testes Unitários:** Casos de teste para lógica isolada (com exemplos)
3. **Testes de Integração:** Casos para interação entre componentes
4. **Testes E2E:** Cenários completos de usuário
5. **Edge Cases e Casos de Borda:** Situações extremas e raros
6. **Priorização de Implementação:** Alta, média e baixa prioridade

### Exemplo de Output

```markdown
## Resumo da Estratégia de Testes

**Objetivo:** Garantir que o fluxo de pagamento funciona corretamente em todos os cenários, com foco em segurança e validação de transações.

**Níveis de Teste:**
- Unit: Validação de lógica individual de cálculos e validações
- Integration: Interação com gateway de pagamento e database
- E2E: Fluxo completo de checkout e processamento de pagamento

## Testes Unitários

### Caso 1: Cálculo de Taxa de Serviço
**Descrição:** Verifica cálculo correto da taxa baseada no valor.

```python
def test_calculate_service_fee_percentage(mocker):
    # Setup
    amount = 1000
    expected_fee = 100.0  # 10%
    
    # Execute
    fee = calculate_service_fee(amount)
    
    # Assert
    assert fee == expected_fee
    assert fee > 0
```

## Testes de Integração

### Caso 1: Integração com Gateway de Pagamento
**Descrição:** Verifica que a função se conecta corretamente ao gateway real.

## Testes E2E

### Cenário 1: Pagamento Bem-sucedido
**Given:** Usuário está logado com carrinho de $1000
**When:** Clica em "Finalizar Compra" e insere dados válidos
**Then:** Recebe confirmação de pagamento e redirecionado para página de sucesso

## Edge Cases e Casos de Borda

1. Valores negativos ou zero
2. Valores extremamente grandes (overflow)
3. Múltiplas requisições simultâneas (race conditions)
4. Timeout do gateway
5. Falha de rede durante processamento

## Priorização de Implementação

1. **Fase 1 (Alta prioridade):** Testes unitários de validação
2. **Fase 2 (Média prioridade):** Testes de integração com mocks
3. **Fase 3 (Baixa prioridade):** Testes E2E completos
```

## 📚 Casos de Uso

### Cenário 1: Planejamento de Testes Antes da Implementação (TDD)

Antes de escrever código, use a skill para planejar quais testes serão necessários:

```bash
# Especificação da feature
cat spec/feature-auth.md | fabric -p test_planner -g=pt-br > test-plan-auth.md

# Implementar seguindo o plano
vim src/auth.py
```

### Cenário 2: Revisão de Cobertura de Testes Existentes

Analise se seus testes atuais cobrem todos os cenários necessários:

```bash
# Código atual + testes existentes
cat src/payment.py tests/test_payment.py | fabric -p test_planner -g=pt-br

# Comparar com output para identificar lacunas
```

### Cenário 3: Refatoração de Testes

Melhore a estrutura e cobertura de testes existentes:

```bash
# Testes atuais
cat tests/legacy/ | fabric -p test_planner -g=pt-br

# Refatorar baseado no novo plano
vim tests/refactored/
```

## 📝 Níveis de Teste

### Unitários (Unit Tests)

Testam funções, métodos ou classes em isolamento, sem dependências externas.

**Características:**
- Rápidos (milissegundos)
- Não acessam database, rede ou filesystem
- Usam mocks/stubs para dependências

**Exemplo:**
```python
# Testa cálculo em isolamento
def test_calculate_discount_10_percent():
    assert calculate_discount(100, 0.10) == 90.0
```

### Integração (Integration Tests)

Testam a interação entre componentes ou sistemas.

**Características:**
- Média velocidade (segundos)
- Acessam database, API externas, filesystem
- Testam contratos entre componentes

**Exemplo:**
```python
# Testa integração com database real
def test_create_user_persists_to_db(db_session):
    user = User(email="test@example.com")
    db_session.add(user)
    db_session.commit()
    
    saved_user = db_session.query(User).first()
    assert saved_user.email == "test@example.com"
```

### E2E (End-to-End Tests)

Testam fluxos completos do usuário, simulando interação real.

**Características:**
- Lentos (minutos)
- Testam UI + API + Database
- Simulam comportamento real do usuário

**Exemplo:**
```python
# Testa fluxo completo de checkout
def test_checkout_flow(browser):
    browser.visit("/product/1")
    browser.click("add-to-cart")
    browser.visit("/checkout")
    browser.fill("email", "test@example.com")
    browser.click("place-order")
    assert browser.is_text_present("Order confirmed!")
```

## 🧪 Pyramid of Testing

A skill segue a **Testing Pyramid** para priorizar tipos de testes:

```
        /\
       /E2E\        (10%) - Testes lentos, caros
      /------\
     /Integration\    (30%) - Médios, balanceados
    /----------\
   /   Unit    \   (60%) - Rápidos, baratos, muitos
  /--------------\
 /----------------\
```

**Princípios:**
- **Base da pirâmide:** Muitos testes unitários (rápidos, baratos)
- **Meio:** Alguns testes de integração
- **Topo:** Poucos testes E2E (caros, frágeis)

## 🔗 Integração com Ferramentas

### Frameworks de Teste

A skill gera planos que podem ser implementados em qualquer framework:

- **Python:** pytest, unittest, nose2
- **JavaScript:** Jest, Mocha, Jasmine, Vitest
- **Java:** JUnit, TestNG
- **Go:** testing, testify

### Ferramentas de Cobertura

```bash
# Medir cobertura após implementação
pytest --cov=src --cov-report=html

# Verificar se os casos planejados foram implementados
```

### CI/CD

```bash
# Rodar testes automaticamente no pipeline
- name: Run tests
  run: pytest

- name: Generate coverage
  run: pytest --cov=src
```

## 🔧 Troubleshooting

* **Cobertura baixa:** O plano pode não ter incluído todos os caminhos de código
* **Testes frágeis:** E2E tests podem falhar por timing, considere mocks
* **Testes lentos:** Muitos testes de integração/E2E aumentam tempo de feedback
* **Duplicação de testes:** O plano pode sugerir testes já existentes

## 📈 Melhores Práticas

### Naming Conventions

Use nomes descritivos que indiquem o que está sendo testado:

```python
# Bom
def test_calculate_discount_with_zero_amount()

# Ruim
def test_1()
```

### AAA Pattern (Arrange-Act-Assert)

Organize testes em 3 seções claras:

```python
def test_discount_calculation():
    # Arrange
    amount = 100
    discount = 0.10
    
    # Act
    result = calculate_discount(amount, discount)
    
    # Assert
    assert result == 90.0
```

### Independent Tests

Cada teste deve ser independente dos outros:
- Setup e teardown próprios
- Não dependem de ordem de execução
- Estado limpo após finalização

### Testability

Código bem escrito é fácil de testar:
- Funções pequenas e focadas
- Dependências injetadas (facilita mocks)
- Sem efeitos colaterais