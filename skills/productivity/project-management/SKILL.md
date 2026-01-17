---
name: project-management
description: Planeja cronogramas adaptativos para projetos acadêmicos e jurídicos complexos, considerando fases, recursos e milestones.
usage: "echo 'Descrição do projeto' | fabric -p criar_cronograma_adaptativo -g=pt-br"
license: MIT
compatibility: opencode,claude
metadata:
  author: peixoto-ops
  version: 1.0.0
  category: productivity
  requires: fabric-cli
  pattern: criar_cronograma_adaptativo
  output_format: markdown
---

# Project Management Skill

Esta skill atua como um **Project Planning Assistant**, criando cronogramas adaptativos para projetos acadêmicos e jurídicos que variam desde estudos simples até projetos de livro completos. Ela utiliza o pattern `criar_cronograma_adaptativo` para considerar escopo, fases, alocação de recursos e milestones.

## 🛠️ Sobre as Ferramentas

### 1. O Motor: Fabric
* **Repo Oficial:** [danielmiessler/fabric](https://github.com/danielmiessler/fabric)

### 2. O Cérebro: Custom Patterns
* **Repo Fonte:** [peixoto-ops/costum_patterns](https://github.com/peixoto-ops/costum_patterns)
* **Pattern Alvo:** `criar_cronograma_adaptativo`

## 🎯 Como Utilizar

Esta skill é ideal para planejar projetos de pesquisa acadêmica, trabalhos de conclusão de curso, artigos jurídicos ou teses que requerem planejamento de tempo e recursos.

### Comandos Padrão

```bash
# Planejar projeto completo
echo "Projeto de tese sobre Direito Civil: Desvio Produtivo" | fabric -p criar_cronograma_adaptativo -g=pt-br

# Planejar com especificações detalhadas
cat especificacao-projeto.md | fabric -p criar_cronograma_adaptativo -g=pt-br > cronograma.md

# Planejar com base em dados parciais
echo "Fase 1 concluída: coleta de jurisprudência. Próximas fases?" | fabric -p criar_cronograma_adaptativo -g=pt-br
```

## 📊 Formato de Saída

A skill fornece um cronograma estruturado em 6 seções principais:

1. **Classificação do Escopo:** Tipo e complexidade do projeto
2. **Definição de Fases:** Fases do projeto com entregáveis
3. **Timeline Adaptativa:** Cronograma com flexibilidade para mudanças
4. **Alocação de Recursos:** Recursos por fase
5. **Cronograma de Milestones:** Pontos de controle e entregas
6. **Pontos de Qualidade:** Checkpoints de QA ao longo do projeto

### Exemplo de Output

```markdown
## Classificação do Escopo

**Tipo de Projeto:** Tese de Doutorado em Direito Civil

**Complexidade:** Alta
**Nível de Detalhe:** Livro completo

## Definição de Fases

### Fase 1: Revisão Bibliográfica (4 semanas)
- Levantamento de estado da arte
- Identificação de lacunas de pesquisa
- Seleção de metodologia
- **Entregável:** Relatório de Revisão Bibliográfica

### Fase 2: Coleta de Dados (8 semanas)
- Coleta de jurisprudência STJ/STF
- Análise de doutrina
- Entrevistas com especialistas
- **Entregável:** Base de dados consolidada

### Fase 3: Análise e Interpretação (6 semanas)
- Análise de dados coletados
- Identificação de padrões
- Formulação de tese
- **Entregável:** Capítulos preliminares

### Fase 4: Redação (12 semanas)
- Redação completa da tese
- Revisão e formatação
- **Entregável:** Tese final (300 páginas)

## Timeline Adaptativa

**Prazo Total:** 30 semanas (aprox. 7.5 meses)

**Flexibilidade:**
- +4 semanas para revisão adicional do orientador
- +2 semanas para coleta de dados adicional, se necessário

**Adaptação:**
- Se a revisão bibliográfica revelar mais fontes do que esperado, adicionar 2 semanas à Fase 2
- Se a coleta de jurisprudência for mais rápida que o planejado, iniciar Fase 3 1 semana antes

## Alocação de Recursos por Fase

| Fase | Tempo | Recursos Principais | Dependências |
|-------|--------|---------------------|--------------|
| Revisão Bibliográfica | 4 semanas | Biblioteca, acesso a STJNet | Nenhuma |
| Coleta de Dados | 8 semanas | STJNet, JusBrasil | Fase 1 |
| Análise e Interpretação | 6 semanas | Software de análise, orientador | Fase 2 |
| Redação | 12 semanas | Editor de texto, orientador | Fase 3 |

## Cronograma de Milestones

| Milestone | Data Alvo | Critérios de Conclusão | Fase Associada |
|-----------|-----------|-----------------------|----------------|
| M1: Metodologia Definida | Semana 4 | Relatório de Revisão Bibliográfica aprovado | Fase 1 |
| M2: Dados Coletados | Semana 12 | Base de dados com 50+ acórdãos | Fase 2 |
| M3: Análise Concluída | Semana 18 | Capítulos preliminares escritos | Fase 3 |
| M4: Primeira Versão | Semana 28 | Tese completa (versão rascunho) | Fase 4 |
| M5: Versão Final | Semana 32 | Tese aprovada pelo orientador | Fase 4 |

## Pontos de Qualidade

### Durante o Projeto:
- **Semana 4:** Revisão da metodologia pelo orientador
- **Semana 12:** Validação da qualidade dos dados coletados
- **Semana 18:** Revisão dos capítulos preliminares
- **Semana 24:** Checkpoint de andamento da redação

### Finais:
- Formatação conforme normas ABNT
- Revisão ortográfica e gramatical
- Consistência de citações
- Verificação de referências

## Estratégias de Adaptação

### Se o Escopo Aumentar:
1. Reavaliar todas as fases restantes
2. Identificar fases que podem ser aceleradas
3. Considerar alocação de recursos adicionais
4. Ajustar milestone final proporcionalmente

### Se o Escopo Reduzir:
1. Remover fases menos críticas
2. Consolidar fases relacionadas
3. Mantenho milestones de qualidade
4. Ajustar cronograma para prazo mais curto

### Se Houver Atraso:
1. Identificar causa do atraso
2. Repriorizar tarefas restantes
3. Ajustar recursos para recuperar tempo perdido
4. Comunicar novos prazos às partes interessadas
```

## 📚 Casos de Uso

### Cenário 1: Planejamento de Tese

Planejar cronograma completo para tese de doutorado com 12 meses de prazo:

```bash
echo "Tese sobre Teoria da Desconsideração da Personalidade Jurídica" | fabric -p criar_cronograma_adaptativo -g=pt-br
```

### Cenário 2: Artigo Acadêmico

Criar cronograma para artigo com prazo de 2 meses:

```bash
cat requisitos-artigo.md | fabric -p criar_cronograma_adaptativo -g=pt-br
```

### Cenário 3: Projeto de Pesquisa Jurídica

Planejar pesquisa para parecer jurídico complexo com 6 meses:

```bash
echo "Parecer sobre responsabilidade civil em plataformas digitais" | fabric -p criar_cronograma_adaptativo -g=pt-br
```

### Cenário 4: Replanejamento em Progresso

Adaptar cronograma existente a mudanças de escopo durante o projeto:

```bash
echo "Fase 2 concluída mais rápido que esperado. Descobrimos necessidade de mais 2 semanas na Fase 3." | fabric -p criar_cronograma_adaptativo -g=pt-br
```

## 📝 Notas Técnicas

* **Adaptabilidade:** O cronograma é desenhado para ser flexível e adaptável a mudanças
* **Milestones:** Pontos de controle claros para monitoramento de progresso
* **Recursos:** Considera alocação de tempo, materiais e equipe
* **Qualidade:** Incorpora checkpoints de QA em cada fase
* **Escalabilidade:** Funciona para projetos pequenos (artigos) até grandes (teses, livros)

## 🔧 Troubleshooting

* **Cronograma Irrealista:** Ajuste as estimativas de tempo ou reduza o escopo
* **Falta de Recursos:** Identifique fases que exigem mais recursos do que disponível
* **Milestones Vagos:** Torne os critérios de conclusão mais específicos e mensuráveis

## 🔄 Integração com Outras Skills

Esta skill funciona bem em conjunto com:

- `generate_abstract`: Para gerar resumos de cada fase
- `documentation_generator`: Para documentar decisões e progresso
- `deep_research_planner`: Para planejar pesquisas específicas dentro de cada fase

## 📈 Boas Práticas de Gestão de Projetos

A skill promove:

1. **Definição Clara de Escopo:** Sempre comece com o objetivo bem definido
2. **Divisão em Fases:** Quebre grandes projetos em fases manejáveis
3. **Milestones Mensuráveis:** Cada milestone deve ter critérios de conclusão claros
4. **Buffer de Tempo:** Inclua tempo extra para imprevistos
5. **Revisão Periódica:** Checkpoints regulares para ajustar cronograma conforme necessário
6. **Documentação de Decisões:** Mantenha registro de decisões importantes e mudanças de escopo