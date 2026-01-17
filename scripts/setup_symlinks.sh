#!/bin/bash

# ============================================
# P3-SKILLS SETUP SCRIPT
# Creates symlinks to p3-skills domains
# ============================================

# Cores para logs
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

# Funções de log
log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Flags
DRY_RUN=false
FORCE=false
VERBOSE=false

# Parse argumentos
while [[ $# -gt 0 ]]; do
  case $1 in
    --dry-run)
      DRY_RUN=true
      shift
      ;;
    --force)
      FORCE=true
      shift
      ;;
    --verbose|-v)
      VERBOSE=true
      shift
      ;;
    --help|-h)
      echo "Uso: $0 [OPTIONS]"
      echo ""
      echo "Opções:"
      echo "  --dry-run    Simula a execução sem criar symlinks"
      echo "  --force      Força recriação de symlinks existentes"
      echo "  --verbose    Mostra mensagens detalhadas"
      echo "  --help       Mostra esta ajuda"
      exit 0
      ;;
    *)
      log_error "Opção desconhecida: $1"
      echo "Use --help para ver as opções disponíveis"
      exit 1
      ;;
  esac
done

# Diretório base do repositório
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$REPO_DIR/skills"

# Verificar se o diretório skills existe
if [[ ! -d "$SKILLS_DIR" ]]; then
  log_error "Diretório skills não encontrado em: $SKILLS_DIR"
  exit 1
fi

log_info "Repositório p3-skills: $REPO_DIR"
log_info "Diretório de skills: $SKILLS_DIR"

# Diretórios de destino (padrão OpenCode e Claude)
TARGET_DIRS=(
  "$HOME/.config/opencode/skill"
  "$HOME/.claude/skills"
)

# Contadores
CREATED=0
SKIPPED=0
ERROR=0

# Iterar sobre cada diretório alvo
for target_dir in "${TARGET_DIRS[@]}"; do
  if [[ ! -d "$target_dir" ]]; then
    if [[ "$VERBOSE" == true ]]; then
      log_warning "Diretório de destino não existe: $target_dir"
    fi
    continue
  fi

  log_info "Processando diretório: $target_dir"

  # Iterar sobre os domínios em skills/
  for domain in "$SKILLS_DIR"/*/; do
    [[ -d "$domain" ]] || continue

    domain_name=$(basename "$domain")
    target_link="$target_dir/$domain_name"

    # Verificar se o symlink já existe
    if [[ -L "$target_link" ]]; then
      existing_target=$(readlink "$target_link")
      
      if [[ "$existing_target" == "$domain" ]]; then
        log_warning "Symlink já existe e aponta para o destino correto: $domain_name"
        ((SKIPPED++))
        continue
      else
        if [[ "$FORCE" == false ]]; then
          log_warning "Symlink existe mas aponta para outro local: $domain_name"
          log_info "   Existente: $existing_target"
          log_info "   Novo:      $domain"
          log_info "   Use --force para recriar"
          ((SKIPPED++))
          continue
        fi
        log_info "Removendo symlink existente (forçado): $domain_name"
        rm "$target_link" || {
          log_error "Falha ao remover symlink: $domain_name"
          ((ERROR++))
          continue
        }
      fi
    elif [[ -e "$target_link" ]]; then
      log_error "Arquivo/diretório existe e não é symlink: $domain_name"
      ((ERROR++))
      continue
    fi

    # Criar symlink
    if [[ "$DRY_RUN" == true ]]; then
      log_info "[DRY-RUN] Criaria symlink: $domain_name -> $domain"
    else
      log_info "Criando symlink: $domain_name"
      ln -s "$domain" "$target_link" || {
        log_error "Falha ao criar symlink: $domain_name"
        ((ERROR++))
        continue
      }
      log_success "Symlink criado: $domain_name"
      ((CREATED++))
    fi
  done
done

# Resumo
echo ""
echo "=========================================="
if [[ "$DRY_RUN" == true ]]; then
  log_info "Execução simulada (dry-run)"
else
  log_success "Setup concluído!"
fi
echo ""
echo "Resumo:"
echo "  Criados:     $CREATED"
echo "  Pulados:     $SKIPPED"
echo "  Erros:       $ERROR"
echo "=========================================="

# Exit code
if [[ $ERROR -gt 0 ]]; then
  exit 1
fi

exit 0
