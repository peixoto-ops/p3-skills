---
name: git-workflow-helper
description: Auxilia workflows Git com comandos, estratégias de branching e práticas de colaboração.
usage: "git status | fabric -p git_workflow_helper -g=pt-br"
license: MIT
compatibility: opencode,claude
metadata:
  author: peixoto-ops
  version: 1.0.0
  category: development
  requires: fabric-cli, git
  pattern: git_workflow_helper
  output_format: bash
---

# Git Workflow Helper Skill

Esta skill atua como um **Git Assistant Especializado**, auxiliando operações Git desde comandos básicos até workflows complexos de colaboração em equipe. Ela utiliza o pattern `git_workflow_helper` para fornecer comandos precisos, seguros e explicados de forma clara.

## 🛠️ Sobre as Ferramentas

### 1. O Motor: Fabric
* **Repo Oficial:** [danielmiessler/fabric](https://github.com/danielmiessler/fabric)

### 2. O Cérebro: Custom Patterns
* **Repo Fonte:** [peixoto-ops/costum_patterns](https://github.com/peixoto-ops/costum_patterns)
* **Pattern Alvo:** `git_workflow_helper`

## 🎯 Como Utilizar

Esta skill é ideal quando você precisa de ajuda com operações Git, workflows de equipe, ou resolveu problemas com branches e merges.

### Comandos Padrão

```bash
# 1. Solicitar ajuda com Git (direto)
echo "Quero fazer rebase do meu branch em main" | fabric -p git_workflow_helper -g=pt-br

# 2. Solicitar ajuda com comandos complexos
git status | fabric -p git_workflow_helper -g=pt-br

# 3. Descrever situação para obter comando
echo "Criei uma branch errada, quero renomear e voltar para a main" | fabric -p git_workflow_helper -g=pt-br
```

### Casos de Uso Comuns

#### Caso 1: Iniciar Nova Feature

**Input:**
"Quero criar uma nova branch para feature de login"

**Output Esperado:**
```bash
# Criar e mudar para nova branch
git checkout -b feature/login

# Verificar branch atual
git branch
```

#### Caso 2: Rebase Local em Main

**Input:**
"Meu branch está desatualizado, preciso rebasear"

**Output Esperado:**
```bash
# Atualizar branch local com remotas
git fetch origin

# Fazer rebase em main
git rebase origin/main
```

**⚠️ ADVERTÊNCIA:** Se ocorrer conflitos durante o rebase, resolva-os manualmente antes de continuar.

#### Caso 3: Resolver Conflito de Merge

**Input:**
"Tenho um conflito de merge, como resolvo?"

**Output Esperado:**
```bash
# Verificar arquivos com conflito
git status

# Editar arquivos com conflito (marcados com <<<<<<<<)
# ... editar manualmente ...

# Marcar como resolvido
git add <arquivo_resolvido>

# Continuar o merge
git commit
```

#### Caso 4: Desfazer Último Commit

**Input:**
"Fiz um commit errado, quero desfazer mas manter as mudanças"

**Output Esperado:**
```bash
# Desfazer último commit mas manter mudanças no staging
git reset --soft HEAD~1

# Ou desfazer e mover para unstaged
git reset HEAD~1
```

**⚠️ ADVERTÊNCIA:** Se já fez push, use `git revert` em vez de `git reset`.

## 📚 Workflows Suportados

### Git Flow (Time Grande)

```bash
# Criar branch de feature
git checkout -b feature/feature-name

# Desenvolver e commitar
git add .
git commit -m "feat: add new feature"

# Finalizar feature (merge em develop)
git checkout develop
git merge feature/feature-name
```

### GitHub Flow (Time Pequeno)

```bash
# Branch direto de main
git checkout main
git pull
git checkout -b feature/feature-name

# Criar Pull Request
# Após merge, deletar branch local
git branch -d feature/feature-name
```

### Trunk-Based Development (CI/CD)

```bash
# Branches de vida curta (max 1 dia)
git checkout -b feature/short-lived-feature

# Commit direto e pull request
git push -u origin feature/short-lived-feature
```

## 📝 Notas Técnicas

* **Comandos destrutivos:** O pattern sempre avisa antes de comandos como `git reset --hard`, `git clean -fd`, etc
* **Segurança:** Sempre verifica se há mudanças não commitadas antes de operações perigosas
* **Contexto:** O pattern considera se você está trabalhando solo ou em equipe
* **Explicações:** Cada comando vem com breve explicação do que faz
* **Advertências:** Operações que modificam histórico (rebase, force push) são marcadas com ⚠️

## 🔧 Troubleshooting

* **Comando não encontrado:** Verifique se o Git está instalado: `git --version`
* **Permissões negadas:** Verifique permissões do repositório: `ls -la .git/`
* **Branch não encontrada:** Liste todas as branches: `git branch -a`
* **Conflito de merge:** Use `git status` para identificar arquivos em conflito

## 🔄 Exemplos de Uso

### Fluxo Completo de Feature

```bash
# Passo 1: Atualizar main
git checkout main
git pull origin main

# Passo 2: Criar branch de feature
git checkout -b feature/new-auth

# Passo 3: Desenvolver e commitar
git add .
git commit -m "feat: add OAuth authentication"

# Passo 4: Push e criar PR
git push -u origin feature/new-auth

# Passo 5: Após merge, limpar branches
git checkout main
git pull
git branch -d feature/new-auth
```

### Resgate de Alterações Perdidas

```bash
# Verificar commits perdidos
git reflog

# Recuperar commit específico
git checkout <commit-hash>

# Criar nova branch a partir do commit recuperado
git checkout -b recovered-branch
```