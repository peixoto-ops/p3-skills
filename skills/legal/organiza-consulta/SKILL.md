---
name: organiza-consulta
description: Automatiza consultas jurídicas, relatórios e documentos com base em templates personalizados.
usage: "echo 'Contexto da consulta' | fabric -p organiza_consulta -g=pt-br"
license: MIT
compatibility: opencode,claude
metadata:
  author: peixoto-ops
  version: 1.0.0
  category: legal
  requires: fabric-cli
  pattern: organiza_consulta
  output_format: markdown
---

# Organiza Consultas Skill

Esta skill atua como um **Legal Automation Assistant**, automatizando consultas jurídicas, análises contratuais, pesquisas preliminares e relatórios recorrentes com base em templates personalizados. Ela utiliza o pattern `organiza_consulta` para gerar pareceres jurídicos estruturados, análises detalhadas e documentos prontos para uso.

## 🛠️ Sobre as Ferramentas

### 1. O Motor: Fabric
* **Repo Oficial:** [danielmiessler/fabric](https://github.com/danielmiessler/fabric)

### 2. O Cérebro: Custom Patterns
* **Repo Fonte:** [peixoto-ops/costum_patterns](https://github.com/peixoto-ops/costum_patterns)
* **Pattern Alvo:** `organiza_consulta`

## 🎯 Como Utilizar

Esta skill é ideal para automatizar o workflow jurídico de advogados e analistas, criando pareceres, relatórios e documentos estruturados com base em templates personalizados.

### Comandos Padrão

```bash
# Análise jurídica simples
echo "Contexto do caso" | fabric -p organiza_consulta -g=pt-br

# Com base em arquivo de especificação
cat especificacao-caso.md | fabric -p organiza_consulta -g=pt-br

# Com múltiplos contextos (comandos separados)
echo "Contexto1" | fabric -p organiza_consulta -g=pt-br
echo "Contexto2" | fabric -p organiza_consulta -g=pt-br
```

## 📊 Formato de Saída

A skill gera um documento estruturado em 10 seções principais:

1. **Contexto Inicial**: Fatos relevantes, área do direito, urgência
2. **Fatos Relevantes**: Detalhes específicos do caso
3. **Dispositivos Legais Aplicáveis**: Leis, artigos, jurisprudência
4. **Análise Preliminar**: Avaliação inicial da situação
5. **Procedimentos Sugeridos**: Passos do processo
6. **Prazos Estimados**: Tempo para cada fase
7. **Recursos Necessários**: Documentos, perícias, evidências
8. **Riscos Identificados**: Possíveis complicações
9. **Recomendações**: Orientações específicas
10. **Conclusão**: Síntese da análise

### Exemplo de Output

```markdown
# Consulta Jurídica: Rescisão de Contrato de Prestação de Serviços

## 1. Contexto Inicial

- **Questão principal**: O cliente deseja rescindir contrato de prestação de serviços com uma empresa e precisa de orientação sobre os procedimentos e eventuais penalidades envolvidas.
- **Área do direito**: Direito Civil, Direito Contratual, Direito do Consumidor.
- **Urgência**: Moderada, pois o cliente precisa saber quais são os seus direitos e obrigações em relação à rescisão contratual.

## 2. Fatos Relevantes

- O cliente contratou serviços de uma empresa de manutenção por 24 meses.
- O contrato prevê cláusula penal em caso de rescisão antecipada, e o cliente deseja entender a aplicabilidade e consequências dessa cláusula.
- Os serviços apresentaram vícios recorrentes nos primeiros 6 meses.

## 3. Dispositivos Legais Aplicáveis

- **Art. 593 do Código Civil**: Trata sobre contratos de prestação de serviços e as condições de rescisão unilateral com cláusulas abusivas.
- **Art. 413 do Código Civil**: Dispõe sobre a redução equitativa da cláusula penal em caso de rescisão parcial ou cumprimento parcial das obrigações.
- **Lei nº 8.078/1990 (Código de Defesa do Consumidor)**: Aplicável na relação de consumo entre o cliente e a empresa de serviços.

## 4. Análise Preliminar

A análise inicial indica que o cliente possui fundamento jurídico para pleitear:
1. Rescisão sem aplicação da multa penal
2. Ressarcimento por prejuízos decorrentes de vícios nos serviços
3. Devolução de valores pagos indevidamente
4. Documentação robusta para comprovar os vícios nos serviços (fotos, vídeos, laudos técnicos)

A cláusula penal pode ser considerada abusiva se for excessiva em relação ao valor total do contrato. Além disso, é importante verificar a existência de eventuais vícios ou falhas no serviço que justifiquem a rescisão sem aplicação de penalidade.

## 5. Procedimentos Sugeridos

### Fase 1: Notificação Extrajudicial

- Enviar notificação formal à empresa solicitando rescisão
- Especificar prazo de 15 dias para regularização
- Manter registro de todas as comunicações
- Documentar as tentativas de negociação

### Fase 2: Negociação Amigável

- Propor rescisão sem aplicação da multa penal
- Solicitar devolução de valores pagos indevidamente
- Documentar as tentativas de negociação

### Fase 3: Ação Judicial (se necessário)

- Ajuizar ação de rescisão contratual com pedido de tutela antecipada
- Requerer produção antecipada de documentos pela empresa
- Considerar pedido de danos morais por desgaste emocional

## 6. Prazos Estimados

| Fase | Prazo | Justificativa |
|-------|--------|--------------|
| Notificação Extrajudicial | 5 dias | Tempo razoável para resposta |
| Negociação Amigável | 15 dias | Período padrão para tentativa de acordo |
| Ação Judicial | 30 dias | Prazo para preparação e ajuizamento |

## 7. Recursos Necessários

- Contrato firmado original
- Comprovantes de pagamento
- Comprovantes dos vícios nos serviços (fotos, vídeos, laudos)
- Registros de comunicação com a empresa (e-mails, mensagens)
- Laudo técnico avaliando os serviços prestados

## 8. Riscos Identificados

- **Risco 1**: A empresa pode alegar que os vícios foram resolvidos, dificultando comprovação
- **Risco 2**: A cláusula penal pode ser considerada válida se não houver prova de vícios recorrentes
- **Risco 3**: Prazo prescricional de 1 ano para ação de rescisão contratual

**Mitigação**: Manter documentação robusta e buscar precedentes jurisprudenciais recentes sobre casos semelhantes de rescisão de contratos de manutenção.

## 9. Recomendações

- Recomenda-se busca de jurisprudência do TJSP sobre casos semelhantes de rescisão de contratos de manutenção.
- Consultar Súmula 353 do STJ para estratégia de combate à multas abusivas.
- Considerar ação de consução em proteção ao consumidor, se aplicável.
- Avaliar possibilidade de inclusão do valor da multa nos danos morais pleiteados.

## 10. Conclusão

O cliente possui sólido fundamento jurídico para pleitear a rescisão contratual sem aplicação da multa penal, com base nos vícios nos serviços e na jurisprudência favorável sobre cláusulas abusivas em contratos de consumo. Recomenda-se priorizar a negociação amigável antes de propor ação judicial.```

## 📚 Casos de Uso

### Cenário 1: Parecer Jurídico Sobre Rescisão Contratual

Gerar parecer completo sobre rescisão de contrato de prestação de serviços:

```bash
echo "Cliente deseja rescindir contrato de manutenção com cláusula penal abusiva" | fabric -p organiza_consulta -g=pt-br > parecer_rescisao.md
```

### Cenário 2: Consulta Preliminar Sobre Causa de Direito

Analisar viabilidade de ação judicial para uma causa específica:

```bash
echo "Análise de direito autoral para obra não autorizada" | fabric -p organiza_consulta -g=pt-br > consulta_preliminar.md
```

### Cenário 3: Relatório de Acompanhamento de Processo

Gerar relatório estruturado de andamento de processo judicial:

```bash
cat processo_dados.json | fabric -p organiza_consulta -g=pt-br > relatorio_acompanhamento.md
```

### Cenário 4: Template Recorrente

Criar template padronizado para consultas frequentes:

```bash
echo "TEMPLATE_CONSULTA_CONTRATUAL" | fabric -p organiza_consulta -g=pt-br > templates/consulta_contratual.md

# Usar o template posteriormente
cat templates/consulta_contratual.md | sed 's/CONTEXTO_AQUI/'"${CONTEXTO}"/' | fabric -p organiza_consulta -g=pt-br
```

## 📝 Notas Técnicas

* **Templates Personalizados**: O pattern `organiza_consulta` aceita tags personalizadas para adaptar a saída.
* **Estrutura Flexível**: O padrão de 10 seções pode ser ajustado conforme necessidade.
* **Reutilização**: Templates podem ser salvos e reutilizados para casos semelhantes.
* **Documentação Completa**: Cada documento gerado é auto-suficiente e pronto para uso.
* **Atualização**: Templates devem ser salvos e jurisprudência atualizados.

## 🔧 Troubleshooting

* **Saída Incompleta**: Se o contexto fornecido for muito vago, o documento gerado será genérico. Forneça mais detalhes.
* **Formato Incorreto**: Verifique se o template está usando tags corretas (ex: `{{nome_do_cliente}}`).
* **Jurisprudência Desatualizada**: O pattern pode incluir jurisprudência genérica. Sempre revise e atualize com casos recentes.

## 🔄 Workflow de Automação

```bash
# Passo 1: Definir templates recorrentes
mkdir -p templates/{contratos, rescisoes, consultas}

# Passo 2: Coletar informações relevantes
# Extrair dados de contratos, processos, jurisprudência

# Passo 3: Gerar documentos automaticamente
# Gerar pareceres para cada consulta
# Documentar decisões importantes

# Passo 4: Revisar e refinar
# Analisar qualidade dos documentos gerados
# Ajustar templates conforme necessário
```

## 📈 Métricas de Qualidade

As automações geradas pela skill atendem aos seguintes critérios:

| Critério | Padrão | Como Garantir |
|-----------|----------|---------------|
| Completude | Todas seções preenchidas | Revisar saída vs contexto |
| Precisão Legal | Citações corretas e atualizadas | Verificar jurisprudência |
| Clareza | Linguagem acessível e objetiva | Testar com novos usuários |
| Estrutura | Organização lógica com headings | Verificar formatação |
| Ação | Passos claros e executáveis | Incluir responsabilidades |

## 📈 Melhoria Contínua

Para melhorar a qualidade das automações:

1. **Salvar Templates Bem-sucedidos**: Crie uma biblioteca de templates para consultas recorrentes.
2. **Iterar no Pattern**: Se determinadas seções não são úteis, ajuste o pattern em `costum_patterns`.
3. **Coletar Feedback**: Anote quais partes dos documentos gerados precisam de ajuste manual frequente.
4. **Criar Sub-templates**: Para seções específicas como "Recursos Necessários" ou "Riscos Identificados".
5. **Documentação Completa**: Sempre documentar os procedimentos e melhorias implementadas.