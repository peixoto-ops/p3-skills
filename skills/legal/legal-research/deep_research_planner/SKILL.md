---
name: deep_research_planner
description: Planeja pesquisas jurídicas complexas usando Fabric e pattern deep_research_metaprompt. Ideal para estruturar hardcases e cenários de contraditório.
license: MIT
compatibility: opencode,claude
metadata:
  author: peixoto-ops
  version: 1.0.0
  category: legal-research
  requires: fabric-cli
  pattern: deep_research_metaprompt
---

# Deep Research Planner Skill

Esta skill utiliza a engine de IA **Fabric** para estruturar planos de pesquisa jurídica robustos, focados em contraditório e cenários judiciais complexos.

## 🛠️ Sobre as Ferramentas

### 1. O Motor: Fabric

O **Fabric** é uma ferramenta open-source de CLI projetada para "Augmentação Humana" via IA. Ele permite a execução de prompts modulares (Patterns) diretamente no terminal.

*   **Repositório Oficial:** [danielmiessler/fabric](https://github.com/danielmiessler/fabric)
*   **Documentação:** [Fabric Documentation](https://github.com/danielmiessler/fabric)
*   **Instalação:** `go install github.com/danielmiessler/fabric@latest`

### 2. O Cérebro: Custom Patterns

A lógica desta skill reside no repositório central de patterns do usuário. O pattern específico utilizado é o `deep_research_metaprompt`.

*   **Repositório Fonte:** [peixoto-ops/costum_patterns](https://github.com/peixoto-ops/costum_patterns)
*   **Pattern Alvo:** `deep_research_metaprompt`

## 🚀 Como Utilizar

O agente deve invocar esta skill sempre que o usuário apresentar um problema jurídico vago que necessite de estruturação antes da pesquisa de campo.

### Comando Padrão

```bash
# Entrada via texto direto (com saída em Português)
echo "TEMA" | fabric -p deep_research_metaprompt -g=pt-br

# Entrada via arquivo de contexto (com saída em Português)
cat caso_cliente.txt | fabric -p deep_research_metaprompt -g=pt-br

# Saída salva em arquivo (usando flag -o)
cat caso_cliente.txt | fabric -p deep_research_metaprompt -g=pt-br -o plano_pesquisa.md
```

### Gerenciamento de Saída (Arquivos)

Para workflows sequenciais ou assíncronos, use a flag `-o` para definir o arquivo de saída. Isso permite encadear múltiplas execuções e referenciar resultados anteriores.

```bash
# Saída em Markdown (ideal para documentação)
echo "TEMA" | fabric -p deep_research_metaprompt -g=pt-br -o output/plano_pesquisa.md

# Saída em JSON (ideal para parsing e integração)
echo "TEMA" | fabric -p deep_research_metaprompt -g=pt-br -o output/plano_pesquisa.json

# Saída em TXT (ideal para leitura direta ou input para outras ferramentas)
echo "TEMA" | fabric -p deep_research_metaprompt -g=pt-br -o output/plano_pesquisa.txt
```

#### Escolha de Extensão

| Extensão | Quando Usar | Benefício |
|----------|-------------|-----------|
| `.md` | Documentação, relatórios, anexos | Formatação rica, fácil de ler |
| `.json` | Parsing, integração com scripts | Estruturado, programaticamente acessível |
| `.txt` | Input para outras ferramentas/skills | Simples, universal |

#### Workflow Sequencial

```bash
# Passo 1: Gerar plano de pesquisa
echo "Desvio Produtivo do Consumidor" | fabric -p deep_research_metaprompt -g=pt-br -o research/01_plano.md

# Passo 2: Usar o plano como contexto para próxima execução
cat research/01_plano.md | fabric -p outro_pattern -g=pt-br -o research/02_estrategia.md
```

### Fluxo de Trabalho Típico

1.  **Análise Inicial:** O agente recebe o tema jurídico do usuário
2.  **Invocação do Pattern:** Executa `fabric -p deep_research_metaprompt -g=pt-br`
3.  **Estruturação:** O pattern retorna um plano de pesquisa estruturado
4.  **Validação:** O agente valida e refina o plano com o usuário
5.  **Execução:** Inicia a pesquisa de campo baseada no plano

## 📚 Casos de Uso

### Exemplo Prático: Direito Civil Brasileiro

**Tema:** "Desvio Produtivo do Consumidor em Contratos de Adesão Bancários"

```bash
echo "Desvio Produtivo do Consumidor em Contratos de Adesão Bancários" | fabric -p deep_research_metaprompt -g=pt-br
```

**Saída Esperada (Estrutura):**
1.  **Contextualização Legal:** Art. 4°, CDC; Jurisprudência STJ/STF
2.  **Eixos de Pesquisa:** Doutrina majoritária vs. minoritária
3.  **Cenários de Contraditório:** Defesas comuns das instituições bancárias
4.  **Provas Documentais:** Contratos, extratos, comprovantes
5.  **Jurisprudência Selecionada:** Precedentes favoráveis e desfavoráveis
6.  **Tese Jurídica:** Síntese argumentativa para petição inicial

### Outros Casos Aplicáveis

*   **Direito Trabalhista:** Configuração de terceirização ilícita
*   **Direito Tributário:** Planejamento tributário vs. evasão fiscal
*   **Direito Empresarial:** Desconsideração da personalidade jurídica
*   **Direito Ambiental:** Responsabilidade civil por dano ambiental

## 📝 Notas Importantes

*   **Idioma:** O pattern original está em Inglês. Use sempre a flag `-g=pt-br` para forçar saída em Português.
*   **Pré-requisitos:** Fabric CLI deve estar instalado e configurado no sistema.
*   **Patterns Customizados:** O pattern `deep_research_metaprompt` deve estar disponível no diretório de patterns do Fabric (geralmente `~/.config/fabric/patterns/`).
*   **Iteração:** O agente pode executar o pattern múltiplas vezes com refinamentos do tema se necessário.

## 🔧 Troubleshooting

*   **Comando não encontrado:** Verifique se o Fabric está instalado: `which fabric`
*   **Pattern não encontrado:** Verifique se o pattern está disponível: `ls ~/.config/fabric/patterns/`
*   **Saída em Inglês:** Adicione explicitamente `-g=pt-br` ao comando
*   **Configuração do LLM:** Verifique se o arquivo de configuração do Fabric (`~/.config/fabric/config.yaml`) está configurado corretamente

## 📖 Recursos Adicionais

*   Verifique `docs/architecture.md` para entender a arquitetura geral do p3-skills
*   Consulte `templates/skill_template.md` para criar novas skills baseadas neste modelo
*   Contribua com melhorias via PR no repositório p3-skills