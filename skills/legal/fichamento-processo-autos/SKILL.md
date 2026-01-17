---
name: fichamento-processo-autos
description: Cria fichamentos estruturados de processos autônomos, decisões administrativas e comunicacões.
usage: "cat processo_autos.txt | fabric -p fichamento_processo_autos -g=pt-br"
license: MIT
compatibility: opencode,claude
metadata:
  author: peixoto-ops
  version: 1.0.0
  category: legal
  requires: fabric-cli
  pattern: fichamento_processo_autos
  output_format: markdown
---

# Fichamento de Processos Autônomos Skill

Esta skill atua como um **Fichamento de Processos Assistido**, criando registros estruturados de processos autônomos, decisões administrativas, comunicacões oficiais e notificações. Ela utiliza o pattern `fichamento_processo_autos` para identificar e organizar informações sobre procedimentos, partes envolvidas, prazos e decisões.

## 🛠️ Sobre as Ferramentas

### 1. O Motor: Fabric
* **Repo Oficial:** [danielmiessler/fabric](https://github.com/danielmiessler/fabric)

### 2. O Cérebro: Custom Patterns
* **Repo Fonte:** [peixoto-ops/costum_patterns](https://github.com/peixoto-ops/costum_patterns)
* **Pattern Alvo:** `fichamento_processo_autos`

## 🎯 Como Utilizar

Esta skill é ideal para documentar processos autônomos como instauração de sindical, eleições, demissões, comunicacões de conselho, processos disciplinares ou qualquer procedimento sem decisão judicial.

### Comandos Padrão

```bash
# Fichamento de processo autônomo
cat processo_sindical.txt | fabric -p fichamento_processo_autos -g=pt-br

# Fichamento de decisão administrativa
echo "Decisão do conselho escolar sobre aprovação de matrícula" | fabric -p fichamento_processo_autos -g=pt-br

# Fichamento de notificação oficial
cat notificacao_governo.pdf | pdftotext -layout - | fabric -p fichamento_processo_autos -g=pt-br
```

## 📊 Formato de Saída

A skill gera um fichamento estruturado em 7 seções principais:

1. **Identificação do Processo**: Tipo, número, órgão responsável
2. **Partes Envolvidas**: Interessados, representados, autoridade
3. **Objetivos e Fases**: O que se busca alcançar
4. **Decisões e Atos**: Deliberações, publicações, comunicações
5. **Prazos e Datas**: Início, conclusão, prazos legais
6. **Fundamentação Legal**: Leis, regulamentos, jurisprudência
7. **Documentos Anexos**: Requerimentos, provas, atas, etc.

### Exemplo de Output

```markdown
## Identificação do Processo

- **Tipo de Processo**: Instauração de Sindicato
- **Número do Processo**: 00543/2024
- **Órgão Responsável**: Conselho Escolar Municipal de São Paulo
- **Data de Início**: 15/01/2024

## Partes Envolvidas

- **Sindicato**: Sindicato dos Trabalhadores em Educação (SINDIPE-SP)
- **Escola**: Escola Municipal "Professor João da Silva"
- **Interessados**: Diretoria, Conselho Escolar, Professores, Pais de Alunos

## Objetivos e Fases

- **Objetivo Principal**: Analisar viabilidade de matrícula para filho de trabalhador em escola particular
- **Fase 1**: Instrução do processo
- **Fase 2**: Coleta de documentos e manifestações
- **Fase 3**: Análise técnica e jurídica
- **Fase 4**: Deliberação e decisão

## Decisões e Atos

- **Ata de Instrução**: Conselho Escolar publica edital convocando pais interessados
- **Manifestações Apresentadas**: 3 manifestações, sendo 2 favoráveis à matrícula
- **Deliberação Final**: Por maioria de votos, o Conselho decide pela matrícula parcial (apenas para o 1º ano fundamental)

## Prazos e Datas

- **Prazo para Manifestação**: 30 dias a partir da publicação do edital
- **Data de Deliberação**: 20/02/2024
- **Prazo para Recurso Administrativo**: 5 dias úteis após decisão

## Fundamentação Legal

- **Constituição Federal**: Art. 227, inciso VI (direito de informação e petição)
- **Constituição Estadual**: Art. 208 da Constituição Paulista (direito à educação)
- **Lei nº 8.069/90** (ECA): Direito de participação em processos administrativos
- **Decreto Municipal nº 42.853/2002**: Regulamenta processos administrativos no município

## Documentos Anexos

- **Edital de Convocação**: Edital nº 001/2024
- **Manifestações**: Arquivos das 3 manifestações apresentadas
- **Regimento Interno**: Regimento do Conselho Escolar sobre matrículas
```

## 📚 Casos de Uso

### Cenário 1: Instauração de Sindicato

Documentar processo completo de instauração de sindicato com partes interessadas, requerimentos legais e etapas procedimentais:

```bash
# Texto do processo
cat processo_sindical.txt | fabric -p fichamento_processo_autos -g=pt-br
```

### Cenário 2: Processo Disciplinar em Escola

Registrar processo de apuração de infração escolar com todas as partes, provas, decisões e recursos:

```bash
# Relatório da direção
cat relatorio_direcao.pdf | pdftotext -layout - | fabric -p fichamento_processo_autos -g=pt-br
```

### Cenário 3: Demissão em Massa

Documentar processo de demissão coletiva em empresa com justificativas, direitos dos trabalhadores e prazos legais:

```bash
# Documento de demissão
echo "Demissão de 50 funcionários da empresa X, redução de quadro por reestruturação" | fabric -p fichamento_processo_autos -g=pt-br
```

## 📝 Notas Técnicas

* **Tipos de Processos Autônomos**: Instauração, investigação, disciplina, licitação, recursos, eleição, notificação, consulta pública
* **Partes Envolvidas**: Autoridade, interessados, representados, advogados, testemunhas, peritos, auditores
* **Fundamentação Legal**: Artigos da Constituição, leis específicas (ECA, Lei de Licitações, Estatutos), regulamentos, jurisprudência administrativa
* **Documentação**: Processos autônomos exigem documentação formal (atas, editais, requisições, certidões, publicações)
* **Prazos Legais**: Processos administrativos têm prazos legais estritos que devem ser respeitados sob pena de nulidade

## 🔧 Troubleshooting

* **Informações Insuficientes**: Se o texto não tiver todos os dados necessários, o fichamento será parcial. Forneça mais contexto.
* **Documentos Não Disponíveis**: Se referir documentos não fornecidos, o pattern indicará que devem ser anexados.
* **Linguagem Técnica**: Se o documento usar muitos termos técnicos ou jurídicos específicos, o pattern pode não interpretar corretamente. Simplifique ou forneça contexto.

## 🔄 Integração com Outras Skills

Esta skill funciona bem em conjunto com:

- `generate_abstract`: Para resumir processos longos
- `fichamento`: Para fichamentos de decisões judiciais
- `documentation_generator`: Para criar atas, ofícios ou documentos oficiais
- `deep_research_planner`: Para planejar pesquisas sobre legislação aplicável

## 📈 Boas Práticas de Fichamento

A skill promove as seguintes boas práticas:

1. **Objetividade**: Manter foco nos fatos e procedimentos, evitando interpretações subjetivas
2. **Cronologia**: Documentar eventos em ordem cronológica para facilitar reconstrução
3. **Completude**: Incluir todas as partes, documentos, prazos e decisões relevantes
4. **Organização**: Usar seções claras e hierarquia lógica para fácil navegação
5. **Referências Cruzadas**: Quando citar normas ou jurisprudência, identificar claramente a fonte
6. **Preservação**: Registrar documentos originais ou suas descrições para garantir integridade
7. **Atualização**: Manenha fichamento atualizado com novos desenvolvimentos e decisões

## 🔄 Workflow Sugerido

```bash
# Passo 1: Coletar documentos
mkdir -p processo_autos/{documentos,manifestacoes}
# Adicionar arquivos

# Passo 2: Criar fichamento inicial
cat descricao_processo.txt | fabric -p fichamento_processo_autos -g=pt-br > processo_autos/fichamento_inicial.md

# Passo 3: Atualizar com novos eventos
echo "Nova deliberação: Decisão prorrogada por 15 dias" | fabric -p fichamento_processo_autos -g=pt-br >> processo_autos/fichamento_inicial.md
```

## 📈 Práticas de Direito Administrativo

- **Legalidade**: Processos administrativos devem seguir estritamente os princípios da legalidade, impessoalidade, moralidade e publicidade (Constituição, Art. 37)
- **Motivação**: As decisões devem ser motivadas, evidenciadas e proporcionais
- **Devido Processo Legal**: Garantir ampla defesa e contraditório (princípios do contraditório e ampla defesa)
- **Publicidade**: Atos processuais devem ser públicos, salvo exceções constitucionais (sigilo, intimidade)
- **Razoabilidade**: Decisões administrativas devem ser razoáveis, proporcionais e compatíveis com o interesse público